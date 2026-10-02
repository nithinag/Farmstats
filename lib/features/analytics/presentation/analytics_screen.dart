import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: FarmAppBar(title: 'Analytics'),
      body: Center(child: Text('Analytics Placeholder')),
    );
  }
}
