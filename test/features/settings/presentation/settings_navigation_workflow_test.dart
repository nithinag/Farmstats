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

      // Check Settings shows FARM PROFILE section
      expect(find.text('FARM PROFILE'), findsOneWidget);
      expect(find.text('Farm Profile'), findsOneWidget);
      expect(find.text('Nithin Nagabushanam • My Sericulture Farm'), findsOneWidget);

      // Verify no inline edit controls beside fields
      expect(find.text('Edit Farm Details'), findsNothing);

      // Tap on Farm Profile navigation row
      await tester.tap(find.text('Farm Profile'));
      await tester.pumpAndSettle();

      // Should now be on Farm Profile screen
      expect(find.text('SERICULTURE FARM CONFIGURATION'), findsOneWidget);
      expect(find.text('Edit'), findsOneWidget);
      expect(find.text('2.5 Acres'), findsOneWidget);
      expect(find.text('1 Unit(s)'), findsOneWidget);
      expect(find.text('V1'), findsOneWidget);

      // Tap Edit button in AppBar
      await tester.tap(find.text('Edit'));
      await tester.pumpAndSettle();

      // Should now be on Edit Farm Profile screen
      expect(find.text('Edit Farm Profile'), findsOneWidget);
      expect(find.text('FARMER & FARM'), findsOneWidget);
      expect(find.text('SERICULTURE CONFIGURATION'), findsOneWidget);
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
