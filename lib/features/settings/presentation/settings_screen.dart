import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../shared/widgets/farmer_avatar.dart';
import '../application/providers/settings_notifier.dart';
import '../application/providers/settings_state.dart';
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
      backgroundColor: const Color(0xFFF7F9F8),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          children: [
            // 1. Settings Page Title
            const Padding(
              padding: EdgeInsets.only(left: 4.0, top: 4.0, bottom: 20.0),
              child: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F1E36),
                  letterSpacing: -0.5,
                ),
              ),
            ),

            // 2. Green Farmer Identity Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF13532D),
                    Color(0xFF0E3E21),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF13532D).withValues(alpha: 0.18),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    // Botanical leaf decoration on bottom right
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: CustomPaint(
                        size: Size(130, 110),
                        painter: _ProfileCardLeafPainter(),
                      ),
                    ),
                    // Farmer Identity Content
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 58,
                                height: 58,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 2),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.12),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: FarmerAvatar(
                                  photoPath: profile.photoPath,
                                  name: displayName,
                                  size: 54,
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      displayName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.2,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      displayFarmName,
                                      style: TextStyle(
                                        color: Colors.white.withValues(alpha: 0.85),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              const Icon(
                                Icons.eco_rounded,
                                size: 18,
                                color: Color(0xFF7CE49F),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Sericulture Farmer',
                                style: TextStyle(
                                  color: const Color(0xFFB4EAC4).withValues(alpha: 0.95),
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 3. Card 1 — Farm Profile
            _buildNavigationCard(
              icon: Icons.badge_outlined,
              title: 'Farm Profile',
              subtitle: 'Manage farmer details and farm configuration',
              onTap: () => context.push('/settings/profile'),
            ),

            // 4. Card 2 — Preferences
            _buildNavigationCard(
              icon: Icons.tune_rounded,
              title: 'Preferences',
              subtitle: 'Language, currency, units and appearance',
              onTap: () => context.push('/settings/preferences'),
            ),

            // 5. Card 3 — Data & Backup
            _buildNavigationCard(
              icon: Icons.cloud_sync_outlined,
              title: 'Data & Backup',
              subtitle: 'Backup, restore and export farm records',
              onTap: () => context.push('/settings/backup'),
            ),

            // 6. Card 4 — Farm Reminders
            _buildNavigationCard(
              icon: Icons.notifications_none_rounded,
              title: 'Farm Reminders',
              subtitle: 'Feeding, stock and pending-wage notifications',
              onTap: () => context.push('/settings/reminders'),
            ),

            // 7. Card 5 — Security & App
            _buildNavigationCard(
              icon: Icons.shield_outlined,
              title: 'Security & App',
              subtitle: 'App lock, About FARMSTATS and available support options',
              onTap: () => context.push('/settings/security-app'),
            ),

            const SizedBox(height: 6),

            // 8. Separate Destructive Reset All Data Action
            Container(
              margin: const EdgeInsets.only(bottom: 28),
              decoration: BoxDecoration(
                color: const Color(0xFFFDF2F2),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFFEE2E2), width: 1),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => _showResetConfirmation(context, ref),
                  borderRadius: BorderRadius.circular(18),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFEE2E2),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.delete_outline_rounded,
                            size: 20,
                            color: Color(0xFFEF4444),
                          ),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Text(
                            'Reset All Data',
                            style: TextStyle(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFEF4444),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: Color(0xFFEF4444),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Ample bottom padding so content scrolls freely above bottom navigation
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF1F5F9), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E293B).withValues(alpha: 0.035),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE8F5EC),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Icon(icon, size: 22, color: const Color(0xFF165B33)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F1E36),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF64748B),
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.chevron_right, size: 20, color: Color(0xFF94A3B8)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Botanical mulberry leaf illustration painted in the bottom-right of the identity card.
class _ProfileCardLeafPainter extends CustomPainter {
  const _ProfileCardLeafPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final base = Offset(size.width * 0.98, size.height * 0.98);

    // Leaf 1: Upper-center leaf
    _drawLeaf(
      canvas,
      base: base,
      tip: Offset(size.width * 0.68, size.height * 0.08),
      width: 24,
      fillColor: const Color(0xFF22C55E).withValues(alpha: 0.22),
      veinColor: const Color(0xFF86EFAC).withValues(alpha: 0.20),
    );

    // Leaf 2: Main large diagonal leaf
    _drawLeaf(
      canvas,
      base: base,
      tip: Offset(size.width * 0.32, size.height * 0.28),
      width: 32,
      fillColor: const Color(0xFF2E8B57).withValues(alpha: 0.32),
      veinColor: const Color(0xFF86EFAC).withValues(alpha: 0.25),
    );

    // Leaf 3: Lower left leaf
    _drawLeaf(
      canvas,
      base: base,
      tip: Offset(size.width * 0.12, size.height * 0.65),
      width: 26,
      fillColor: const Color(0xFF15803D).withValues(alpha: 0.28),
      veinColor: const Color(0xFF86EFAC).withValues(alpha: 0.22),
    );

    // Leaf 4: Small lower-right accent leaf
    _drawLeaf(
      canvas,
      base: base,
      tip: Offset(size.width * 0.48, size.height * 0.90),
      width: 20,
      fillColor: const Color(0xFF4ADE80).withValues(alpha: 0.20),
      veinColor: const Color(0xFF86EFAC).withValues(alpha: 0.18),
    );
  }

  void _drawLeaf(
    Canvas canvas, {
    required Offset base,
    required Offset tip,
    required double width,
    required Color fillColor,
    required Color veinColor,
  }) {
    final dx = tip.dx - base.dx;
    final dy = tip.dy - base.dy;
    final length = math.sqrt(dx * dx + dy * dy);
    if (length == 0) return;

    final nx = -dy / length * width;
    final ny = dx / length * width;

    final mid = Offset((base.dx + tip.dx) / 2, (base.dy + tip.dy) / 2);
    final cp1 = Offset(mid.dx + nx, mid.dy + ny);
    final cp2 = Offset(mid.dx - nx, mid.dy - ny);

    final path = Path()
      ..moveTo(base.dx, base.dy)
      ..quadraticBezierTo(cp1.dx, cp1.dy, tip.dx, tip.dy)
      ..quadraticBezierTo(cp2.dx, cp2.dy, base.dx, base.dy)
      ..close();

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, fillPaint);

    final veinPaint = Paint()
      ..color = veinColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Central vein
    canvas.drawLine(base, tip, veinPaint);

    // Side veins
    for (final t in [0.35, 0.55, 0.75]) {
      final factor = 1.0 - (t - 0.5).abs();
      final pt = Offset(base.dx + dx * t, base.dy + dy * t);
      final side1 = Offset(pt.dx + nx * 0.45 * factor, pt.dy + ny * 0.45 * factor);
      final side2 = Offset(pt.dx - nx * 0.45 * factor, pt.dy - ny * 0.45 * factor);
      canvas.drawLine(pt, side1, veinPaint);
      canvas.drawLine(pt, side2, veinPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
