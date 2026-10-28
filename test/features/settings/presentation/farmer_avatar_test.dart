import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:farmstats/shared/widgets/farmer_avatar.dart';

void main() {
  group('FarmerAvatar Widget Tests', () {
    testWidgets('renders fallback initials when photoPath is empty', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FarmerAvatar(
              name: 'Nithin Nagabushanam',
              photoPath: '',
              size: 80,
            ),
          ),
        ),
      );

      expect(find.text('NN'), findsOneWidget);
    });

    testWidgets('renders single initial for single-word name', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FarmerAvatar(
              name: 'Farmer',
              photoPath: '',
              size: 60,
            ),
          ),
        ),
      );

      expect(find.text('F'), findsOneWidget);
    });

    testWidgets('renders fallback when photo path does not exist on disk', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FarmerAvatar(
              name: 'Ramesh Kumar',
              photoPath: '/non/existent/path/photo.jpg',
              size: 70,
            ),
          ),
        ),
      );

      expect(find.text('RK'), findsOneWidget);
    });

    testWidgets('renders edit badge when showEditBadge is true', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FarmerAvatar(
              name: 'Nithin',
              photoPath: '',
              size: 80,
              showEditBadge: true,
              badgeIcon: Icons.camera_alt_rounded,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.camera_alt_rounded), findsOneWidget);
    });

    testWidgets('triggers onTap and onBadgeTap callbacks', (tester) async {
      bool tappedAvatar = false;
      bool tappedBadge = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FarmerAvatar(
              name: 'Nithin',
              photoPath: '',
              size: 80,
              showEditBadge: true,
              badgeIcon: Icons.camera_alt_rounded,
              onTap: () => tappedAvatar = true,
              onBadgeTap: () => tappedBadge = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.camera_alt_rounded));
      await tester.pump();
      expect(tappedBadge, isTrue);

      await tester.tap(find.text('N'));
      await tester.pump();
      expect(tappedAvatar, isTrue);
    });
  });
}
