import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../shared/widgets/farmer_avatar.dart';
import '../application/services/profile_photo_service.dart';
import '../application/services/settings_validator_service.dart';
import '../application/providers/settings_notifier.dart';
import '../application/providers/settings_state.dart';
import '../application/providers/language_provider.dart';
import '../domain/entities/settings_entities.dart';
import 'widgets/country_phone_field.dart';
import '../../../../data/providers/database_provider.dart';
import '../../expenses/application/providers/expense_notifier.dart';
import '../../income/application/providers/income_notifier.dart';
import '../../dashboard/application/providers/dashboard_notifier.dart';
import '../../reports/application/providers/reports_notifier.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _handlePhotoAction(BuildContext context, WidgetRef ref, FarmProfile profile) async {
    await ProfilePhotoService.showPhotoOptionsModal(
      context: context,
      hasCustomPhoto: profile.photoPath.isNotEmpty,
      onPhotoSelected: (newPath) async {
        final updated = profile.copyWith(photoPath: newPath ?? '');
        await ref.read(settingsNotifierProvider.notifier).saveProfile(updated);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                newPath != null && newPath.isNotEmpty
                    ? 'Profile photo cropped and saved'
                    : 'Profile photo removed',
              ),
              backgroundColor: AppColorScheme.forestGreen,
            ),
          );
        }
      },
    );
  }

  Future<void> _editSingleTextField({
    required BuildContext context,
    required WidgetRef ref,
    required FarmProfile profile,
    required String title,
    required String labelText,
    required String initialValue,
    required IconData icon,
    required FarmProfile Function(String value) onUpdate,
    String? Function(String?)? validator,
  }) async {
    final controller = TextEditingController(text: initialValue);
    final formKey = GlobalKey<FormState>();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
            bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom + 20,
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller,
                  autofocus: true,
                  validator: validator,
                  decoration: InputDecoration(
                    labelText: labelText,
                    prefixIcon: Icon(icon, size: 20, color: const Color(0xFF64748B)),
                    filled: true,
                    fillColor: const Color(0xFFF8FAFC),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColorScheme.primary, width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(bottomSheetContext),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFCBD5E1)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Cancel', style: TextStyle(color: Color(0xFF475569))),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final updated = onUpdate(controller.text.trim());
                            await ref.read(settingsNotifierProvider.notifier).saveProfile(updated);
                            if (bottomSheetContext.mounted) {
                              Navigator.pop(bottomSheetContext);
                            }
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('$title updated successfully'),
                                  backgroundColor: AppColorScheme.forestGreen,
                                ),
                              );
                            }
                          }
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColorScheme.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text('Save', style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showEditFarmDetailsModal(
    BuildContext context,
    WidgetRef ref,
    FarmProfile profile,
  ) async {
    final formKey = GlobalKey<FormState>();
    final ownerCtrl = TextEditingController(text: profile.ownerName);
    final farmNameCtrl = TextEditingController(text: profile.farmName);
    final addressCtrl = TextEditingController(text: profile.address);
    final phoneCtrl = TextEditingController(text: profile.phone);
    final areaCtrl = TextEditingController(text: profile.farmArea > 0 ? profile.farmArea.toString() : '');
    final housesCtrl = TextEditingController(text: profile.numRearingHouses > 0 ? profile.numRearingHouses.toString() : '');
    final varietyCtrl = TextEditingController(text: profile.defaultMulberryVariety);

    String selectedCountryCode = profile.countryCode.isNotEmpty ? profile.countryCode : 'IN';
    String selectedDialCode = profile.dialCode.isNotEmpty ? profile.dialCode : '+91';

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
                bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom + 20,
              ),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 36,
                          height: 4,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE2E8F0),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Edit Profile & Farm Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Sericulture Farm Configuration',
                        style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                      ),
                      const SizedBox(height: 16),

                      TextFormField(
                        controller: ownerCtrl,
                        decoration: _inputDeco('Farmer / Owner Name *', Icons.person_outline),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Farmer name is required' : null,
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: farmNameCtrl,
                        decoration: _inputDeco('Farm Name *', Icons.business_outlined),
                        validator: (v) => (v == null || v.trim().isEmpty) ? 'Farm name is required' : null,
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: addressCtrl,
                        decoration: _inputDeco('Location / Farm Address', Icons.location_on_outlined),
                      ),
                      const SizedBox(height: 12),

                      CountryPhoneField(
                        controller: phoneCtrl,
                        countryCode: selectedCountryCode,
                        dialCode: selectedDialCode,
                        onCountrySelected: (Country c) {
                          setModalState(() {
                            selectedCountryCode = c.countryCode;
                            selectedDialCode = '+${c.phoneCode}';
                          });
                        },
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: areaCtrl,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              decoration: _inputDeco('Farm Area (Acres)', Icons.landscape_outlined),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: housesCtrl,
                              keyboardType: TextInputType.number,
                              decoration: _inputDeco('Rearing Houses', Icons.home_work_outlined),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      TextFormField(
                        controller: varietyCtrl,
                        decoration: _inputDeco('Mulberry Variety', Icons.eco_outlined, hint: 'e.g. V1, S36, G4'),
                      ),
                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(bottomSheetContext),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFFCBD5E1)),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text('Cancel', style: TextStyle(color: Color(0xFF475569))),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: FilledButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  final updated = profile.copyWith(
                                    ownerName: ownerCtrl.text.trim(),
                                    farmName: farmNameCtrl.text.trim(),
                                    address: addressCtrl.text.trim(),
                                    phone: phoneCtrl.text.trim(),
                                    countryCode: selectedCountryCode,
                                    dialCode: selectedDialCode,
                                    farmArea: double.tryParse(areaCtrl.text.trim()) ?? 0.0,
                                    numRearingHouses: int.tryParse(housesCtrl.text.trim()) ?? 0,
                                    defaultMulberryVariety: varietyCtrl.text.trim().isNotEmpty ? varietyCtrl.text.trim() : 'V1',
                                  );

                                  await ref.read(settingsNotifierProvider.notifier).saveProfile(updated);
                                  if (bottomSheetContext.mounted) {
                                    Navigator.pop(bottomSheetContext);
                                  }
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Profile details updated successfully'),
                                        backgroundColor: AppColorScheme.forestGreen,
                                      ),
                                    );
                                  }
                                }
                              },
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColorScheme.primary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text('Save Details', style: TextStyle(fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static InputDecoration _inputDeco(String label, IconData icon, {String? hint}) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: Icon(icon, size: 20, color: const Color(0xFF64748B)),
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColorScheme.primary, width: 1.5),
      ),
    );
  }

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

  String _formatPhone(FarmProfile profile) {
    if (profile.phone.trim().isEmpty) {
      return 'Not configured';
    }
    final dial = profile.dialCode.isNotEmpty ? profile.dialCode : '+91';
    final flag = Country.tryParse(profile.countryCode.isNotEmpty ? profile.countryCode : 'IN')?.flagEmoji ?? '🇮🇳';
    return '$flag $dial ${profile.phone}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsNotifierProvider);
    final languageCode = ref.watch(languageProvider);

    final currentLang = kSupportedLanguages.firstWhere(
      (l) => l.code == languageCode,
      orElse: () => kSupportedLanguages[1],
    );

    final profile = (state is SettingsStateData)
        ? state.profile
        : const FarmProfile(
            farmName: 'My Sericulture Farm',
            ownerName: 'Nithin Nagabushanam',
            address: 'Chittoor, Andhra Pradesh',
          );

    final displayName = profile.ownerName.isNotEmpty ? profile.ownerName : 'Nithin Nagabushanam';
    final displayFarmName = profile.farmName.isNotEmpty ? profile.farmName : 'My Sericulture Farm';
    final displayLocation = profile.address.isNotEmpty ? profile.address : 'Chittoor, Andhra Pradesh';
    final displayArea = '${profile.farmArea > 0 ? profile.farmArea : 2.5} Acres';
    final displayHouses = '${profile.numRearingHouses > 0 ? profile.numRearingHouses : 1} Unit(s)';
    final displayVariety = profile.defaultMulberryVariety.isNotEmpty ? profile.defaultMulberryVariety : 'V1';
    final displayPhone = _formatPhone(profile);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/dashboard');
            }
          },
        ),
        title: const Text(
          'Profile & Settings',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
        children: [
          // 1. Direct Profile Hero (Interactive Photo & Quick Name Edits)
          Center(
            child: Column(
              children: [
                FarmerAvatar(
                  photoPath: profile.photoPath,
                  name: displayName,
                  size: 88,
                  showEditBadge: true,
                  badgeIcon: Icons.camera_alt_rounded,
                  badgeColor: AppColorScheme.forestGreen,
                  onTap: () => _handlePhotoAction(context, ref, profile),
                  onBadgeTap: () => _handlePhotoAction(context, ref, profile),
                ),
                const SizedBox(height: 12),

                // Farmer Name (Tapping allows quick inline editing)
                InkWell(
                  onTap: () => _editSingleTextField(
                    context: context,
                    ref: ref,
                    profile: profile,
                    title: 'Edit Farmer Name',
                    labelText: 'Farmer / Owner Name *',
                    initialValue: displayName,
                    icon: Icons.person_outline,
                    validator: SettingsValidatorService.validateOwnerName,
                    onUpdate: (val) => profile.copyWith(ownerName: val),
                  ),
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          displayName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.edit_outlined, size: 14, color: Color(0xFF94A3B8)),
                      ],
                    ),
                  ),
                ),

                // Farm Name (Tapping allows quick inline editing)
                InkWell(
                  onTap: () => _editSingleTextField(
                    context: context,
                    ref: ref,
                    profile: profile,
                    title: 'Edit Farm Name',
                    labelText: 'Farm Name *',
                    initialValue: displayFarmName,
                    icon: Icons.business_outlined,
                    validator: SettingsValidatorService.validateFarmName,
                    onUpdate: (val) => profile.copyWith(farmName: val),
                  ),
                  borderRadius: BorderRadius.circular(6),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          displayFarmName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF64748B),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.edit_outlined, size: 12, color: Color(0xFF94A3B8)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // GROUP 1: PROFILE
          _buildSectionHeader('PROFILE'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildInfoRow(
                  icon: Icons.location_on_outlined,
                  title: 'Location',
                  value: displayLocation,
                  onTap: () => _editSingleTextField(
                    context: context,
                    ref: ref,
                    profile: profile,
                    title: 'Edit Farm Location',
                    labelText: 'Location / Farm Address',
                    initialValue: displayLocation,
                    icon: Icons.location_on_outlined,
                    onUpdate: (val) => profile.copyWith(address: val),
                  ),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildInfoRow(
                  icon: Icons.landscape_outlined,
                  title: 'Farm Area',
                  value: displayArea,
                  onTap: () => _showEditFarmDetailsModal(context, ref, profile),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildInfoRow(
                  icon: Icons.home_work_outlined,
                  title: 'Rearing Houses',
                  value: displayHouses,
                  onTap: () => _showEditFarmDetailsModal(context, ref, profile),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildInfoRow(
                  icon: Icons.eco_outlined,
                  title: 'Mulberry Variety',
                  value: displayVariety,
                  onTap: () => _showEditFarmDetailsModal(context, ref, profile),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildInfoRow(
                  icon: Icons.phone_outlined,
                  title: 'Contact Phone',
                  value: displayPhone,
                  onTap: () => _showEditFarmDetailsModal(context, ref, profile),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildActionRow(
                  icon: Icons.edit_note_outlined,
                  title: 'Edit Farm Details',
                  subtitle: 'Quickly modify all sericulture configuration',
                  onTap: () => _showEditFarmDetailsModal(context, ref, profile),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // GROUP 2: PREFERENCES
          _buildSectionHeader('PREFERENCES'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildValueRow(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  value: currentLang.englishName,
                  onTap: () => context.push('/settings/language'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildValueRow(
                  icon: Icons.currency_rupee,
                  title: 'Currency',
                  value: 'INR (₹)',
                  onTap: () => context.push('/settings/preferences'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildValueRow(
                  icon: Icons.straighten_outlined,
                  title: 'Units',
                  value: 'kg, °C, Acres',
                  onTap: () => context.push('/settings/preferences'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // GROUP 3: APP & DATA
          _buildSectionHeader('APP & DATA'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildActionRow(
                  icon: Icons.backup_outlined,
                  title: 'Backup & Restore',
                  subtitle: 'Manage local database snapshots',
                  onTap: () => context.push('/settings/backup'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildActionRow(
                  icon: Icons.file_download_outlined,
                  title: 'Export Records (CSV)',
                  subtitle: 'Download accounting & batch logs',
                  onTap: () => context.push('/settings/backup'),
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildActionRow(
                  icon: Icons.info_outline,
                  title: 'About FARMSTATS',
                  subtitle: 'Version 1.0.0 (Sericulture FarmOS)',
                  onTap: () => context.push('/settings/about'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // Danger Zone / Reset
          Center(
            child: TextButton.icon(
              onPressed: () => _showResetConfirmation(context, ref),
              icon: const Icon(Icons.delete_outline, size: 18, color: Color(0xFFDC2626)),
              label: const Text(
                'Reset All Data',
                style: TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.w600, fontSize: 13),
              ),
            ),
          ),
          // Ample bottom padding to ensure bottom nav does not obscure anything
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF64748B),
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF64748B)),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            const Spacer(),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 180),
              child: Text(
                value,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.edit_outlined, size: 14, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }

  Widget _buildValueRow({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF64748B)),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.chevron_right, size: 18, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRow({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColorScheme.primary),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 18, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }
}
