import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/batch_entities.dart';
import '../../application/providers/batch_notifier.dart';
import 'package:uuid/uuid.dart';

class BatchFormScreen extends ConsumerStatefulWidget {
  final Batch? batch;
  const BatchFormScreen({super.key, this.batch});

  @override
  ConsumerState<BatchFormScreen> createState() => _BatchFormScreenState();
}

class _BatchFormScreenState extends ConsumerState<BatchFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _nameController;
  late TextEditingController _dflsController;
  late TextEditingController _dflPriceController;
  late TextEditingController _tempController;
  late TextEditingController _humController;
  late TextEditingController _notesController;

  InstarStage _currentStage = InstarStage.first;
  BatchStatus _status = BatchStatus.planned;
  
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.batch?.batchName ?? '');
    _dflsController = TextEditingController(text: widget.batch?.numberOfDfls.toString() ?? '');
    _dflPriceController = TextEditingController(text: widget.batch?.dflPrice?.toString() ?? '');
    _tempController = TextEditingController(text: widget.batch?.temperature.toString() ?? '25.0');
    _humController = TextEditingController(text: widget.batch?.humidity.toString() ?? '75.0');
    _notesController = TextEditingController(text: widget.batch?.notes ?? '');
    
    if (widget.batch != null) {
      _currentStage = widget.batch!.currentStage;
      _status = widget.batch!.status;
    }
  }

  Future<void> _save() async {
    if (_formKey.currentState!.validate()) {
      final batch = Batch(
        id: widget.batch?.id ?? const Uuid().v4(),
        batchName: _nameController.text,
        startDate: widget.batch?.startDate ?? DateTime.now(),
        expectedHarvestDate: widget.batch?.expectedHarvestDate ?? DateTime.now().add(const Duration(days: 28)),
        actualHarvestDate: widget.batch?.actualHarvestDate,
        silkwormVariety: widget.batch?.silkwormVariety ?? 'CSR2',
        eggSource: widget.batch?.eggSource ?? 'Default CRC',
        numberOfDfls: int.tryParse(_dflsController.text) ?? 0,
        dflPrice: double.tryParse(_dflPriceController.text),
        mulberryVariety: widget.batch?.mulberryVariety ?? 'V1',
        rearingHouse: widget.batch?.rearingHouse ?? 'House 1',
        currentStage: _currentStage,
        currentAgeDays: widget.batch?.currentAgeDays ?? 1,
        status: _status,
        healthStatus: widget.batch?.healthStatus ?? HealthStatus.good,
        temperature: double.tryParse(_tempController.text) ?? 25.0,
        humidity: double.tryParse(_humController.text) ?? 75.0,
        notes: _notesController.text.isEmpty ? null : _notesController.text,
      );

      final notifier = ref.read(batchNotifierProvider.notifier);
      bool success;
      if (widget.batch == null) {
        success = await notifier.addBatch(batch);
      } else {
        success = await notifier.updateBatch(batch, widget.batch!);
      }

      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Batch saved successfully!')));
        context.pop();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save batch.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text(widget.batch != null ? 'Edit Batch' : 'Create Batch'),
        actions: [
          IconButton(icon: const Icon(Icons.check), onPressed: _save),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Batch Name'),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _dflsController,
                    decoration: const InputDecoration(labelText: 'Number of DFLs'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextFormField(
                    controller: _dflPriceController,
                    decoration: const InputDecoration(labelText: 'DFL Price (₹)'),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<BatchStatus>(
                    initialValue: _status,
                    decoration: const InputDecoration(labelText: 'Status'),
                    items: BatchStatus.values.map((s) => DropdownMenuItem(value: s, child: Text(s.name))).toList(),
                    onChanged: (v) => setState(() => _status = v!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<InstarStage>(
              initialValue: _currentStage,
              decoration: const InputDecoration(labelText: 'Current Stage'),
              items: InstarStage.values.map((s) => DropdownMenuItem(value: s, child: Text(s.name))).toList(),
              onChanged: (v) => setState(() => _currentStage = v!),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _tempController,
                    decoration: const InputDecoration(labelText: 'Temp (°C)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextFormField(
                    controller: _humController,
                    decoration: const InputDecoration(labelText: 'Humidity (%)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(labelText: 'Notes'),
              maxLines: 3,
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: _save,
              child: const Text('Save Batch'),
            ),
          ],
        ),
      ),
    );
  }
}
