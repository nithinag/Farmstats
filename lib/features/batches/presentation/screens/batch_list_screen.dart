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

class _BatchListScreenState extends ConsumerState<BatchListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(batchNotifierProvider);
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Rearing Batches'),
        backgroundColor: AppColorScheme.primary,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: AppColorScheme.primaryLight,
          indicatorWeight: 3,
          tabs: const [
            Tab(text: 'Active Batches'),
            Tab(text: 'Completed History'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/batch/add'),
        backgroundColor: AppColorScheme.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Start New Batch'),
      ),
      body: switch (state) {
        BatchStateInitial() || BatchStateLoading() => const DashboardSkeletonLoader(),
        BatchStateError() => ErrorView(
            error: 'Unable to load batches. Tap to reload your farm data.',
            onRetry: () => ref.read(batchNotifierProvider.notifier).loadBatches(),
          ),
        BatchStateData(batches: final batches) => TabBarView(
            controller: _tabController,
            children: [
              // TAB 1: ACTIVE BATCHES
              _buildBatchList(
                context,
                batches.where((b) => b.status != BatchStatus.completed && b.status != BatchStatus.cancelled).toList(),
                isActiveTab: true,
                currency: currency,
              ),
              // TAB 2: COMPLETED BATCHES
              _buildBatchList(
                context,
                batches.where((b) => b.status == BatchStatus.completed || b.status == BatchStatus.cancelled).toList(),
                isActiveTab: false,
                currency: currency,
              ),
            ],
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }

  Widget _buildBatchList(
    BuildContext context,
    List<Batch> list, {
    required bool isActiveTab,
    required NumberFormat currency,
  }) {
    if (list.isEmpty) {
      return EmptyStateView(
        title: isActiveTab ? 'No Active Batches' : 'No Completed Batches',
        message: isActiveTab
            ? 'Start your next silkworm rearing cycle to begin tracking operations.'
            : 'Completed batch records and harvest summaries will appear here.',
        icon: Icons.bug_report_outlined,
      );
    }

    return RefreshIndicator(
      onRefresh: () => ref.read(batchNotifierProvider.notifier).loadBatches(),
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, 80),
        itemCount: list.length,
        separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
        itemBuilder: (context, index) {
          final b = list[index];
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              side: BorderSide(
                color: b.status == BatchStatus.active
                    ? AppColorScheme.primaryLight.withValues(alpha: 0.5)
                    : Colors.grey.shade200,
                width: b.status == BatchStatus.active ? 1.5 : 1.0,
              ),
            ),
            child: InkWell(
              onTap: () => context.push('/batch/${b.id}', extra: b),
              borderRadius: BorderRadius.circular(AppRadius.md),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          b.batchName,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: b.status == BatchStatus.active
                                ? Colors.green.shade100
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(AppRadius.pill),
                          ),
                          child: Text(
                            b.status.name.toUpperCase(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: b.status == BatchStatus.active ? Colors.green.shade900 : Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${b.numberOfDfls} DFLs (${b.silkwormVariety}) • Started ${DateFormat('dd MMM yyyy').format(b.startDate)}',
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    ),
                    const Divider(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.timer_outlined, size: 16, color: AppColorScheme.primary),
                            const SizedBox(width: 4),
                            Text('Day ${b.currentAgeDays}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                        Text(
                          'Stage: ${b.currentStage.name.toUpperCase()}',
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColorScheme.primary),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
