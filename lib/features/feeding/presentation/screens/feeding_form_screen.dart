import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/feeding_entities.dart';
import '../../application/providers/feeding_notifier.dart';

class FeedingFormScreen extends ConsumerStatefulWidget {
  final String? initialBatchId;
  const FeedingFormScreen({super.key, this.initialBatchId});

  @override
  ConsumerState<FeedingFormScreen> createState() => _FeedingFormScreenState();
}

class _FeedingFormScreenState extends ConsumerState<FeedingFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _batchIdController;
  late TextEditingController _quantityController;
  late TextEditingController _roundController;
  
  LeafType _leafType = LeafType.v1;

  @override
  void initState() {
    super.initState();
    _batchIdController = TextEditingController(text: widget.initialBatchId ?? 'mock_batch_id');
    _quantityController = TextEditingController(text: '50');
    _roundController = TextEditingController(text: '1');
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final log = FeedingLog(
        id: const Uuid().v4(),
        batchId: _batchIdController.text,
        date: DateTime.now(),
        time: '${DateTime.now().hour}:${DateTime.now().minute}',
        leafType: _leafType,
        leafAge: 'mature',
        leafQuantity: double.tryParse(_quantityController.text) ?? 0.0,
        feedingRound: int.tryParse(_roundController.text) ?? 1,
      );

      // In real scenario, inventoryItemId would be selected from a dropdown of available leaf inventory items.
      final success = await ref.read(feedingNotifierProvider.notifier).logFeeding(log, inventoryItemId: 'inv_mock_id');
      
      if (success && mounted) {
        context.pop();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to save feeding log')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(title: const Text('Log Feeding')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            TextFormField(
              controller: _batchIdController,
              decoration: const InputDecoration(labelText: 'Batch ID'),
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<LeafType>(
              initialValue: _leafType,
              decoration: const InputDecoration(labelText: 'Leaf Type'),
              items: LeafType.values.map((t) => DropdownMenuItem(value: t, child: Text(t.name.toUpperCase()))).toList(),
              onChanged: (v) => setState(() => _leafType = v!),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: 'Quantity (kg)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _roundController,
              decoration: const InputDecoration(labelText: 'Feeding Round (e.g. 1, 2)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: _save,
              child: const Text('Save Feeding'),
            ),
          ],
        ),
      ),
    );
  }
}
