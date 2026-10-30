import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' hide Column, Batch;
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/providers/labour_state.dart';
import '../../../expenses/application/providers/expense_notifier.dart';
import '../../../expenses/domain/entities/expense_entities.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../batches/application/providers/batch_state.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';

/// Screen 8: Wage Log Details (Unpaid / Paid)
class WageLogDetailsScreen extends ConsumerStatefulWidget {
  final Expense expense;
  final LabourWorker? worker;

  const WageLogDetailsScreen({
    super.key,
    required this.expense,
    this.worker,
  });

  @override
  ConsumerState<WageLogDetailsScreen> createState() => _WageLogDetailsScreenState();
}

class _WageLogDetailsScreenState extends ConsumerState<WageLogDetailsScreen> {
  late Expense _expense;

  @override
  void initState() {
    super.initState();
    _expense = widget.expense;
  }

  Future<void> _markStatus(bool makePaid) async {
    final Future<bool?> dialogFuture = makePaid
        ? ConfirmMarkPaidDialog.show(
            context,
            workerName: _getWorkerName(),
            amount: _expense.amount,
            formattedDate: DateFormat('d MMM yyyy').format(_expense.date),
            shiftName: _getInfo().shiftName,
            onConfirm: () {},
          )
        : ConfirmMarkPendingDialog.show(
            context,
            workerName: _getWorkerName(),
            amount: _expense.amount,
            formattedDate: DateFormat('d MMM yyyy').format(_expense.date),
            shiftName: _getInfo().shiftName,
            onConfirm: () {},
          );

    final confirmed = await dialogFuture;
    if (!mounted || confirmed != true) return;

    try {
      final db = ref.read(appDatabaseProvider);
      final newPaymentMethod = makePaid ? 'Cash' : 'Pending';
      final updatedDesc = makePaid
          ? _expense.description
              .replaceAll('(Pending)', '(Paid)')
              .replaceAll('(Unpaid)', '(Paid)')
              .replaceAll('(Overdue)', '(Paid)')
          : _expense.description.replaceAll('(Paid)', '(Unpaid)');

      await db.transaction(() async {
        await (db.update(db.expensesTable)..where((t) => t.id.equals(_expense.id))).write(
          ExpensesTableCompanion(
            paymentMethod: Value(newPaymentMethod),
            description: Value(updatedDesc),
          ),
        );

        final matchingWages = await (db.select(db.wagesTable)
          ..where((t) => t.netPay.equals(_expense.amount) &
            t.paymentDate.year.equals(_expense.date.year) &
            t.paymentDate.month.equals(_expense.date.month) &
            t.paymentDate.day.equals(_expense.date.day)))
          .get();
        for (final w in matchingWages) {
          await (db.update(db.wagesTable)..where((t) => t.id.equals(w.id))).write(
            WagesTableCompanion(
              paymentMethod: Value(newPaymentMethod),
            ),
          );
        }
      });

      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      await ref.read(labourNotifierProvider.notifier).loadWorkers();

      if (mounted) {
        setState(() {
          _expense = _expense.copyWith(
            description: updatedDesc,
            paymentMethod: newPaymentMethod,
          );
        });
        showLabourSuccessFeedback(
          context,
          title: makePaid ? 'Marked as Paid' : 'Marked as Unpaid',
          subtitle: '₹${_expense.amount.toStringAsFixed(0)} status updated successfully.',
        );
      }
    } catch (e) {
      if (mounted) {
        showLabourErrorFeedback(
          context,
          title: 'Update Failed',
          subtitle: e.toString(),
        );
      }
    }
  }

  Future<void> _deleteWageLog() async {
    final info = _getInfo();
    final formattedDate = DateFormat('d MMM yyyy').format(_expense.date);

    final confirmed = await DeleteWageLogDialog.show(
      context,
      taskTitle: info.taskTitle,
      workerName: info.workerName,
      amount: _expense.amount,
      formattedDate: formattedDate,
      shiftName: info.shiftName,
      onConfirm: () {},
    );

    if (confirmed != true) return;

    try {
      final db = ref.read(appDatabaseProvider);
      await db.transaction(() async {
        // 1. Delete from expensesTable
        await (db.delete(db.expensesTable)..where((t) => t.id.equals(_expense.id))).go();

        // 2. Delete matching wage from wagesTable
        final matchingWages = await (db.select(db.wagesTable)
          ..where((t) => t.netPay.equals(_expense.amount) &
            t.paymentDate.year.equals(_expense.date.year) &
            t.paymentDate.month.equals(_expense.date.month) &
            t.paymentDate.day.equals(_expense.date.day)))
          .get();
        for (final w in matchingWages) {
          await (db.delete(db.wagesTable)..where((t) => t.id.equals(w.id))).go();
        }

        // 3. Delete matching attendance if linked
        final matchingAttendance = await (db.select(db.attendanceTable)
          ..where((t) => t.date.year.equals(_expense.date.year) &
            t.date.month.equals(_expense.date.month) &
            t.date.day.equals(_expense.date.day)))
          .get();
        for (final a in matchingAttendance) {
          if (a.remarks != null && _expense.description.contains(a.remarks!)) {
            await (db.delete(db.attendanceTable)..where((t) => t.id.equals(a.id))).go();
          }
        }
      });

      await ref.read(expenseNotifierProvider.notifier).loadExpenses();
      await ref.read(labourNotifierProvider.notifier).loadWorkers();

      if (mounted) {
        showLabourSuccessFeedback(
          context,
          title: 'Wage Log Deleted',
          subtitle: 'Removed wage log of ₹${_expense.amount.toStringAsFixed(0)} for ${info.workerName}',
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        showLabourErrorFeedback(
          context,
          title: 'Failed to Delete Wage Log',
          subtitle: e.toString(),
        );
      }
    }
  }

  WageLogInfo _getInfo() {
    return WageLogInfo.parse(_expense.description, defaultWorker: widget.worker?.fullName ?? 'Worker');
  }

  String _getWorkerName() {
    return widget.worker?.fullName ?? _getInfo().workerName;
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final info = _getInfo();
    final isPaid = info.isPaid;
    final workerName = _getWorkerName();
    final formattedDate = DateFormat('d MMM yyyy').format(_expense.date);

    final batchState = ref.watch(batchNotifierProvider);
    final allBatches = switch (batchState) {
      BatchStateData(batches: final list) => list,
      _ => <Batch>[],
    };

    final batch = _expense.batchId != null
        ? allBatches.where((b) => b.id == _expense.batchId).firstOrNull
        : null;
    final batchName = batch != null ? batch.batchName : 'Batch 1 - Mock';

    final labourState = ref.watch(labourNotifierProvider);
    final allWorkers = switch (labourState) {
      LabourStateData(workers: final list) => list,
      _ => <LabourWorker>[],
    };
    final matchedWorker = widget.worker ??
        allWorkers.where((w) => w.fullName.toLowerCase().trim() == workerName.toLowerCase().trim()).firstOrNull;

    final phoneNumber = matchedWorker?.phoneNumber ?? '+91 7418669138';

    // Extract notes if present
    String notes = '-';
    if (_expense.description.contains('Notes:')) {
      notes = _expense.description.split('Notes:').last.trim();
      if (notes.isEmpty) notes = '-';
    }

    return Scaffold(
      backgroundColor: LabourColors.background,
      appBar: AppBar(
        backgroundColor: LabourColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: LabourColors.primaryText),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Wage Log Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: LabourColors.primaryText,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: LabourColors.primaryText),
            onSelected: (val) {
              if (val == 'delete') {
                _deleteWageLog();
              }
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete_outline_rounded, size: 18, color: LabourColors.error),
                    SizedBox(width: 8),
                    Text('Delete Wage Log', style: TextStyle(color: LabourColors.error)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
                child: Column(
                  children: [
                    // Worker Header Card (Screen 8 Reference)
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: LabourColors.cardSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: LabourColors.border),
                      ),
                      child: Row(
                        children: [
                          WorkerAvatar(worker: matchedWorker, name: workerName, size: 48),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  workerName,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: LabourColors.primaryText,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  phoneNumber,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: LabourColors.secondaryText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Payment Status Badge
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isPaid ? LabourColors.softGreenSurface : LabourColors.softAmberSurface,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              isPaid ? 'Paid' : 'Unpaid',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: isPaid ? LabourColors.forestGreen : const Color(0xFFD97706),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Information Details Card (Screen 8 Reference)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: LabourColors.cardSurface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: LabourColors.border),
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(
                            icon: Icons.eco_outlined,
                            iconColor: LabourColors.forestGreen,
                            label: 'Work Type',
                            value: info.taskTitle,
                          ),
                          const Divider(height: 20, color: LabourColors.borderLight),
                          _buildDetailRow(
                            icon: Icons.calendar_today_outlined,
                            iconColor: LabourColors.secondaryText,
                            label: 'Date',
                            value: formattedDate,
                          ),
                          const Divider(height: 20, color: LabourColors.borderLight),
                          _buildDetailRow(
                            icon: Icons.wb_sunny_outlined,
                            iconColor: const Color(0xFFD97706),
                            label: 'Shift',
                            value: '${info.shiftName}\n${info.shiftTimeRange}',
                          ),
                          const Divider(height: 20, color: LabourColors.borderLight),
                          _buildDetailRow(
                            icon: Icons.layers_outlined,
                            iconColor: LabourColors.secondaryText,
                            label: 'Batch',
                            value: batchName,
                          ),
                          const Divider(height: 20, color: LabourColors.borderLight),
                          _buildDetailRow(
                            icon: Icons.currency_rupee_rounded,
                            iconColor: LabourColors.forestGreen,
                            label: 'Amount',
                            value: currency.format(_expense.amount),
                            isBold: true,
                          ),
                          const Divider(height: 20, color: LabourColors.borderLight),
                          _buildDetailRow(
                            icon: Icons.access_time_rounded,
                            iconColor: isPaid ? LabourColors.forestGreen : const Color(0xFFD97706),
                            label: 'Payment Status',
                            value: isPaid ? 'Paid' : 'Unpaid',
                            valueColor: isPaid ? LabourColors.forestGreen : const Color(0xFFD97706),
                            isBold: true,
                          ),
                          const Divider(height: 20, color: LabourColors.borderLight),
                          _buildDetailRow(
                            icon: Icons.note_outlined,
                            iconColor: LabourColors.secondaryText,
                            label: 'Notes',
                            value: notes,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Actions Bar (Screen 8 & 9 Reference)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: const BoxDecoration(
                color: LabourColors.cardSurface,
                border: Border(top: BorderSide(color: LabourColors.border)),
              ),
              child: Row(
                children: [
                  if (!isPaid) ...[
                    // Action 1: Edit
                    OutlinedButton.icon(
                      onPressed: () => context.push('/labour/attendance', extra: _expense),
                      icon: const Icon(Icons.edit_outlined, size: 16, color: LabourColors.primaryText),
                      label: const Text('Edit', style: TextStyle(fontWeight: FontWeight.w700, color: LabourColors.primaryText)),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        side: const BorderSide(color: LabourColors.border),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Action 2: Mark as Paid
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _markStatus(true),
                        icon: const Icon(
                          Icons.check_circle_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Mark as Paid',
                          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white, fontSize: 13),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: LabourColors.forestGreen,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Action 3: Delete
                    OutlinedButton(
                      onPressed: _deleteWageLog,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                        side: const BorderSide(color: LabourColors.error),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Delete', style: TextStyle(fontWeight: FontWeight.w700, color: LabourColors.error)),
                    ),
                  ] else ...[
                    // When Paid: Edit and Delete only (NO Mark as Unpaid - auditable financial records)
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => context.push('/labour/attendance', extra: _expense),
                        icon: const Icon(Icons.edit_outlined, size: 16, color: LabourColors.primaryText),
                        label: const Text('Edit Wage Log', style: TextStyle(fontWeight: FontWeight.w700, color: LabourColors.primaryText)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: LabourColors.border),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _deleteWageLog,
                        icon: const Icon(Icons.delete_outline_rounded, size: 16, color: LabourColors.error),
                        label: const Text('Delete', style: TextStyle(fontWeight: FontWeight.w700, color: LabourColors.error)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: LabourColors.error),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    Color? valueColor,
    bool isBold = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 12),
        Text(
          label,
          style: const TextStyle(fontSize: 13, color: LabourColors.secondaryText),
        ),
        const Spacer(),
        Expanded(
          flex: 2,
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
              color: valueColor ?? LabourColors.primaryText,
              height: 1.3,
            ),
          ),
        ),
      ],
    );
  }
}
