import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/labour_theme.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/services/worker_photo_service.dart';

/// Worker Avatar supporting persistent local photo or initials with pastel background
class WorkerAvatar extends StatefulWidget {
  final LabourWorker? worker;
  final String name;
  final String? initialPhotoPath;
  final double size;
  final Color? fallbackBgColor;

  const WorkerAvatar({
    super.key,
    this.worker,
    this.name = 'Worker',
    this.initialPhotoPath,
    this.size = 44.0,
    this.fallbackBgColor,
  });

  @override
  State<WorkerAvatar> createState() => _WorkerAvatarState();
}

class _WorkerAvatarState extends State<WorkerAvatar> {
  String? _photoPath;

  @override
  void initState() {
    super.initState();
    _photoPath = widget.initialPhotoPath;
    _loadPhoto();
  }

  @override
  void didUpdateWidget(WorkerAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialPhotoPath != widget.initialPhotoPath ||
        oldWidget.worker?.id != widget.worker?.id) {
      _photoPath = widget.initialPhotoPath;
      _loadPhoto();
    }
  }

  Future<void> _loadPhoto() async {
    if (widget.initialPhotoPath != null) return;
    if (widget.worker != null) {
      final path = await WorkerPhotoService.getPhotoPath(widget.worker!.id);
      if (mounted && path != null) {
        setState(() => _photoPath = path);
      }
    }
  }

  Color _getInitialsBg(String name) {
    if (widget.fallbackBgColor != null) return widget.fallbackBgColor!;
    final firstChar = name.isNotEmpty ? name[0].toUpperCase() : 'W';
    switch (firstChar) {
      case 'R':
        return const Color(0xFFD1FAE5); // soft emerald
      case 'S':
        return const Color(0xFFFFE4E6); // soft rose/coral
      case 'K':
        return const Color(0xFFDBEAFE); // soft blue
      case 'N':
        return const Color(0xFFEAF1E8); // soft sage
      default:
        return const Color(0xFFF4E9DB); // soft earth
    }
  }

  Color _getInitialsTextColor(String name) {
    final firstChar = name.isNotEmpty ? name[0].toUpperCase() : 'W';
    switch (firstChar) {
      case 'R':
        return const Color(0xFF047857);
      case 'S':
        return const Color(0xFFBE123C);
      case 'K':
        return const Color(0xFF1D4ED8);
      case 'N':
        return LabourColors.forestGreen;
      default:
        return LabourColors.earthBrown;
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayName = widget.worker?.fullName ?? widget.name;
    final initials = displayName.trim().isNotEmpty ? displayName.trim()[0].toUpperCase() : 'W';

    if (_photoPath != null && File(_photoPath!).existsSync()) {
      return Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: LabourColors.border, width: 1),
          image: DecorationImage(
            image: FileImage(File(_photoPath!)),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    final bgColor = _getInitialsBg(displayName);
    final textColor = _getInitialsTextColor(displayName);

    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: LabourColors.border.withValues(alpha: 0.5), width: 1),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: TextStyle(
          color: textColor,
          fontSize: widget.size * 0.42,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Component 6: Select Work Type Modal Bottom Sheet
class SelectWorkTypeSheet extends StatelessWidget {
  final String selectedTask;
  final ValueChanged<String> onSelected;

  const SelectWorkTypeSheet({
    super.key,
    required this.selectedTask,
    required this.onSelected,
  });

  static Future<String?> show(BuildContext context, String currentTask) {
    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => SelectWorkTypeSheet(
        selectedTask: currentTask,
        onSelected: (task) => Navigator.pop(ctx, task),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: LabourColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Select Work Type',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 14),
            ...LabourWorkType.sericultureTypes.map((type) {
              final isSelected = selectedTask.toLowerCase().trim() == type.title.toLowerCase().trim();
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: isSelected ? LabourColors.softGreenSurface : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? LabourColors.forestGreen : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  leading: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: type.bgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Icon(type.icon, color: type.iconColor, size: 20),
                  ),
                  title: Text(
                    type.title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: LabourColors.primaryText,
                    ),
                  ),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle_rounded, color: LabourColors.forestGreen, size: 22)
                      : null,
                  onTap: () => onSelected(type.title),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

/// Component 8: Worker Search Modal Bottom Sheet
class WorkerPickerSheet extends StatefulWidget {
  final List<LabourWorker> workers;
  final LabourWorker? selectedWorker;
  final ValueChanged<LabourWorker> onSelected;

  const WorkerPickerSheet({
    super.key,
    required this.workers,
    this.selectedWorker,
    required this.onSelected,
  });

  static Future<LabourWorker?> show(
    BuildContext context, {
    required List<LabourWorker> workers,
    LabourWorker? currentWorker,
  }) {
    return showModalBottomSheet<LabourWorker>(
      context: context,
      isScrollControlled: true,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        expand: false,
        builder: (_, scrollController) => WorkerPickerSheet(
          workers: workers,
          selectedWorker: currentWorker,
          onSelected: (worker) => Navigator.pop(ctx, worker),
        ),
      ),
    );
  }

  @override
  State<WorkerPickerSheet> createState() => _WorkerPickerSheetState();
}

class _WorkerPickerSheetState extends State<WorkerPickerSheet> {
  final TextEditingController _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = widget.workers.where((w) {
      if (_query.isEmpty) return true;
      final q = _query.toLowerCase();
      return w.fullName.toLowerCase().contains(q) || w.phoneNumber.contains(q);
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: LabourColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Worker',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 14),
            // Search Input
            Container(
              decoration: BoxDecoration(
                color: LabourColors.background,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: LabourColors.border),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (val) => setState(() => _query = val.trim()),
                decoration: const InputDecoration(
                  hintText: 'Search worker name or phone...',
                  hintStyle: TextStyle(fontSize: 13, color: LabourColors.mutedText),
                  prefixIcon: Icon(Icons.search, color: LabourColors.secondaryText, size: 20),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        _query.isEmpty ? 'No workers available' : 'No workers match "$_query"',
                        style: const TextStyle(fontSize: 13, color: LabourColors.secondaryText),
                      ),
                    )
                  : ListView.separated(
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) => const Divider(height: 1, color: LabourColors.borderLight),
                      itemBuilder: (ctx, index) {
                        final worker = filtered[index];
                        final isSelected = widget.selectedWorker?.id == worker.id;
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          leading: WorkerAvatar(worker: worker, size: 42),
                          title: Text(
                            worker.fullName,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                              color: LabourColors.primaryText,
                            ),
                          ),
                          subtitle: Text(
                            worker.phoneNumber,
                            style: const TextStyle(fontSize: 13, color: LabourColors.secondaryText),
                          ),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle_rounded, color: LabourColors.forestGreen, size: 22)
                              : null,
                          onTap: () => widget.onSelected(worker),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Component 9: Filter Wage Logs Modal Bottom Sheet
class FilterWageLogsSheet extends StatefulWidget {
  final DateTime selectedMonth;
  final List<LabourWorker> workers;
  final String? selectedWorkerId;
  final String selectedStatus; // 'All', 'Paid', 'Pending'
  final Function(DateTime month, String? workerId, String status) onApply;

  const FilterWageLogsSheet({
    super.key,
    required this.selectedMonth,
    required this.workers,
    this.selectedWorkerId,
    required this.selectedStatus,
    required this.onApply,
  });

  static Future<void> show(
    BuildContext context, {
    required DateTime initialMonth,
    required List<LabourWorker> workers,
    String? currentWorkerId,
    required String currentStatus,
    required Function(DateTime month, String? workerId, String status) onApply,
  }) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: LabourColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => FilterWageLogsSheet(
        selectedMonth: initialMonth,
        workers: workers,
        selectedWorkerId: currentWorkerId,
        selectedStatus: currentStatus,
        onApply: onApply,
      ),
    );
  }

  @override
  State<FilterWageLogsSheet> createState() => _FilterWageLogsSheetState();
}

class _FilterWageLogsSheetState extends State<FilterWageLogsSheet> {
  late DateTime _month;
  String? _workerId;
  late String _status;

  @override
  void initState() {
    super.initState();
    _month = widget.selectedMonth;
    _workerId = widget.selectedWorkerId;
    _status = widget.selectedStatus;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: LabourColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Filter Wage Logs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 18),
            // Month Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Month', style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.primaryText)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: LabourColors.background,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: LabourColors.border),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      value: _month.month,
                      isDense: true,
                      icon: const Icon(Icons.arrow_drop_down, color: LabourColors.secondaryText),
                      items: List.generate(12, (i) {
                        final m = i + 1;
                        final date = DateTime(_month.year, m);
                        return DropdownMenuItem(
                          value: m,
                          child: Text(DateFormat('MMMM yyyy').format(date)),
                        );
                      }),
                      onChanged: (newMonth) {
                        if (newMonth != null) {
                          setState(() => _month = DateTime(_month.year, newMonth));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Worker Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Worker', style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.primaryText)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: LabourColors.background,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: LabourColors.border),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String?>(
                      value: _workerId,
                      isDense: true,
                      icon: const Icon(Icons.arrow_drop_down, color: LabourColors.secondaryText),
                      items: [
                        const DropdownMenuItem(value: null, child: Text('All Workers')),
                        ...widget.workers.map((w) => DropdownMenuItem(value: w.id, child: Text(w.fullName))),
                      ],
                      onChanged: (newId) => setState(() => _workerId = newId),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            // Status Chips
            const Text('Status', style: TextStyle(fontWeight: FontWeight.w600, color: LabourColors.primaryText)),
            const SizedBox(height: 10),
            Row(
              children: ['All', 'Paid', 'Pending'].map((st) {
                final isSelected = _status.toLowerCase() == st.toLowerCase();
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text(
                      st,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isSelected ? Colors.white : LabourColors.secondaryText,
                      ),
                    ),
                    selected: isSelected,
                    selectedColor: LabourColors.forestGreen,
                    backgroundColor: LabourColors.background,
                    side: BorderSide(
                      color: isSelected ? LabourColors.forestGreen : LabourColors.border,
                    ),
                    onSelected: (_) => setState(() => _status = st),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _month = DateTime.now();
                        _workerId = null;
                        _status = 'All';
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: LabourColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Clear', style: TextStyle(color: LabourColors.secondaryText, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(_month, _workerId, _status);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.forestGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Apply', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Component 10: Delete Worker Confirmation Dialog
class DeleteWorkerDialog extends StatelessWidget {
  final String workerName;
  final VoidCallback onConfirm;

  const DeleteWorkerDialog({
    super.key,
    required this.workerName,
    required this.onConfirm,
  });

  static Future<bool?> show(BuildContext context, {required String workerName, required VoidCallback onConfirm}) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => DeleteWorkerDialog(workerName: workerName, onConfirm: onConfirm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: LabourColors.cardSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LabourColors.softRedSurface,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.delete_outline_rounded, color: LabourColors.error, size: 28),
            ),
            const SizedBox(height: 18),
            const Text(
              'Delete Worker?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This will remove the worker from your list.\nWage logs will still be kept.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: LabourColors.secondaryText,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: LabourColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: LabourColors.secondaryText, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.forestGreen,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Delete', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Component 11: Feedback Messages (Custom Toast / Banner)
void showLabourSuccessFeedback(BuildContext context, {required String title, required String subtitle}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 3),
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: LabourColors.cardSurface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: LabourColors.forestGreen.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: LabourColors.softGreenSurface,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check_rounded, color: LabourColors.forestGreen, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: LabourColors.primaryText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: LabourColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 18, color: LabourColors.secondaryText),
              onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    ),
  );
}

void showLabourErrorFeedback(BuildContext context, {required String title, required String subtitle}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      duration: const Duration(seconds: 4),
      content: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFFEF2F2),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: LabourColors.error.withValues(alpha: 0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: LabourColors.softRedSurface,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close_rounded, color: LabourColors.error, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: LabourColors.error,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: LabourColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 18, color: LabourColors.secondaryText),
              onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Modal Action Sheet when tapping a Wage Log item
Future<void> showWageLogActionSheet({
  required BuildContext context,
  required String taskTitle,
  required String workerName,
  required String formattedDate,
  required double amount,
  required String status,
  required VoidCallback onToggleStatus,
  required VoidCallback onDelete,
}) {
  final isPaid = status.toLowerCase() == 'paid';
  final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
  final type = LabourWorkType.findForTask(taskTitle);

  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: LabourColors.cardSurface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: LabourColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              // Header Card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: LabourColors.background,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: LabourColors.border),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: type.bgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: Icon(type.icon, color: type.iconColor, size: 24),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskTitle,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: LabourColors.primaryText,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '$workerName • $formattedDate',
                            style: const TextStyle(
                              fontSize: 12,
                              color: LabourColors.secondaryText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          currency.format(amount),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: LabourColors.primaryText,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: isPaid ? LabourColors.softGreenSurface : LabourColors.softAmberSurface,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: isPaid ? LabourColors.forestGreen : const Color(0xFFD97706),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Action 1: Toggle Payment Status
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    onToggleStatus();
                  },
                  icon: Icon(
                    isPaid ? Icons.access_time_rounded : Icons.check_circle_rounded,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: Text(
                    isPaid ? 'Mark as Pending' : 'Mark as Paid',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPaid ? const Color(0xFFD97706) : LabourColors.forestGreen,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Action 2: Delete Wage Log
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(ctx);
                    onDelete();
                  },
                  icon: const Icon(Icons.delete_outline_rounded, size: 18, color: LabourColors.error),
                  label: const Text(
                    'Delete Wage Log',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: LabourColors.error),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LabourColors.softRedSurface,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// Delete Wage Log Confirmation Dialog
class DeleteWageLogDialog extends StatelessWidget {
  final String taskTitle;
  final String workerName;
  final double amount;
  final VoidCallback onConfirm;

  const DeleteWageLogDialog({
    super.key,
    required this.taskTitle,
    required this.workerName,
    required this.amount,
    required this.onConfirm,
  });

  static Future<bool?> show(
    BuildContext context, {
    required String taskTitle,
    required String workerName,
    required double amount,
    required VoidCallback onConfirm,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => DeleteWageLogDialog(
        taskTitle: taskTitle,
        workerName: workerName,
        amount: amount,
        onConfirm: onConfirm,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: LabourColors.cardSurface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: LabourColors.softRedSurface,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.delete_outline_rounded, color: LabourColors.error, size: 28),
            ),
            const SizedBox(height: 18),
            const Text(
              'Delete Wage Log?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: LabourColors.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Are you sure you want to delete this wage log of ${currency.format(amount)} for $workerName?\nThis will remove the wage record and corresponding expense.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                height: 1.4,
                color: LabourColors.secondaryText,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: LabourColors.border),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Cancel', style: TextStyle(color: LabourColors.secondaryText, fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                      onConfirm();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: LabourColors.error,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                    ),
                    child: const Text('Delete', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
