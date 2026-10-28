import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:farmstats/features/settings/presentation/settings_screen.dart';
import 'package:farmstats/features/settings/presentation/screens/farm_profile_screen.dart';
import 'package:farmstats/features/settings/presentation/screens/edit_farm_profile_screen.dart';
import 'package:farmstats/features/settings/application/providers/settings_notifier.dart';
import 'package:farmstats/features/settings/application/providers/settings_state.dart';
import 'package:farmstats/features/settings/domain/entities/settings_entities.dart';

void main() {
  group('Settings & Profile Navigation Workflow Tests', () {
    testWidgets('Settings renders Farm Profile navigation row and navigates to FarmProfileScreen and EditFarmProfileScreen', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      SharedPreferences.setMockInitialValues({});
      final sharedPreferences = await SharedPreferences.getInstance();

      final testProfile = const FarmProfile(
        ownerName: 'Nithin Nagabushanam',
        farmName: 'My Sericulture Farm',
        address: 'Chittoor, Andhra Pradesh',
        phone: '9876543210',
        farmArea: 2.5,
        numRearingHouses: 1,
        defaultMulberryVariety: 'V1',
      );

      final router = GoRouter(
        initialLocation: '/settings',
        routes: [
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
            routes: [
              GoRoute(
                path: 'profile',
                builder: (context, state) => const FarmProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    builder: (context, state) => const EditFarmProfileScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
            settingsNotifierProvider.overrideWith(() => _MockSettingsNotifier(testProfile)),
          ],
          child: MaterialApp.router(
            routerConfig: router,
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check Settings shows Page Title & Green Identity Card details
      expect(find.text('Settings'), findsOneWidget);
      expect(find.text('Nithin Nagabushanam'), findsOneWidget);
      expect(find.text('My Sericulture Farm'), findsOneWidget);
      expect(find.text('Sericulture Farmer'), findsOneWidget);

      // Check all 5 white navigation cards in order
      expect(find.text('Farm Profile'), findsOneWidget);
      expect(find.text('Manage farmer details and farm configuration'), findsOneWidget);

      expect(find.text('Preferences'), findsOneWidget);
      expect(find.text('Language, currency, units and appearance'), findsOneWidget);

      expect(find.text('Data & Backup'), findsOneWidget);
      expect(find.text('Backup, restore and export farm records'), findsOneWidget);

      expect(find.text('Farm Reminders'), findsOneWidget);
      expect(find.text('Feeding, stock and pending-wage notifications'), findsOneWidget);

      expect(find.text('Security & App'), findsOneWidget);
      expect(find.text('App lock, About FARMSTATS and support options'), findsOneWidget);

      // Check Reset All Data card
      expect(find.text('Reset All Data'), findsOneWidget);

      // Verify no inline edit controls beside fields
      expect(find.text('Edit Farm Details'), findsNothing);

      // Tap on Farm Profile white navigation card
      await tester.tap(find.text('Farm Profile'));
      await tester.pumpAndSettle();

      // Should now be on Farm Profile screen
      expect(find.text('Farmer & Farm'), findsOneWidget);
      expect(find.text('Sericulture Configuration'), findsOneWidget);
      expect(find.text('Contact Information'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('2.5 Acres'), findsOneWidget);
      expect(find.text('1 Unit(s)'), findsOneWidget);
      expect(find.text('V1'), findsOneWidget);

      // Verify redundant bottom Edit Farm Profile button is removed
      expect(find.widgetWithText(FilledButton, 'Edit Farm Profile'), findsNothing);

      // Tap Edit button in AppBar
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      // Should now be on Edit Farm Profile screen
      expect(find.text('Edit Farm Profile'), findsOneWidget);
      expect(find.text('Profile Photo'), findsOneWidget);
      expect(find.text('Farmer & Farm'), findsOneWidget);
      expect(find.text('Sericulture Configuration'), findsOneWidget);
      expect(find.text('Contact Information'), findsOneWidget);
      expect(find.text('Cancel'), findsOneWidget);
      expect(find.text('Save Profile'), findsOneWidget);
    });
  });
}

class _MockSettingsNotifier extends SettingsNotifier {
  final FarmProfile initialProfile;
  _MockSettingsNotifier(this.initialProfile);

  @override
  SettingsState build() {
    return SettingsState.data(
      profile: initialProfile,
      preferences: const AppPreferences(),
    );
  }

  @override
  Future<void> saveProfile(FarmProfile profile) async {
    state = SettingsState.data(
      profile: profile,
      preferences: const AppPreferences(),
    );
  }
}
