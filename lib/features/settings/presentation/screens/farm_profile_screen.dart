import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../shared/widgets/farmer_avatar.dart';
import '../../application/services/profile_photo_service.dart';
import '../../application/providers/settings_notifier.dart';
import '../../application/providers/settings_state.dart';
import '../../domain/entities/settings_entities.dart';
import '../widgets/country_phone_field.dart';

class FarmProfileScreen extends ConsumerStatefulWidget {
  const FarmProfileScreen({super.key});

  @override
  ConsumerState<FarmProfileScreen> createState() => _FarmProfileScreenState();
}

class _FarmProfileScreenState extends ConsumerState<FarmProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _farmNameCtrl;
  late TextEditingController _ownerNameCtrl;
  late TextEditingController _addressCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _areaCtrl;
  late TextEditingController _rearingHousesCtrl;
  late TextEditingController _mulberryVarietyCtrl;

  String _photoPath = '';
  String _countryCode = 'IN';
  String _dialCode = '+91';

  // Initial snapshot to track unsaved dirty changes
  String _initialFarmName = '';
  String _initialOwnerName = '';
  String _initialAddress = '';
  String _initialPhone = '';
  String _initialCountryCode = 'IN';
  String _initialDialCode = '+91';
  String _initialArea = '';
  String _initialHouses = '';
  String _initialVariety = '';
  String _initialPhotoPath = '';

  bool _initialized = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _farmNameCtrl = TextEditingController();
    _ownerNameCtrl = TextEditingController();
    _addressCtrl = TextEditingController();
    _phoneCtrl = TextEditingController();
    _areaCtrl = TextEditingController();
    _rearingHousesCtrl = TextEditingController();
    _mulberryVarietyCtrl = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _loadData();
      _initialized = true;
    }
  }

  void _loadData() {
    final state = ref.read(settingsNotifierProvider);
    if (state is SettingsStateData) {
      final p = state.profile;
      _initialFarmName = p.farmName.isNotEmpty ? p.farmName : 'My Sericulture Farm';
      _initialOwnerName = p.ownerName.isNotEmpty ? p.ownerName : 'Farmer';
      _initialAddress = p.address.isNotEmpty ? p.address : 'Karnataka, India';
      _initialPhone = p.phone;
      _initialCountryCode = p.countryCode.isNotEmpty ? p.countryCode : 'IN';
      _initialDialCode = p.dialCode.isNotEmpty ? p.dialCode : '+91';
      _initialArea = p.farmArea > 0 ? p.farmArea.toString() : '2.5';
      _initialHouses = p.numRearingHouses > 0 ? p.numRearingHouses.toString() : '1';
      _initialVariety = p.defaultMulberryVariety.isNotEmpty ? p.defaultMulberryVariety : 'V1';
      _initialPhotoPath = p.photoPath;

      _farmNameCtrl.text = _initialFarmName;
      _ownerNameCtrl.text = _initialOwnerName;
      _addressCtrl.text = _initialAddress;
      _phoneCtrl.text = _initialPhone;
      _countryCode = _initialCountryCode;
      _dialCode = _initialDialCode;
      _areaCtrl.text = _initialArea;
      _rearingHousesCtrl.text = _initialHouses;
      _mulberryVarietyCtrl.text = _initialVariety;
      _photoPath = _initialPhotoPath;
    }
  }

  bool get _hasUnsavedChanges {
    return _farmNameCtrl.text.trim() != _initialFarmName ||
        _ownerNameCtrl.text.trim() != _initialOwnerName ||
        _addressCtrl.text.trim() != _initialAddress ||
        _phoneCtrl.text.trim() != _initialPhone ||
        _countryCode != _initialCountryCode ||
        _dialCode != _initialDialCode ||
        _areaCtrl.text.trim() != _initialArea ||
        _rearingHousesCtrl.text.trim() != _initialHouses ||
        _mulberryVarietyCtrl.text.trim() != _initialVariety ||
        _photoPath.trim() != _initialPhotoPath.trim();
  }

  Future<void> _showDiscardDialog(BuildContext context) async {
    final discard = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Discard Unsaved Changes?'),
          content: const Text(
            'You have unsaved profile changes. Leaving this screen will discard them.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Keep Editing'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColorScheme.error,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Discard'),
            ),
          ],
        );
      },
    );

    if (discard == true && context.mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> _handleBackPress() async {
    if (_hasUnsavedChanges) {
      await _showDiscardDialog(context);
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _pickPhoto() async {
    await ProfilePhotoService.showPhotoOptionsModal(
      context: context,
      hasCustomPhoto: _photoPath.isNotEmpty,
      onPhotoSelected: (newPath) {
        setState(() {
          _photoPath = newPath ?? '';
        });
      },
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      final currentProfile = ref.read(settingsNotifierProvider) is SettingsStateData
          ? (ref.read(settingsNotifierProvider) as SettingsStateData).profile
          : const FarmProfile();

      final updated = currentProfile.copyWith(
        farmName: _farmNameCtrl.text.trim(),
        ownerName: _ownerNameCtrl.text.trim(),
        address: _addressCtrl.text.trim(),
        phone: _phoneCtrl.text.trim(),
        countryCode: _countryCode,
        dialCode: _dialCode,
        farmArea: double.tryParse(_areaCtrl.text.trim()) ?? 0.0,
        numRearingHouses: int.tryParse(_rearingHousesCtrl.text.trim()) ?? 1,
        defaultMulberryVariety: _mulberryVarietyCtrl.text.trim().isNotEmpty ? _mulberryVarietyCtrl.text.trim() : 'V1',
        photoPath: _photoPath.trim(),
      );

      await ref.read(settingsNotifierProvider.notifier).saveProfile(updated);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            backgroundColor: AppColorScheme.forestGreen,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save profile: $e'),
            backgroundColor: AppColorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  void dispose() {
    _farmNameCtrl.dispose();
    _ownerNameCtrl.dispose();
    _addressCtrl.dispose();
    _phoneCtrl.dispose();
    _areaCtrl.dispose();
    _rearingHousesCtrl.dispose();
    _mulberryVarietyCtrl.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String labelText,
    String? hintText,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      prefixIcon: Icon(prefixIcon, size: 20, color: const Color(0xFF64748B)),
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColorScheme.error, width: 1.5),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
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

  @override
  Widget build(BuildContext context) {
    final previewName = _ownerNameCtrl.text.isNotEmpty ? _ownerNameCtrl.text : 'Farmer';

    return PopScope(
      canPop: !_hasUnsavedChanges,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          _showDiscardDialog(context);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
            onPressed: _handleBackPress,
          ),
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              color: Color(0xFF1E293B),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: _isSaving
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2, color: AppColorScheme.forestGreen),
                    )
                  : const Icon(Icons.check, color: AppColorScheme.forestGreen, size: 26),
              tooltip: 'Save Profile',
              onPressed: _isSaving ? null : _saveProfile,
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            children: [
              // 1. Profile Photo Section with Crop & Preview
              Center(
                child: Column(
                  children: [
                    FarmerAvatar(
                      photoPath: _photoPath,
                      name: previewName,
                      size: 92,
                      showEditBadge: true,
                      badgeIcon: Icons.camera_alt_rounded,
                      badgeColor: AppColorScheme.forestGreen,
                      onTap: _pickPhoto,
                      onBadgeTap: _pickPhoto,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: _pickPhoto,
                          icon: const Icon(Icons.crop_outlined, size: 16),
                          label: Text(_photoPath.isNotEmpty ? 'Change & Crop Photo' : 'Upload & Crop Photo'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColorScheme.primary,
                            side: const BorderSide(color: Color(0xFFCBD5E1)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          ),
                        ),
                        if (_photoPath.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          TextButton.icon(
                            onPressed: () {
                              setState(() => _photoPath = '');
                            },
                            icon: const Icon(Icons.delete_outline, size: 16, color: AppColorScheme.error),
                            label: const Text(
                              'Remove Photo',
                              style: TextStyle(color: AppColorScheme.error, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),

              // 2. Section: Farm Identification
              _buildSectionHeader('FARM IDENTIFICATION'),
              TextFormField(
                controller: _farmNameCtrl,
                decoration: _inputDecoration(
                  labelText: 'Farm Name *',
                  hintText: 'e.g. My Sericulture Farm',
                  prefixIcon: Icons.business_outlined,
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Farm name is required' : null,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _ownerNameCtrl,
                decoration: _inputDecoration(
                  labelText: 'Farmer / Owner Name *',
                  hintText: 'e.g. Nithin Nagabushanam',
                  prefixIcon: Icons.person_outline,
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Farmer name is required' : null,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _addressCtrl,
                decoration: _inputDecoration(
                  labelText: 'Location / Farm Address',
                  hintText: 'e.g. Chittoor, Andhra Pradesh',
                  prefixIcon: Icons.location_on_outlined,
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.md),

              // Country Dial Code and Mobile Number
              CountryPhoneField(
                controller: _phoneCtrl,
                countryCode: _countryCode,
                dialCode: _dialCode,
                onCountrySelected: (Country country) {
                  setState(() {
                    _countryCode = country.countryCode;
                    _dialCode = '+${country.phoneCode}';
                  });
                },
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.lg),

              // 3. Section: Farm Configuration (Sericulture Exclusive)
              _buildSectionHeader('FARM CONFIGURATION'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _areaCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: _inputDecoration(
                        labelText: 'Area (Acres)',
                        hintText: '2.5',
                        prefixIcon: Icons.landscape_outlined,
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: TextFormField(
                      controller: _rearingHousesCtrl,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration(
                        labelText: 'Rearing Houses',
                        hintText: '1',
                        prefixIcon: Icons.home_work_outlined,
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _mulberryVarietyCtrl,
                decoration: _inputDecoration(
                  labelText: 'Mulberry Variety',
                  hintText: 'e.g. V1, S36, G4',
                  prefixIcon: Icons.eco_outlined,
                ),
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSpacing.xl),

              // 4. Action Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: _handleBackPress,
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFCBD5E1)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Color(0xFF475569),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: FilledButton.icon(
                        onPressed: _isSaving ? null : _saveProfile,
                        icon: _isSaving
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Icon(Icons.save_outlined, size: 20),
                        label: Text(
                          _isSaving ? 'Saving...' : 'Save Profile',
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }
}
