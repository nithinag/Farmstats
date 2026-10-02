import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../domain/entities/income_entities.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';

class IncomeCard extends StatelessWidget {
  final Income income;
  final VoidCallback onTap;

  const IncomeCard({super.key, required this.income, required this.onTap});

  @override
  Widget build(BuildContext context) {
    IconData getIcon(String iconName) {
      switch (iconName) {
        case 'egg': return Icons.egg;
        case 'eco': return Icons.eco;
        case 'agriculture': return Icons.agriculture;
        default: return Icons.monetization_on;
      }
    }

    final color = _parseColor(income.category.colorCode);

    return Semantics(
      label: 'Income: ${income.buyer.name}, Amount: ${income.netAmount}, Date: ${income.saleDate.toShortDate()}',
      child: Container(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(AppRadius.md),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Stacked Date Block
                SizedBox(
                  width: 44,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('dd').format(income.saleDate),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      Text(
                        DateFormat('MMM').format(income.saleDate).toUpperCase(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                // Divider line
                Container(
                  width: 1,
                  height: 36,
                  color: Colors.grey.withValues(alpha: 0.2),
                ),
                const SizedBox(width: AppSpacing.md),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        income.buyer.name,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            getIcon(income.category.iconName),
                            size: 14,
                            color: color,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${income.quantity}kg • ${income.cocoonGrade} • ${income.paymentMethod}',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                // Price & Status
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      income.netAmount.toCurrency(),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: income.paymentStatus == 'Paid'
                            ? const Color(0xFFE8F5E9)
                            : const Color(0xFFFFEBEE),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        income.paymentStatus,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: income.paymentStatus == 'Paid'
                                  ? const Color(0xFF2E7D32)
                                  : const Color(0xFFC62828),
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 300.ms).slideX(begin: 0.1, end: 0);
  }

  Color _parseColor(String hexCode) {
    hexCode = hexCode.replaceAll('#', '');
    if (hexCode.length == 6) {
      hexCode = 'FF$hexCode';
    }
    return Color(int.parse(hexCode, radix: 16));
  }
}
