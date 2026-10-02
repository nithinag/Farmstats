import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';

class BatchScreen extends StatelessWidget {
  const BatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: FarmAppBar(title: 'Batches'),
      body: Center(child: Text('Batches Placeholder')),
    );
  }
}
