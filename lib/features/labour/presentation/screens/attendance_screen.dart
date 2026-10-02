import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';

class AttendanceScreen extends ConsumerWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Daily Attendance'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {}, // Future: History view
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Attendance saved for today')));
          context.pop();
        },
        icon: const Icon(Icons.save),
        label: const Text('Save All'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: const [
          ListTile(
            title: Text('John Doe'),
            subtitle: Text('Supervisor'),
            trailing: Checkbox(value: true, onChanged: null),
          ),
          ListTile(
            title: Text('Jane Smith'),
            subtitle: Text('Feeder'),
            trailing: Checkbox(value: true, onChanged: null),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.xl),
              child: Text('Attendance UI wired to real data on next iterations'),
            ),
          )
        ],
      ),
    );
  }
}
