import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';

class WorkerFormScreen extends ConsumerStatefulWidget {
  final LabourWorker? worker;
  const WorkerFormScreen({super.key, this.worker});

  @override
  ConsumerState<WorkerFormScreen> createState() => _WorkerFormScreenState();
}

class _WorkerFormScreenState extends ConsumerState<WorkerFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _wageController;
  
  WorkerRole _role = WorkerRole.other;
  WorkerStatus _status = WorkerStatus.active;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.worker?.fullName ?? '');
    _phoneController = TextEditingController(text: widget.worker?.phoneNumber ?? '');
    _wageController = TextEditingController(text: widget.worker?.dailyWage.toString() ?? '500.0');
    if (widget.worker != null) {
      _role = widget.worker!.role;
      _status = widget.worker!.status;
    }
  }

  void _save() async {
    if (_formKey.currentState!.validate()) {
      final worker = LabourWorker(
        id: widget.worker?.id ?? const Uuid().v4(),
        fullName: _nameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        role: _role,
        dailyWage: double.tryParse(_wageController.text) ?? 0.0,
        joiningDate: widget.worker?.joiningDate ?? DateTime.now(),
        status: _status,
      );

      bool success;
      if (widget.worker != null) {
        success = await ref.read(labourNotifierProvider.notifier).updateWorker(worker);
      } else {
        success = await ref.read(labourNotifierProvider.notifier).addWorker(worker);
      }

      if (success && mounted) {
        context.pop();
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to save worker')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text(widget.worker != null ? 'Edit Worker' : 'Add Worker'),
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
              decoration: const InputDecoration(labelText: 'Full Name'),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<WorkerRole>(
              initialValue: _role,
              decoration: const InputDecoration(labelText: 'Role'),
              items: WorkerRole.values.map((r) => DropdownMenuItem(value: r, child: Text(r.name.toUpperCase()))).toList(),
              onChanged: (v) => setState(() => _role = v!),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _wageController,
              decoration: const InputDecoration(labelText: 'Daily Wage (₹)'),
              keyboardType: TextInputType.number,
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            DropdownButtonFormField<WorkerStatus>(
              initialValue: _status,
              decoration: const InputDecoration(labelText: 'Status'),
              items: WorkerStatus.values.map((s) => DropdownMenuItem(value: s, child: Text(s.name.toUpperCase()))).toList(),
              onChanged: (v) => setState(() => _status = v!),
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: _save,
              child: const Text('Save Worker'),
            ),
          ],
        ),
      ),
    );
  }
}
