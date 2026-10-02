import 'package:flutter/material.dart';
import '../../../../shared/widgets/buttons_and_cards.dart';
import '../../domain/entities/inventory_entities.dart';
import '../../../../core/theme/spacing.dart';

class InventoryCard extends StatelessWidget {
  final InventoryItem item;
  final VoidCallback onTap;

  const InventoryCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bool isLowStock = item.currentQuantity <= item.minimumQuantity;
    
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
                  Expanded(
                    child: Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _buildStatusChip(context, isLowStock),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Icon(Icons.category, size: 16, color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 4),
                  Text(item.category.name),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              LinearProgressIndicator(
                value: item.maximumQuantity != null 
                    ? (item.currentQuantity / item.maximumQuantity!).clamp(0.0, 1.0)
                    : 0.5,
                backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
                color: isLowStock ? Colors.red : Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${item.currentQuantity} ${item.unit} available'),
                  if (item.expiryDate != null)
                    Text('Exp: ${item.expiryDate!.day}/${item.expiryDate!.month}/${item.expiryDate!.year}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.orange)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, bool isLowStock) {
    if (item.status == InventoryStatus.outOfStock) {
      return const _Chip(color: Colors.red, label: 'OUT OF STOCK');
    }
    if (isLowStock) {
      return const _Chip(color: Colors.orange, label: 'LOW STOCK');
    }
    return const _Chip(color: Colors.green, label: 'IN STOCK');
  }
}

class _Chip extends StatelessWidget {
  final Color color;
  final String label;
  const _Chip({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
