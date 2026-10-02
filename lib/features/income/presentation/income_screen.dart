import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: FarmAppBar(title: 'Income'),
      body: Center(child: Text('Income Placeholder')),
    );
  }
}
