import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../application/providers/settings_notifier.dart';
import '../../application/providers/settings_state.dart';
import '../../domain/entities/settings_entities.dart';

class PreferencesScreen extends ConsumerWidget {
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsNotifierProvider);

    if (state is! SettingsStateData) {
      return const BaseScaffold(
        appBar: FarmAppBar(title: 'App Preferences'),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final prefs = state.preferences;

    return BaseScaffold(
      appBar: const FarmAppBar(title: 'App Preferences'),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          const Text('Theme', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          DropdownButtonFormField<ThemeModePreference>(
            initialValue: prefs.themeMode,
            decoration: const InputDecoration(border: OutlineInputBorder()),
            items: ThemeModePreference.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name.toUpperCase()))).toList(),
            onChanged: (v) {
              if (v != null) ref.read(settingsNotifierProvider.notifier).savePreferences(prefs.copyWith(themeMode: v));
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text('Units', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: AppSpacing.sm),
          DropdownButtonFormField<TemperatureUnit>(
            initialValue: prefs.temperatureUnit,
            decoration: const InputDecoration(labelText: 'Temperature', border: OutlineInputBorder()),
            items: TemperatureUnit.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name.toUpperCase()))).toList(),
            onChanged: (v) {
              if (v != null) ref.read(settingsNotifierProvider.notifier).savePreferences(prefs.copyWith(temperatureUnit: v));
            },
          ),
          const SizedBox(height: AppSpacing.md),
          DropdownButtonFormField<WeightUnit>(
            initialValue: prefs.weightUnit,
            decoration: const InputDecoration(labelText: 'Weight', border: OutlineInputBorder()),
            items: WeightUnit.values.map((e) => DropdownMenuItem(value: e, child: Text(e.name.toUpperCase()))).toList(),
            onChanged: (v) {
              if (v != null) ref.read(settingsNotifierProvider.notifier).savePreferences(prefs.copyWith(weightUnit: v));
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          const Text('Notifications', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          SwitchListTile(
            title: const Text('Enable System Notifications'),
            value: prefs.enableNotifications,
            onChanged: (v) => ref.read(settingsNotifierProvider.notifier).savePreferences(prefs.copyWith(enableNotifications: v)),
          ),
        ],
      ),
    );
  }
}
