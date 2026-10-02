import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:farmstats/app/app.dart';
import 'package:farmstats/features/settings/application/providers/settings_notifier.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: const FarmOSApp(),
      ),
    );

    // Wait for the initial frame to render
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));

    expect(find.byType(FarmOSApp), findsOneWidget);
  });
}
