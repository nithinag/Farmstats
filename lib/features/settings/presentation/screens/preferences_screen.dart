import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../application/providers/settings_notifier.dart';
import '../../application/providers/settings_state.dart';
import '../../application/providers/language_provider.dart';
import '../../domain/entities/settings_entities.dart';

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsNotifierProvider);
    final languageCode = ref.watch(languageProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final currentLang = kSupportedLanguages.firstWhere(
      (l) => l.code == languageCode,
      orElse: () => kSupportedLanguages[1],
    );

    if (state is! SettingsStateData) {
      return const BaseScaffold(
        appBar: FarmAppBar(title: 'Units & Preferences'),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final prefs = state.preferences;

    return BaseScaffold(
      appBar: const FarmAppBar(title: 'Units & Preferences'),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          // 1. LANGUAGE & REGION
          _buildSectionHeader(context, 'REGIONAL PREFERENCES'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              ListTile(
                leading: const Icon(Icons.translate, color: AppColorScheme.primaryLight),
                title: const Text('Language / भाषा / భాష', style: TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text('${currentLang.nativeName} (${currentLang.englishName})'),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () => context.push('/settings/language'),
              ),
              _buildDivider(context, isDark),
              ListTile(
                leading: const Icon(Icons.currency_rupee, color: AppColorScheme.primaryLight),
                title: const Text('Currency', style: TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Indian Rupee (₹ INR)'),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: isDark ? AppColorScheme.surfaceContainerDark : const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(AppRadius.xs),
                  ),
                  child: const Text('₹ INR', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E7D32))),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // 2. MEASUREMENT UNITS
          _buildSectionHeader(context, 'MEASUREMENT UNITS'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Weight Measurement', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    const SizedBox(height: AppSpacing.xs),
                    DropdownButtonFormField<WeightUnit>(
                      initialValue: prefs.weightUnit,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.scale_outlined, size: 20),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
                      ),
                      items: const [
                        DropdownMenuItem(value: WeightUnit.kg, child: Text('Kilograms (kg) — Standard')),
                        DropdownMenuItem(value: WeightUnit.g, child: Text('Grams (g)')),
                        DropdownMenuItem(value: WeightUnit.lbs, child: Text('Pounds (lbs)')),
                      ],
                      onChanged: (v) {
                        if (v != null) {
                          ref.read(settingsNotifierProvider.notifier).savePreferences(prefs.copyWith(weightUnit: v));
                        }
                      },
                    ),
                    const SizedBox(height: AppSpacing.md),

                    const Text('Temperature Unit', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    const SizedBox(height: AppSpacing.xs),
                    DropdownButtonFormField<TemperatureUnit>(
                      initialValue: prefs.temperatureUnit,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.thermostat_outlined, size: 20),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
                      ),
                      items: const [
                        DropdownMenuItem(value: TemperatureUnit.celsius, child: Text('Celsius (°C) — Standard')),
                        DropdownMenuItem(value: TemperatureUnit.fahrenheit, child: Text('Fahrenheit (°F)')),
                      ],
                      onChanged: (v) {
                        if (v != null) {
                          ref.read(settingsNotifierProvider.notifier).savePreferences(prefs.copyWith(temperatureUnit: v));
                        }
                      },
                    ),
                    const SizedBox(height: AppSpacing.md),

                    const Text('Farm Land Area', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                    const SizedBox(height: AppSpacing.xs),
                    DropdownButtonFormField<AreaUnit>(
                      initialValue: prefs.areaUnit,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.landscape_outlined, size: 20),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
                      ),
                      items: const [
                        DropdownMenuItem(value: AreaUnit.acres, child: Text('Acres — Standard')),
                        DropdownMenuItem(value: AreaUnit.hectares, child: Text('Hectares (ha)')),
                        DropdownMenuItem(value: AreaUnit.sqMeters, child: Text('Square Meters (sq.m)')),
                      ],
                      onChanged: (v) {
                        if (v != null) {
                          ref.read(settingsNotifierProvider.notifier).savePreferences(prefs.copyWith(areaUnit: v));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),

          // 3. SYSTEM NOTIFICATIONS
          _buildSectionHeader(context, 'ALERT NOTIFICATIONS'),
          _buildGroupCard(
            context: context,
            isDark: isDark,
            children: [
              SwitchListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 2),
                secondary: const Icon(Icons.notifications_active_outlined, color: AppColorScheme.primaryLight),
                title: const Text('Enable System Notifications', style: TextStyle(fontWeight: FontWeight.w600)),
                subtitle: const Text('Timely feeding and harvest milestones', style: TextStyle(fontSize: 12, color: Colors.grey)),
                value: prefs.enableNotifications,
                activeThumbColor: AppColorScheme.primaryLight,
                onChanged: (v) => ref.read(settingsNotifierProvider.notifier).savePreferences(prefs.copyWith(enableNotifications: v)),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: AppSpacing.xs),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.grey[600],
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
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceLight,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
        ),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildDivider(BuildContext context, bool isDark) {
    return Divider(
      height: 1,
      thickness: 1,
      color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
    );
  }
}
