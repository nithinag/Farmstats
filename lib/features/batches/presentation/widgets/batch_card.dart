import 'package:flutter/material.dart';
import '../../../../shared/widgets/buttons_and_cards.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../domain/entities/batch_entities.dart';
import '../../../../core/theme/spacing.dart';

class BatchCard extends StatelessWidget {
  final Batch batch;
  final VoidCallback onTap;

  const BatchCard({super.key, required this.batch, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    batch.batchName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  _buildStatusChip(context, batch.status),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 4),
                  Text('Started: ${batch.startDate.toShortDate()}'),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.bug_report, size: 16),
                  const SizedBox(width: 4),
                  Text('${batch.silkwormVariety} • ${batch.numberOfDfls} DFLs'),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              LinearProgressIndicator(
                value: batch.currentAgeDays / 30.0, // approx max days
                backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Stage: ${batch.currentStage.name}'),
                  Text('Day ${batch.currentAgeDays}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, BatchStatus status) {
    Color color;
    switch (status) {
      case BatchStatus.active:
        color = Colors.blue;
        break;
      case BatchStatus.completed:
      case BatchStatus.harvested:
        color = Colors.green;
        break;
      case BatchStatus.cancelled:
        color = Colors.red;
        break;
      case BatchStatus.planned:
        color = Colors.orange;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        status.name.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
