import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/inventory_entities.dart';

class InventoryFormScreen extends ConsumerStatefulWidget {
  final InventoryItem? item;
  const InventoryFormScreen({super.key, this.item});

  @override
  ConsumerState<InventoryFormScreen> createState() => _InventoryFormScreenState();
}

class _InventoryFormScreenState extends ConsumerState<InventoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _nameController;
  late TextEditingController _unitController;
  late TextEditingController _currentQtyController;
  late TextEditingController _minQtyController;
  late TextEditingController _maxQtyController;
  late TextEditingController _priceController;
  
  String _categoryId = 'cat_1'; // Hardcoded for demo/sprint
  
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.item?.name ?? '');
    _unitController = TextEditingController(text: widget.item?.unit ?? 'kg');
    _currentQtyController = TextEditingController(text: widget.item?.currentQuantity.toString() ?? '0.0');
    _minQtyController = TextEditingController(text: widget.item?.minimumQuantity.toString() ?? '10.0');
    _maxQtyController = TextEditingController(text: widget.item?.maximumQuantity?.toString() ?? '');
    _priceController = TextEditingController(text: widget.item?.purchasePrice.toString() ?? '0.0');
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Item saved successfully!')));
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text(widget.item != null ? 'Edit Item' : 'Add Item'),
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
              decoration: const InputDecoration(labelText: 'Item Name'),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _categoryId,
                    decoration: const InputDecoration(labelText: 'Category'),
                    items: const [
                      DropdownMenuItem(value: 'cat_1', child: Text('Mulberry Leaves')),
                      DropdownMenuItem(value: 'cat_2', child: Text('Medicines')),
                      DropdownMenuItem(value: 'cat_3', child: Text('Equipment')),
                    ],
                    onChanged: (v) => setState(() => _categoryId = v!),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextFormField(
                    controller: _unitController,
                    decoration: const InputDecoration(labelText: 'Unit (kg, lit, pcs)'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _currentQtyController,
                    decoration: const InputDecoration(labelText: 'Current Qty'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(labelText: 'Unit Price (₹)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _minQtyController,
                    decoration: const InputDecoration(labelText: 'Min Qty (Alert)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextFormField(
                    controller: _maxQtyController,
                    decoration: const InputDecoration(labelText: 'Max Qty (Capacity)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: _save,
              child: const Text('Save Item'),
            ),
          ],
        ),
      ),
    );
  }
}
