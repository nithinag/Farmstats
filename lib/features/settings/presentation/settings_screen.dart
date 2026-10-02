import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../application/providers/settings_notifier.dart';
import '../application/providers/settings_state.dart';
import '../domain/entities/settings_entities.dart';
import '../../../../data/providers/database_provider.dart';
import '../../expenses/application/providers/expense_notifier.dart';
import '../../income/application/providers/income_notifier.dart';
import '../../dashboard/application/providers/dashboard_notifier.dart';
import '../../reports/application/providers/reports_notifier.dart';
import 'package:flutter_dynamic_icon_plus/flutter_dynamic_icon_plus.dart';

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
                        backgroundColor: AppColorScheme.primaryLight,
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

  Future<void> _showAppIconPicker(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(AppSpacing.md),
                child: Text('Choose App Icon', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE8F5E9),
                  child: Icon(Icons.eco, color: Color(0xFF2E7D32)),
                ),
                title: const Text('Default Farm (Green)'),
                onTap: () async {
                  try {
                    await FlutterDynamicIconPlus.setAlternateIconName(iconName: null);
                  } catch (e) {
                    debugPrint('Failed to set icon: $e');
                  }
                  if (context.mounted) Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFE3F2FD),
                  child: Icon(Icons.agriculture, color: Color(0xFF1565C0)),
                ),
                title: const Text('Alternate Modern (Blue)'),
                onTap: () async {
                  try {
                    await FlutterDynamicIconPlus.setAlternateIconName(iconName: 'icon_alt1'); 
                  } catch (e) {
                    debugPrint('Failed to set icon: $e');
                  }
                  if (context.mounted) Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFFFF3E0),
                  child: Icon(Icons.egg_outlined, color: Color(0xFFE65100)),
                ),
                title: const Text('Silkworm Edition'),
                onTap: () async {
                  try {
                    await FlutterDynamicIconPlus.setAlternateIconName(iconName: 'icon_dark');
                  } catch (e) {
                    debugPrint('Failed to set icon: $e');
                  }
                  if (context.mounted) Navigator.pop(context);
                },
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsNotifierProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final prefs = (state is SettingsStateData) 
        ? state.preferences 
        : const AppPreferences();

    final isDarkMode = prefs.themeMode == ThemeModePreference.dark;

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        children: [
          // Section: DATA
          _buildSectionHeader(context, 'DATA & BACKUPS'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              _buildSettingsTile(
                context,
                title: 'Backup & Restore',
                subtitle: 'Manage local snapshots & restorations',
                icon: Icons.backup_outlined,
                onTap: () => context.push('/settings/backup'),
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'Export Data (CSV / JSON)',
                subtitle: 'Download complete farm records',
                icon: Icons.file_download_outlined,
                onTap: () => context.push('/settings/backup'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Section: REPORTS
          _buildSectionHeader(context, 'REPORTS'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              _buildSettingsTile(
                context,
                title: 'Export PDF Report',
                subtitle: 'Generate formatted financial statement',
                icon: Icons.picture_as_pdf_outlined,
                onTap: () => context.push('/reports'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Section: APPEARANCE
          _buildSectionHeader(context, 'APPEARANCE'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              SwitchListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 2),
                secondary: Icon(
                  Icons.dark_mode_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                subtitle: Text(
                  'Optimized for low-light farm operations',
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
                value: isDarkMode,
                activeThumbColor: AppColorScheme.primaryLight,
                onChanged: (val) {
                  if (state is SettingsStateData) {
                    final newMode = val ? ThemeModePreference.dark : ThemeModePreference.light;
                    ref.read(settingsNotifierProvider.notifier).savePreferences(
                          prefs.copyWith(themeMode: newMode),
                        );
                  }
                },
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'App Icon',
                subtitle: 'Customize application icon',
                icon: Icons.app_shortcut_outlined,
                onTap: () => _showAppIconPicker(context),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Section: LOCALIZATION
          _buildSectionHeader(context, 'LOCALIZATION & UNITS'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              _buildSettingsTile(
                context,
                title: 'Currency',
                subtitle: 'Financial currency unit',
                icon: Icons.currency_rupee,
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark ? AppColorScheme.surfaceContainerDark : const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                  ),
                  child: const Text(
                    'INR (₹)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ),
                onTap: () => context.push('/settings/preferences'),
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'Units & Preferences',
                subtitle: 'Weight (kg) • Temperature (°C)',
                icon: Icons.tune_outlined,
                onTap: () => context.push('/settings/preferences'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Section: APPLICATION
          _buildSectionHeader(context, 'APPLICATION'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              _buildSettingsTile(
                context,
                title: 'Farm Profile',
                subtitle: 'Sericulture rearing configuration',
                icon: Icons.business_outlined,
                onTap: () => context.push('/settings/profile'),
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'About FARMSTATS',
                subtitle: 'Version 1.0.0 (Production Release)',
                icon: Icons.info_outline,
                onTap: () => context.push('/settings/about'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // Section: DANGER ZONE
          _buildSectionHeader(context, 'DANGER ZONE', color: AppColorScheme.error),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            borderColor: AppColorScheme.error.withValues(alpha: 0.3),
            children: [
              _buildSettingsTile(
                context,
                title: 'Reset All Data',
                subtitle: 'Erase all batches, transactions & items',
                icon: Icons.delete_forever_outlined,
                textColor: AppColorScheme.error,
                iconColor: AppColorScheme.error,
                onTap: () => _showResetConfirmation(context, ref),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: AppSpacing.xs),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color ?? Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.8,
            ),
      ),
    );
  }

  Widget _buildGroupCard({
    required BuildContext context,
    required bool isDark,
    required List<Widget> children,
    Color? borderColor,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: borderColor ?? (isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight),
          width: 1,
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
    Color? textColor,
    Color? iconColor,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 2),
      leading: Icon(
        icon,
        color: iconColor ?? Theme.of(context).colorScheme.onSurfaceVariant,
        size: 22,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: textColor ?? Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
              ),
            )
          : null,
      trailing: trailing ??
          Icon(
            Icons.chevron_right,
            size: 20,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
      onTap: onTap,
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 1,
      indent: 52,
      color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.25),
    );
  }
}

