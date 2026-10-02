import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: FarmAppBar(title: 'Reports'),
      body: Center(child: Text('Reports Placeholder')),
    );
  }
}
