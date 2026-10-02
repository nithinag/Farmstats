import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../application/providers/settings_notifier.dart';
import '../application/providers/settings_state.dart';
import '../application/providers/language_provider.dart';
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.md),
                  child: Text(
                    'Choose Application Icon',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F5E9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.eco, color: Color(0xFF2E7D32)),
                  ),
                  title: const Text('FARMSTATS Default (Agricultural Green)'),
                  subtitle: const Text('Official Sericulture OS icon'),
                  trailing: const Icon(Icons.check_circle, color: AppColorScheme.primary),
                  onTap: () async {
                    try {
                      await FlutterDynamicIconPlus.setAlternateIconName(iconName: null);
                    } catch (e) {
                      debugPrint('Icon switch notice: $e');
                    }
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE3F2FD),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.agriculture, color: Color(0xFF1565C0)),
                  ),
                  title: const Text('Modern Blue Edition'),
                  subtitle: const Text('Cool modern farm theme'),
                  onTap: () async {
                    try {
                      await FlutterDynamicIconPlus.setAlternateIconName(iconName: 'icon_alt1');
                    } catch (e) {
                      debugPrint('Icon switch notice: $e');
                    }
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF3E0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.egg_outlined, color: Color(0xFFE65100)),
                  ),
                  title: const Text('Silkworm Edition (Amber)'),
                  subtitle: const Text('Cocoon and rearing edition'),
                  onTap: () async {
                    try {
                      await FlutterDynamicIconPlus.setAlternateIconName(iconName: 'icon_dark');
                    } catch (e) {
                      debugPrint('Icon switch notice: $e');
                    }
                    if (context.mounted) Navigator.pop(context);
                  },
                ),
                const SizedBox(height: AppSpacing.sm),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty || parts[0].isEmpty) return 'F';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsNotifierProvider);
    final languageCode = ref.watch(languageProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final currentLang = kSupportedLanguages.firstWhere(
      (l) => l.code == languageCode,
      orElse: () => kSupportedLanguages[1],
    );

    final profile = (state is SettingsStateData)
        ? state.profile
        : const FarmProfile(farmName: 'My Sericulture Farm', ownerName: 'Farmer');

    final prefs = (state is SettingsStateData)
        ? state.preferences
        : const AppPreferences();

    final isDarkMode = prefs.themeMode == ThemeModePreference.dark;
    final displayName = profile.ownerName.isNotEmpty ? profile.ownerName : 'Farmer';
    final displayFarmName = profile.farmName.isNotEmpty ? profile.farmName : 'My Sericulture Farm';

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        children: [
          // 1. TOP PROFILE HERO CARD
          _buildProfileHeroCard(context, displayName, displayFarmName, profile.address, isDark),
          const SizedBox(height: AppSpacing.lg),

          // 2. Section: FARM
          _buildSectionHeader(context, 'FARM IDENTITY'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              _buildSettingsTile(
                context,
                title: 'Farm Profile',
                subtitle: 'Farmer name, farm identity, contact details',
                icon: Icons.badge_outlined,
                onTap: () => context.push('/settings/profile'),
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'Farm Configuration',
                subtitle: 'Rearing houses, area & mulberry varieties',
                icon: Icons.business_outlined,
                onTap: () => context.push('/settings/profile'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // 3. Section: PREFERENCES
          _buildSectionHeader(context, 'PREFERENCES & REGIONAL'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              _buildSettingsTile(
                context,
                title: 'Language / भाषा / భాష',
                subtitle: '${currentLang.nativeName} (${currentLang.englishName})',
                icon: Icons.translate,
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark ? AppColorScheme.surfaceContainerDark : const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                  ),
                  child: Text(
                    currentLang.nativeName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                ),
                onTap: () => context.push('/settings/language'),
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'Currency',
                subtitle: 'Financial currency formatting',
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
                title: 'Units & Measurements',
                subtitle: 'Weight (kg) • Temperature (°C) • Area (acres)',
                icon: Icons.tune_outlined,
                onTap: () => context.push('/settings/preferences'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // 4. Section: APPEARANCE
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
                  'Optimized for low-light night rearing checks',
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
                subtitle: 'Choose launcher appearance style',
                icon: Icons.app_shortcut_outlined,
                onTap: () => _showAppIconPicker(context),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // 5. Section: DATA & BACKUPS
          _buildSectionHeader(context, 'DATA & BACKUPS'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              _buildSettingsTile(
                context,
                title: 'Backup & Restore',
                subtitle: 'Local database backup & snapshot management',
                icon: Icons.backup_outlined,
                onTap: () => context.push('/settings/backup'),
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'Export Data (CSV / JSON)',
                subtitle: 'Download complete offline farm records',
                icon: Icons.file_download_outlined,
                onTap: () => context.push('/settings/backup'),
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'Export PDF Report',
                subtitle: 'Generate formatted batch & financial statements',
                icon: Icons.picture_as_pdf_outlined,
                onTap: () => context.push('/reports'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // 6. Section: APPLICATION & SUPPORT
          _buildSectionHeader(context, 'APPLICATION'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              SwitchListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 2),
                secondary: Icon(
                  Icons.notifications_outlined,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                title: Text(
                  'Notifications & Reminders',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                subtitle: Text(
                  'Feeding alerts, stock warnings & milestones',
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
                value: prefs.enableNotifications,
                activeThumbColor: AppColorScheme.primaryLight,
                onChanged: (val) {
                  if (state is SettingsStateData) {
                    ref.read(settingsNotifierProvider.notifier).savePreferences(
                          prefs.copyWith(enableNotifications: val),
                        );
                  }
                },
              ),
              _buildDivider(context),
              _buildSettingsTile(
                context,
                title: 'About FARMSTATS',
                subtitle: 'Version 1.0.0 (Production Sericulture OS)',
                icon: Icons.info_outline,
                onTap: () => context.push('/settings/about'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),

          // 7. Section: DANGER ZONE
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
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  Widget _buildProfileHeroCard(
    BuildContext context,
    String displayName,
    String displayFarmName,
    String address,
    bool isDark,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceLight,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push('/settings/profile'),
          borderRadius: BorderRadius.circular(AppRadius.lg),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1B5E20), Color(0xFF43A047)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColorScheme.primary.withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      _getInitials(displayName),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),

                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayName,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        displayFarmName,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColorScheme.primaryLight,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF222B22) : const Color(0xFFE8F5E9),
                              borderRadius: BorderRadius.circular(AppRadius.xs),
                            ),
                            child: const Text(
                              '🐛 Sericulture Farm',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Arrow
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColorScheme.primaryLight,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 14, color: AppColorScheme.primaryLight),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSpacing.xs, bottom: AppSpacing.xs),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color ?? Colors.grey[600],
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
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
        color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceLight,
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
    required String subtitle,
    required IconData icon,
    Widget? trailing,
    Color? textColor,
    Color? iconColor,
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
              color: textColor,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
      ),
      trailing: trailing ?? const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildDivider(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Divider(
      height: 1,
      thickness: 1,
      color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
    );
  }
}
