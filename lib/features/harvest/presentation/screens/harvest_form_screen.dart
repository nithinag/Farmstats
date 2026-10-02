import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/harvest_entities.dart';
import '../../application/providers/harvest_notifier.dart';

class HarvestFormScreen extends ConsumerStatefulWidget {
  const HarvestFormScreen({super.key});

  @override
  ConsumerState<HarvestFormScreen> createState() => _HarvestFormScreenState();
}

class _HarvestFormScreenState extends ConsumerState<HarvestFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _batchIdController;
  late TextEditingController _grossWeightController;
  late TextEditingController _netWeightController;
  late TextEditingController _rejectedWeightController;
  late TextEditingController _gradeAController;
  late TextEditingController _gradeBController;
  late TextEditingController _gradeCController;

  bool _generateIncome = true;

  @override
  void initState() {
    super.initState();
    _batchIdController = TextEditingController(text: 'batch_1');
    _grossWeightController = TextEditingController(text: '105.0');
    _netWeightController = TextEditingController(text: '100.0');
    _rejectedWeightController = TextEditingController(text: '5.0');
    _gradeAController = TextEditingController(text: '70.0');
    _gradeBController = TextEditingController(text: '20.0');
    _gradeCController = TextEditingController(text: '10.0');
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final harvest = HarvestRecord(
        id: const Uuid().v4(),
        batchId: _batchIdController.text,
        harvestDate: DateTime.now(),
        actualHarvestDuration: 4.5, // Mocked duration
        grossWeight: double.parse(_grossWeightController.text),
        netSaleableWeight: double.parse(_netWeightController.text),
        rejectedWeight: double.parse(_rejectedWeightController.text),
        moisturePercentage: 12.0, // Mocked
        wastePercentage: 2.0, // Mocked
        averageCocoonSize: 1.8, // Mocked
        gradeDistribution: CocoonGrade(
          gradeAWeight: double.parse(_gradeAController.text),
          gradeBWeight: double.parse(_gradeBController.text),
          gradeCWeight: double.parse(_gradeCController.text),
          rejectedWeight: double.parse(_rejectedWeightController.text),
        ),
        metrics: const ProductionMetrics(
          yieldPercentage: 92.5,
          survivalRate: 95.0,
          feedConversionRatio: 2.1,
          mortalityPercentage: 5.0,
          harvestEfficiency: 88.0,
        ),
      );

      final success = await ref.read(harvestNotifierProvider.notifier).saveHarvest(harvest, generateIncomeRecord: _generateIncome);
      
      if (success && mounted) {
        context.pop();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to save harvest. Check validation rules.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(title: const Text('Log Harvest')),
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
            const Divider(),
            const Text('Weights (kg)', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _grossWeightController,
              decoration: const InputDecoration(labelText: 'Gross Weight'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _netWeightController,
              decoration: const InputDecoration(labelText: 'Net Saleable Weight'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _rejectedWeightController,
              decoration: const InputDecoration(labelText: 'Rejected Weight'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppSpacing.md),
            const Divider(),
            const Text('Grade Distribution (kg)', style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              controller: _gradeAController,
              decoration: const InputDecoration(labelText: 'Grade A'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _gradeBController,
              decoration: const InputDecoration(labelText: 'Grade B'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _gradeCController,
              decoration: const InputDecoration(labelText: 'Grade C'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppSpacing.md),
            SwitchListTile(
              title: const Text('Generate Income Record Automatically'),
              subtitle: const Text('Creates a sales entry in the Income ledger'),
              value: _generateIncome,
              onChanged: (v) => setState(() => _generateIncome = v),
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: _save,
              child: const Text('Finalize Harvest'),
            ),
          ],
        ),
      ),
    );
  }
}
