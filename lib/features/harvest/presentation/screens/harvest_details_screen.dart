import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/harvest_entities.dart';

class HarvestDetailsScreen extends StatelessWidget {
  final HarvestRecord harvest;

  const HarvestDetailsScreen({super.key, required this.harvest});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(title: Text('Harvest: ${harvest.batchId}')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Production Metrics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: AppSpacing.sm),
                  Text('Yield: ${harvest.metrics.yieldPercentage}%'),
                  Text('FCR (Feed Conversion Ratio): ${harvest.metrics.feedConversionRatio}'),
                  Text('Survival Rate: ${harvest.metrics.survivalRate}%'),
                  Text('Harvest Efficiency: ${harvest.metrics.harvestEfficiency}%'),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Grade Distribution', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: AppSpacing.sm),
                  Text('Grade A: ${harvest.gradeDistribution.gradeAWeight} kg'),
                  Text('Grade B: ${harvest.gradeDistribution.gradeBWeight} kg'),
                  Text('Grade C: ${harvest.gradeDistribution.gradeCWeight} kg'),
                  Text('Rejected: ${harvest.gradeDistribution.rejectedWeight} kg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
