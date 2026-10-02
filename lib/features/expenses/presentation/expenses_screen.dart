import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: FarmAppBar(title: 'Expenses'),
      body: Center(child: Text('Expenses Placeholder')),
    );
  }
}
