import 'package:flutter/material.dart';
import '../theme/labour_theme.dart';
import 'labour_components.dart';
import '../../domain/entities/labour_entities.dart';

class WorkerCard extends StatelessWidget {
  final LabourWorker worker;
  final double totalEarned;
  final VoidCallback onTap;

  const WorkerCard({
    super.key,
    required this.worker,
    this.totalEarned = 0.0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: LabourColors.cardSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: LabourColors.border),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              WorkerAvatar(worker: worker, size: 46),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      worker.fullName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: LabourColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      worker.phoneNumber,
                      style: const TextStyle(
                        fontSize: 12,
                        color: LabourColors.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Daily Wage: ₹${worker.dailyWage.toStringAsFixed(0)}',
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
                  const Text(
                    'Total Earned',
                    style: TextStyle(
                      fontSize: 11,
                      color: LabourColors.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '₹${totalEarned.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: LabourColors.forestGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
