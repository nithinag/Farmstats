import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../application/providers/backup_notifier.dart';
import '../../application/providers/backup_state.dart';
import '../../domain/entities/backup_entities.dart';

class BackupDashboardScreen extends ConsumerWidget {
  const BackupDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(backupNotifierProvider);

    ref.listen(backupNotifierProvider, (previous, next) {
      if (next is BackupStateError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: const Color(0xFFC62828)),
        );
      } else if (next is BackupStateSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.message), backgroundColor: const Color(0xFF2E7D32)),
        );
      }
    });

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Data Backup'),
        elevation: 0,
      ),
      body: switch (state) {
        BackupStateInitial() => const Center(child: Text('Initializing...')),
        BackupStateLoading() => const Center(child: CircularProgressIndicator()),
        _ => ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              // Main Backup Card with Diagram
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Export your data and keep it safe',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    // Phone to File Diagram
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Phone Wrapper
                        Container(
                          width: 60,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF2E7D32), width: 3),
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFE8F5E9),
                          ),
                          child: const Center(
                            child: Icon(Icons.storage_rounded, color: Color(0xFF2E7D32), size: 32),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        // Arrow
                        const Icon(Icons.arrow_forward_rounded, color: Colors.grey, size: 28),
                        const SizedBox(width: AppSpacing.md),
                        // JSON File Wrapper
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.description, color: Colors.amber, size: 36),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'farm_backup.json',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                                  ),
                                  Text(
                                    '2.4 MB',
                                    style: TextStyle(color: Colors.grey, fontSize: 11),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'You can store this file in Drive / WhatsApp / Laptop',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.lg),

                    // Export Buttons Row
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => ref.read(backupNotifierProvider.notifier).createBackup(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E7D32),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                            ),
                            child: const Text('Export JSON', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => ref.read(backupNotifierProvider.notifier).createBackup(),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF2E7D32)),
                              foregroundColor: const Color(0xFF2E7D32),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(AppRadius.md),
                              ),
                            ),
                            child: const Text('Export Database', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Key Benefits Grid
              Text(
                'Key Benefits',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppSpacing.md),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildBenefitItem(context, 'Works Offline', Icons.wifi_off, const Color(0xFF2E7D32)),
                    _buildBenefitItem(context, 'Fast & Smooth', Icons.speed, const Color(0xFF1565C0)),
                    _buildBenefitItem(context, 'Farmer Friendly', Icons.eco, const Color(0xFFEF6C00)),
                    _buildBenefitItem(context, 'Secure & Private', Icons.security, const Color(0xFF7B1FA2)),
                    _buildBenefitItem(context, 'Reliable Backup', Icons.cloud_done, const Color(0xFF00695C)),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Backup History Section
              Text(
                'Backup History',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildHistorySection(state, ref, context),
            ],
          ),
      },
    );
  }

  Widget _buildBenefitItem(BuildContext context, String title, IconData icon, Color color) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: color,
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistorySection(BackupState state, WidgetRef ref, BuildContext context) {
    List<BackupMetadata> history = [];
    if (state is BackupStateData) {
      history = state.history;
    } else {
      final current = ref.read(backupNotifierProvider);
      if (current is BackupStateData) {
        history = current.history;
      }
    }

    if (history.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.lg),
        alignment: Alignment.center,
        child: Text(
          'No backups available.',
          style: TextStyle(color: Colors.grey[500]),
        ),
      );
    }

    return Column(
      children: history.map((b) {
        return Container(
          margin: const EdgeInsets.only(bottom: AppSpacing.sm),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(
              color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFE8F5E9),
              child: Icon(Icons.storage, color: Color(0xFF2E7D32)),
            ),
            title: Text(b.fileName, overflow: TextOverflow.ellipsis),
            subtitle: Text('Size: ${(b.fileSizeBytes / 1024 / 1024).toStringAsFixed(2)} MB • Checksum Valid'),
            trailing: IconButton(
              icon: const Icon(Icons.restore, color: Color(0xFF2E7D32)),
              tooltip: 'Restore this backup',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Confirm Restore'),
                    content: const Text('Restoring this backup will replace all current data. This action cannot be undone.'),
                    actions: [
                      TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(ctx);
                          ref.read(backupNotifierProvider.notifier).restoreBackup(b);
                        },
                        child: const Text('Restore', style: TextStyle(color: Color(0xFFC62828))),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }).toList(),
    );
  }
}
