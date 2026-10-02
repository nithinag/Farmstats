import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' hide Column, Batch;
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../data/providers/database_provider.dart';
import '../../../../data/database/app_database.dart';
import '../../../batches/domain/entities/batch_entities.dart';
import '../../../batches/application/providers/batch_notifier.dart';
import '../../../settings/domain/entities/settings_entities.dart';
import '../../../settings/application/providers/settings_notifier.dart';
import '../../../dashboard/application/providers/dashboard_notifier.dart';

const String _onboardingKey = 'HAS_COMPLETED_ONBOARDING';

final hasCompletedOnboardingProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool(_onboardingKey) ?? false;
});

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Farm Setup fields
  final _farmNameController = TextEditingController(text: 'Green Valley Sericulture Farm');
  final _ownerNameController = TextEditingController(text: 'Farmer');
  final _locationController = TextEditingController(text: 'Ramanagara, Karnataka');

  // First Batch fields
  final _batchNameController = TextEditingController(text: 'Batch #001');
  final _dflsController = TextEditingController(text: '300');
  final _dflPriceController = TextEditingController(text: '15');
  final _supplierController = TextEditingController(text: 'Govt Chawki Rearing Center');
  bool _recordDflExpense = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _pageController.dispose();
    _farmNameController.dispose();
    _ownerNameController.dispose();
    _locationController.dispose();
    _batchNameController.dispose();
    _dflsController.dispose();
    _dflPriceController.dispose();
    _supplierController.dispose();
    super.dispose();
  }

  double get _totalDflCost {
    final dfls = int.tryParse(_dflsController.text) ?? 0;
    final price = double.tryParse(_dflPriceController.text) ?? 0.0;
    return dfls * price;
  }

  Future<void> _completeSetup() async {
    setState(() => _isLoading = true);
    try {
      final db = ref.read(appDatabaseProvider);
      final batchId = const Uuid().v4();
      final now = DateTime.now();
      final dfls = int.tryParse(_dflsController.text) ?? 300;
      final price = double.tryParse(_dflPriceController.text) ?? 15.0;

      // 1. Save Farm Profile in Settings
      final profile = FarmProfile(
        farmName: _farmNameController.text.trim().isNotEmpty ? _farmNameController.text.trim() : 'My Sericulture Farm',
        ownerName: _ownerNameController.text.trim(),
        address: _locationController.text.trim(),
        defaultMulberryVariety: 'V1',
      );
      await ref.read(settingsNotifierProvider.notifier).saveProfile(profile);

      // 2. Create First Batch #001
      final batch = Batch(
        id: batchId,
        batchName: _batchNameController.text.trim().isNotEmpty ? _batchNameController.text.trim() : 'Batch #001',
        startDate: now,
        expectedHarvestDate: now.add(const Duration(days: 28)),
        silkwormVariety: 'CSR2',
        eggSource: _supplierController.text.trim().isNotEmpty ? _supplierController.text.trim() : 'Govt CRC',
        numberOfDfls: dfls,
        dflPrice: price > 0 ? price : null,
        mulberryVariety: 'V1',
        rearingHouse: 'Main Shed',
        currentStage: InstarStage.first,
        currentAgeDays: 1,
        status: BatchStatus.active,
        healthStatus: HealthStatus.excellent,
        temperature: 25.0,
        humidity: 75.0,
      );
      await ref.read(batchNotifierProvider.notifier).addBatch(batch);

      // 3. Optional initial DFL expense
      if (_recordDflExpense && _totalDflCost > 0) {
        await db.into(db.expensesTable).insert(
          ExpenseDbModel(
            id: const Uuid().v4(),
            amount: _totalDflCost,
            quantity: dfls.toDouble(),
            date: now,
            categoryId: 'c1',
            paymentMethod: 'Cash',
            description: 'DFL Purchase - $dfls DFLs from ${_supplierController.text}',
            batchId: batchId,
          ),
          mode: InsertMode.insertOrIgnore,
        );
      }

      // 4. Initial Timeline entry
      await db.batchDao.insertTimelineEvent(
        BatchTimelineDbModel(
          id: const Uuid().v4(),
          batchId: batchId,
          timestamp: now,
          eventType: 'Batch Started',
          description: 'Initialized first batch ${batch.batchName} with $dfls DFLs.',
        ),
      );

      // 5. Mark onboarding completed in SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_onboardingKey, true);

      ref.read(dashboardAggregatorProvider.notifier).loadDashboard();

      if (mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(symbol: '₹', decimalDigits: 0, locale: 'en_IN');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.eco, color: AppColorScheme.primaryLight, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'FARMSTATS',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,
                          color: AppColorScheme.primary,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Step ${_currentPage + 1} of 3',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Page Content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  // PAGE 1: WELCOME & OVERVIEW
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      children: [
                        const SizedBox(height: AppSpacing.lg),
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.xxl),
                          decoration: BoxDecoration(
                            color: AppColorScheme.primaryContainer.withValues(alpha: 0.6),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.agriculture_rounded, size: 72, color: AppColorScheme.primary),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        const Text(
                          'Smart Sericulture Farm OS',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          'Track your silkworm batches, daily feedings, labour wages, cocoon harvests, and profitability — 100% offline with zero data leaks.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.5),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        _featureBullet(Icons.egg_outlined, 'Batch-Centric Lifecycle', 'Every expense, feeding, and sale belongs to your active batch.'),
                        _featureBullet(Icons.payments_outlined, 'Unified Cocoon Sales', 'Harvest weight, grading, deductions, and payment in one tap.'),
                        _featureBullet(Icons.cloud_off, 'Offline & Private', 'Your data is securely stored directly on your phone.'),
                      ],
                    ),
                  ),

                  // PAGE 2: FARM SETUP
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Farm Details', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('Set up your farm profile once. This persists across all future batches.', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                        const SizedBox(height: AppSpacing.xl),
                        TextFormField(
                          controller: _farmNameController,
                          decoration: const InputDecoration(
                            labelText: 'Farm Name',
                            prefixIcon: Icon(Icons.home_work_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        TextFormField(
                          controller: _ownerNameController,
                          decoration: const InputDecoration(
                            labelText: 'Owner / Farmer Name',
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        TextFormField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            labelText: 'Location / District',
                            prefixIcon: Icon(Icons.location_on_outlined),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // PAGE 3: FIRST BATCH
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSpacing.xl),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Start First Batch', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('Initialize Batch #001 to begin tracking operations.', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                        const SizedBox(height: AppSpacing.lg),
                        TextFormField(
                          controller: _batchNameController,
                          decoration: const InputDecoration(labelText: 'Batch Number', prefixIcon: Icon(Icons.tag), border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _dflsController,
                                decoration: const InputDecoration(labelText: 'DFL Quantity', prefixIcon: Icon(Icons.numbers), border: OutlineInputBorder()),
                                keyboardType: TextInputType.number,
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: TextFormField(
                                controller: _dflPriceController,
                                decoration: const InputDecoration(labelText: 'Price/DFL (₹)', prefixIcon: Icon(Icons.currency_rupee), border: OutlineInputBorder()),
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                onChanged: (_) => setState(() {}),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(AppRadius.md),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Calculated DFL Cost:'),
                              Text(currency.format(_totalDflCost), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColorScheme.primary)),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        TextFormField(
                          controller: _supplierController,
                          decoration: const InputDecoration(labelText: 'Egg Source / CRC Supplier', prefixIcon: Icon(Icons.business), border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        CheckboxListTile(
                          value: _recordDflExpense,
                          title: const Text('Record DFL purchase as initial expense', style: TextStyle(fontSize: 13)),
                          contentPadding: EdgeInsets.zero,
                          onChanged: (v) => setState(() => _recordDflExpense = v ?? true),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Row(
                children: [
                  if (_currentPage > 0) ...[
                    OutlinedButton(
                      onPressed: () => _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut),
                      child: const Text('Back'),
                    ),
                    const SizedBox(width: AppSpacing.md),
                  ],
                  Expanded(
                    child: SizedBox(
                      height: 52,
                      child: FilledButton(
                        onPressed: _isLoading
                            ? null
                            : () {
                                if (_currentPage < 2) {
                                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                } else {
                                  _completeSetup();
                                }
                              },
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColorScheme.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.md)),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(_currentPage == 2 ? 'Launch Farm Operating System' : 'Continue', style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _featureBullet(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: AppColorScheme.primaryContainer,
            child: Icon(icon, size: 18, color: AppColorScheme.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
