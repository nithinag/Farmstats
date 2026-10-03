import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/widgets/feedback_views.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../domain/entities/batch_entities.dart';
import '../../application/providers/batch_notifier.dart';
import '../../application/providers/batch_state.dart';

class BatchListScreen extends ConsumerStatefulWidget {
  const BatchListScreen({super.key});

  @override
  ConsumerState<BatchListScreen> createState() => _BatchListScreenState();
}

class _BatchListScreenState extends ConsumerState<BatchListScreen> {
  int _selectedSegment = 0; // 0: Active, 1: Completed

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(batchNotifierProvider);
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BaseScaffold(
      appBar: AppBar(
        title: const Text(
          'Batches',
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
        ),
        centerTitle: false,
        backgroundColor: isDark ? AppColorScheme.backgroundDark : AppColorScheme.backgroundLight,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => context.push('/batch/add'),
            icon: Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColorScheme.primary,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 20),
            ),
            tooltip: 'Start New Batch',
          ),
          const SizedBox(width: AppSpacing.xs),
        ],
      ),
      body: switch (state) {
        BatchStateInitial() || BatchStateLoading() => const DashboardSkeletonLoader(),
        BatchStateError() => ErrorView(
            error: 'Unable to load batches. Tap to reload your farm data.',
            onRetry: () => ref.read(batchNotifierProvider.notifier).loadBatches(),
          ),
        BatchStateData(batches: final batches) => RefreshIndicator(
            onRefresh: () => ref.read(batchNotifierProvider.notifier).loadBatches(),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.xs, AppSpacing.md, 80),
              children: [
                // Segmented Pill Selector [Active] | [Completed]
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey.shade900 : const Color(0xFFE5E9E6),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _segmentButton('Active', _selectedSegment == 0, () => setState(() => _selectedSegment = 0)),
                      ),
                      Expanded(
                        child: _segmentButton('Completed', _selectedSegment == 1, () => setState(() => _selectedSegment = 1)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),

                if (_selectedSegment == 0) ...[
                  // Active Batches View
                  _buildActiveBatchesView(context, batches, currency, isDark),
                ] else ...[
                  // Completed Batches View
                  _buildCompletedBatchesView(context, batches, currency, isDark),
                ],
              ],
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }

  Widget _segmentButton(String label, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColorScheme.primary.withValues(alpha: 0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              color: isSelected ? Colors.white : Colors.grey.shade700,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveBatchesView(BuildContext context, List<Batch> batches, NumberFormat currency, bool isDark) {
    final activeBatches = batches.where((b) => b.status == BatchStatus.active || b.status == BatchStatus.planned).toList();
    final completedBatches = batches.where((b) => b.status == BatchStatus.completed || b.status == BatchStatus.harvested).toList();

    if (activeBatches.isEmpty && completedBatches.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: EmptyStateView(
          title: 'No Batches Created',
          message: 'Start Batch #001 to begin tracking your sericulture rearing lifecycle.',
          icon: Icons.layers_outlined,
          onAction: () => context.push('/batch/add'),
          actionLabel: 'Start Batch #001',
        ),
      );
    }

    final activeBatch = activeBatches.firstOrNull;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (activeBatch != null) ...[
          // Active Batch Hero Card
          _buildActiveBatchCard(context, activeBatch),
          const SizedBox(height: AppSpacing.lg),
        ],

        // Completed Batches Section Header
        if (completedBatches.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Completed Batches',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Icon(Icons.tune_outlined, size: 18, color: Colors.grey.shade600),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          ...completedBatches.map((b) => _buildCompletedBatchItem(context, b, currency, isDark)),
        ],
      ],
    );
  }

  Widget _buildActiveBatchCard(BuildContext context, Batch batch) {
    final durationDays = batch.expectedHarvestDate.difference(batch.startDate).inDays;
    final totalDuration = durationDays > 0 ? durationDays : 30;
    final currentDay = batch.currentAgeDays > 0 ? batch.currentAgeDays : (DateTime.now().difference(batch.startDate).inDays + 1);
    final progress = (currentDay / totalDuration.toDouble()).clamp(0.0, 1.0);

    return InkWell(
      onTap: () => context.push('/batch/${batch.id}', extra: batch),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: const LinearGradient(
            colors: [Color(0xFF1B4332), Color(0xFF2D6A4F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF1B4332).withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  batch.batchName,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: const Text(
                    'Active',
                    style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              'Day $currentDay / $totalDuration',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13),
            ),
            const SizedBox(height: AppSpacing.sm),

            // Progress Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.pill),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF81C784)),
              ),
            ),
            const SizedBox(height: AppSpacing.md),

            Row(
              children: [
                const Icon(Icons.layers_outlined, color: Colors.white70, size: 14),
                const SizedBox(width: 4),
                Text('${batch.numberOfDfls} DFLs', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(width: 16),
                const Icon(Icons.calendar_today_outlined, color: Colors.white70, size: 14),
                const SizedBox(width: 4),
                Text('Started ${DateFormat('dd MMM yyyy').format(batch.startDate)}', style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 11)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedBatchItem(BuildContext context, Batch b, NumberFormat currency, bool isDark) {
    final duration = b.actualHarvestDate != null
        ? b.actualHarvestDate!.difference(b.startDate).inDays
        : b.expectedHarvestDate.difference(b.startDate).inDays;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: InkWell(
        onTap: () => context.push('/batch/${b.id}', extra: b),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: isDark ? AppColorScheme.surfaceContainerDark : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5E9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.spa_outlined, color: Color(0xFF2E7D32), size: 24),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(b.batchName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8F5E9),
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                          ),
                          child: const Text(
                            'Completed',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${duration > 0 ? duration : 28} Days • ${b.numberOfDfls} DFLs',
                      style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Text('⚖️ 80 kg', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                        Text(' • ', style: TextStyle(color: Colors.grey)),
                        Text('💰 ₹42,300', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                        Text(' • ', style: TextStyle(color: Colors.grey)),
                        Text('📈 ₹20,400', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF2E7D32))),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompletedBatchesView(BuildContext context, List<Batch> batches, NumberFormat currency, bool isDark) {
    final completedBatches = batches.where((b) => b.status == BatchStatus.completed).toList();
    if (completedBatches.isEmpty) {
      return const Padding(
        padding: EdgeInsets.only(top: 40),
        child: EmptyStateView(
          title: 'No Completed Batches',
          message: 'When you complete a rearing batch, historical yield, revenue & expense records will appear here.',
          icon: Icons.history,
        ),
      );
    }

    return Column(
      children: completedBatches.map((b) => _buildCompletedBatchItem(context, b, currency, isDark)).toList(),
    );
  }
}
