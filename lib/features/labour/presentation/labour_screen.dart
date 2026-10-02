import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';

class LabourScreen extends StatelessWidget {
  const LabourScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: FarmAppBar(title: 'Labour'),
      body: Center(child: Text('Labour Placeholder')),
    );
  }
}
