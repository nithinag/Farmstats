import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../shared/extensions/extensions.dart';
import '../../../../core/theme/spacing.dart';
import '../../domain/entities/labour_entities.dart';

class WorkerDetailsScreen extends ConsumerWidget {
  final LabourWorker worker;
  const WorkerDetailsScreen({super.key, required this.worker});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: BaseScaffold(
        appBar: AppBar(
          title: Text(worker.fullName),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Profile'),
              Tab(text: 'Assignments'),
              Tab(text: 'Wages'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => context.push('/labour/${worker.id}/edit', extra: worker),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            _buildProfile(context),
            const Center(child: Text('Assignments UI Placeholder')),
            const Center(child: Text('Wages UI Placeholder')),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.md),
      children: [
        ListTile(
          leading: const Icon(Icons.phone),
          title: const Text('Phone Number'),
          subtitle: Text(worker.phoneNumber),
        ),
        ListTile(
          leading: const Icon(Icons.work),
          title: const Text('Role'),
          subtitle: Text(worker.role.name.toUpperCase()),
        ),
        ListTile(
          leading: const Icon(Icons.attach_money),
          title: const Text('Daily Wage'),
          subtitle: Text('₹${worker.dailyWage}'),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today),
          title: const Text('Joined'),
          subtitle: Text(worker.joiningDate.toShortDate()),
        ),
      ],
    );
  }
}
