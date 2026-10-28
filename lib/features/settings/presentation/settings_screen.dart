import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../shared/widgets/farmer_avatar.dart';
import '../application/providers/settings_notifier.dart';
import '../application/providers/settings_state.dart';
import '../application/providers/language_provider.dart';
import '../domain/entities/settings_entities.dart';
import '../../../../data/providers/database_provider.dart';
import '../../expenses/application/providers/expense_notifier.dart';
import '../../income/application/providers/income_notifier.dart';
import '../../dashboard/application/providers/dashboard_notifier.dart';
import '../../reports/application/providers/reports_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _showResetConfirmation(BuildContext context, WidgetRef ref) async {
    final db = ref.read(appDatabaseProvider);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: AppColorScheme.error),
              SizedBox(width: 8),
              Text('Reset All Data?'),
            ],
          ),
          content: const Text(
            'This action is irreversible and will permanently wipe all batch records, expenses, revenues, labour entries, harvest data, and inventory items.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColorScheme.error,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                Navigator.pop(context);
                try {
                  await db.transaction(() async {
                    await db.customStatement('DELETE FROM batches;');
                    await db.customStatement('DELETE FROM expenses;');
                    await db.customStatement('DELETE FROM incomes;');
                    await db.customStatement('DELETE FROM inventory_items;');
                    await db.customStatement('DELETE FROM workers;');
                    await db.customStatement('DELETE FROM feeding_logs;');
                    await db.customStatement('DELETE FROM harvests;');
                    await db.customStatement('DELETE FROM notifications;');
                  });

                  ref.read(expenseNotifierProvider.notifier).loadExpenses();
                  ref.read(incomeNotifierProvider.notifier).loadIncomes();
                  ref.read(dashboardAggregatorProvider.notifier).loadDashboard();
                  ref.read(reportsNotifierProvider.notifier).loadReports();

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('All farm data has been reset successfully.'),
                        backgroundColor: AppColorScheme.forestGreen,
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Reset failed: $e'),
                        backgroundColor: AppColorScheme.error,
                      ),
                    );
                  }
                }
              },
              child: const Text('Reset Everything'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsNotifierProvider);
    final languageCode = ref.watch(languageProvider);

    final currentLang = kSupportedLanguages.firstWhere(
      (l) => l.code == languageCode,
      orElse: () => kSupportedLanguages[1],
    );

    final profile = (state is SettingsStateData)
        ? state.profile
        : const FarmProfile(
            farmName: 'My Sericulture Farm',
            ownerName: 'Nithin Nagabushanam',
            address: 'Chittoor, Andhra Pradesh',
          );

    final displayName = profile.ownerName.isNotEmpty ? profile.ownerName : 'Farmer';
    final displayFarmName = profile.farmName.isNotEmpty ? profile.farmName : 'My Sericulture Farm';

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
        children: [
          // 1. SECTION: FARM PROFILE NAVIGATION ROW
          _buildSectionHeader('FARM PROFILE'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.push('/settings/profile'),
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      FarmerAvatar(
                        photoPath: profile.photoPath,
                        name: displayName,
                        size: 46,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Farm Profile',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '$displayName • $displayFarmName',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right, size: 22, color: Color(0xFF94A3B8)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // 2. SECTION: PREFERENCES
          _buildSectionHeader('PREFERENCES'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildValueRow(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  value: currentLang.englishName,
                  onTap: () => context.push('/settings/language'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildValueRow(
                  icon: Icons.currency_rupee,
                  title: 'Currency',
                  value: 'INR (₹)',
                  onTap: () => context.push('/settings/preferences'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildValueRow(
                  icon: Icons.straighten_outlined,
                  title: 'Units',
                  value: 'kg, °C, Acres',
                  onTap: () => context.push('/settings/preferences'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // 3. SECTION: APP & DATA
          _buildSectionHeader('APP & DATA'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildActionRow(
                  icon: Icons.backup_outlined,
                  title: 'Backup & Restore',
                  onTap: () => context.push('/settings/backup'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildActionRow(
                  icon: Icons.file_download_outlined,
                  title: 'Export Records (CSV)',
                  onTap: () => context.push('/settings/backup'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildActionRow(
                  icon: Icons.info_outline,
                  title: 'About FARMSTATS',
                  onTap: () => context.push('/settings/about'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Danger Zone / Reset
          Center(
            child: TextButton.icon(
              onPressed: () => _showResetConfirmation(context, ref),
              icon: const Icon(Icons.delete_outline, size: 18, color: Color(0xFFDC2626)),
              label: const Text(
                'Reset All Data',
                style: TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ),
          // Ample bottom padding for bottom navigation
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF64748B),
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildValueRow({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF64748B)),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, size: 18, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRow({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF64748B)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                ),
              ),
            ),
            const Icon(Icons.chevron_right, size: 18, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }
}
