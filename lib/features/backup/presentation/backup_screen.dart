import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';

class BackupScreen extends StatelessWidget {
  const BackupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      appBar: FarmAppBar(title: 'Backup'),
      body: Center(child: Text('Backup Placeholder')),
    );
  }
}
