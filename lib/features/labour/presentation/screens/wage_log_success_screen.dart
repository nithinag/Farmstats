import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import '../../domain/entities/labour_entities.dart';

/// Screen 3: Success Screen ("Wage log added!")
class WageLogSuccessScreen extends StatelessWidget {
  final String workerName;
  final double amount;
  final String taskTitle;
  final String shiftName;
  final LabourWorker? worker;

  const WageLogSuccessScreen({
    super.key,
    required this.workerName,
    required this.amount,
    required this.taskTitle,
    required this.shiftName,
    this.worker,
  });

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return Scaffold(
      backgroundColor: LabourColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Celebration Icon & Confetti dots (Screen 3 Reference)
              Stack(
                alignment: Alignment.center,
                children: [
                  // Decorative celebration particles
                  Positioned(
                    top: 0,
                    left: 20,
                    child: _buildConfettiDot(const Color(0xFFF59E0B), 6),
                  ),
                  Positioned(
                    top: 10,
                    right: 30,
                    child: _buildConfettiDot(const Color(0xFFEF4444), 5),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 30,
                    child: _buildConfettiDot(const Color(0xFF3B82F6), 5),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 24,
                    child: _buildConfettiDot(LabourColors.forestGreen, 6),
                  ),
                  Positioned(
                    top: 25,
                    left: 4,
                    child: _buildConfettiDot(const Color(0xFF10B981), 4),
                  ),
                  Positioned(
                    top: 28,
                    right: 8,
                    child: _buildConfettiDot(const Color(0xFF8B5CF6), 4),
                  ),

                  // Large Checkmark Badge
                  Container(
                    width: 76,
                    height: 76,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: LabourColors.forestGreen,
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 44,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Title
              const Text(
                'Wage log added!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: LabourColors.primaryText,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$workerName has been added for today.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: LabourColors.secondaryText,
                ),
              ),
              const SizedBox(height: 28),

              // Summary Card (Screen 3 Reference)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: LabourColors.cardSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: LabourColors.border),
                ),
                child: Row(
                  children: [
                    WorkerAvatar(worker: worker, name: workerName, size: 48),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                workerName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: LabourColors.primaryText,
                                ),
                              ),
                              Text(
                                currency.format(amount),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: LabourColors.primaryText,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '$taskTitle\n$shiftName',
                            style: const TextStyle(
                              fontSize: 12,
                              color: LabourColors.secondaryText,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Action 1: Add Another Worker (Screen 3 Primary Button)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to Workers Home to choose another worker
                    context.go('/labour');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: LabourColors.forestGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Add Another Worker',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Action 2: View Today's Workers (Screen 3 Secondary Button)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    context.go('/labour');
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: LabourColors.cardSurface,
                    foregroundColor: LabourColors.primaryText,
                    side: const BorderSide(color: LabourColors.border),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    "View Today's Workers",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: LabourColors.primaryText),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConfettiDot(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
