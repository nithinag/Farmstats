import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';

class HealthTrackingScreen extends StatelessWidget {
  const HealthTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: AppBar(title: const Text('Health & Mortality')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            color: Colors.red.withValues(alpha: 0.1),
            child: const ListTile(
              leading: Icon(Icons.warning, color: Colors.red),
              title: Text('Log Mortality'),
              subtitle: Text('Record dead count and reasons'),
              trailing: Icon(Icons.add),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            color: Colors.blue.withValues(alpha: 0.1),
            child: const ListTile(
              leading: Icon(Icons.medical_services, color: Colors.blue),
              title: Text('Log Treatment'),
              subtitle: Text('Record medicines and dosages applied'),
              trailing: Icon(Icons.add),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(AppSpacing.xl),
            child: Center(
              child: Text('Health logs will be integrated tightly with Batches in upcoming cross-module orchestration sprints.'),
            ),
          )
        ],
      ),
    );
  }
}
