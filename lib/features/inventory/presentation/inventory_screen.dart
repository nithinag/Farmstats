import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: FarmAppBar(title: 'Inventory'),
      body: Center(child: Text('Inventory Placeholder')),
    );
  }
}
