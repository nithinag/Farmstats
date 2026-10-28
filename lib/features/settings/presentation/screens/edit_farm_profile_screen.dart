import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../shared/widgets/farmer_avatar.dart';
import '../../application/services/profile_photo_service.dart';
import '../../application/services/settings_validator_service.dart';
import '../../application/providers/settings_notifier.dart';
import '../../application/providers/settings_state.dart';
import '../../domain/entities/settings_entities.dart';
import 'select_country_screen.dart';

class EditFarmProfileScreen extends ConsumerStatefulWidget {
  const EditFarmProfileScreen({super.key});

  @override
  ConsumerState<EditFarmProfileScreen> createState() => _EditFarmProfileScreenState();
}

class _EditFarmProfileScreenState extends ConsumerState<EditFarmProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _ownerNameCtrl;
  late TextEditingController _farmNameCtrl;
  late TextEditingController _addressCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _areaCtrl;
  late TextEditingController _rearingHousesCtrl;
  String _selectedVariety = 'V1';

  // Local editing photo state (separate from persisted profile)
  String _photoPath = '';
  String _countryCode = 'IN';
  String _dialCode = '+91';

  // Snapshot of loaded values to accurately detect unsaved changes
  String _initialOwnerName = '';
  String _initialFarmName = '';
  String _initialAddress = '';
  String _initialPhone = '';
  String _initialCountryCode = 'IN';
  String _initialDialCode = '+91';
  String _initialArea = '';
  String _initialHouses = '';
  String _initialVariety = 'V1';
  String _initialPhotoPath = '';

  bool _initialized = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _ownerNameCtrl = TextEditingController();
    _farmNameCtrl = TextEditingController();
    _addressCtrl = TextEditingController();
    _phoneCtrl = TextEditingController();
    _areaCtrl = TextEditingController();
    _rearingHousesCtrl = TextEditingController();
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
      _initialOwnerName = p.ownerName.trim();
      _initialFarmName = p.farmName.trim();
      _initialAddress = p.address.trim();
      _initialPhone = p.phone.trim();
      _initialCountryCode = p.countryCode.isNotEmpty ? p.countryCode : 'IN';
      _initialDialCode = p.dialCode.isNotEmpty ? p.dialCode : '+91';
      _initialArea = p.farmArea > 0 ? p.farmArea.toString() : '2.5';
      _initialHouses = p.numRearingHouses > 0 ? p.numRearingHouses.toString() : '1';
      _initialVariety = p.defaultMulberryVariety.isNotEmpty ? p.defaultMulberryVariety : 'V1';
      _initialPhotoPath = p.photoPath;

      _ownerNameCtrl.text = _initialOwnerName;
      _farmNameCtrl.text = _initialFarmName;
      _addressCtrl.text = _initialAddress;
      _phoneCtrl.text = _initialPhone;
      _countryCode = _initialCountryCode;
      _dialCode = _initialDialCode;
      _areaCtrl.text = _initialArea;
      _rearingHousesCtrl.text = _initialHouses;
      _selectedVariety = _initialVariety;
      _photoPath = _initialPhotoPath;
    }
  }

  bool get _hasUnsavedChanges {
    return _ownerNameCtrl.text.trim() != _initialOwnerName ||
        _farmNameCtrl.text.trim() != _initialFarmName ||
        _addressCtrl.text.trim() != _initialAddress ||
        _phoneCtrl.text.trim() != _initialPhone ||
        _countryCode != _initialCountryCode ||
        _dialCode != _initialDialCode ||
        _areaCtrl.text.trim() != _initialArea ||
        _rearingHousesCtrl.text.trim() != _initialHouses ||
        _selectedVariety != _initialVariety ||
        _photoPath.trim() != _initialPhotoPath.trim();
  }

  Future<void> _showDiscardDialog(BuildContext context) async {
    final discard = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Discard Unsaved Changes?'),
          content: const Text(
            'You have unsaved changes that will be lost if you leave now.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Continue Editing'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColorScheme.error,
                foregroundColor: Colors.white,
              ),
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Discard Changes'),
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

  Future<void> _openCountryPicker() async {
    final selectedCountry = await Navigator.push<Country>(
      context,
      MaterialPageRoute(
        builder: (_) => SelectCountryScreen(selectedCountryCode: _countryCode),
      ),
    );

    if (selectedCountry != null && mounted) {
      setState(() {
        _countryCode = selectedCountry.countryCode;
        _dialCode = '+${selectedCountry.phoneCode}';
      });
    }
  }

  Future<void> _saveProfile() async {
    if (_isSaving) return; // Prevent double taps

    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSaving = true);

    try {
      final currentProfile = ref.read(settingsNotifierProvider) is SettingsStateData
          ? (ref.read(settingsNotifierProvider) as SettingsStateData).profile
          : const FarmProfile();

      final updated = currentProfile.copyWith(
        ownerName: _ownerNameCtrl.text.trim(),
        farmName: _farmNameCtrl.text.trim(),
        address: _addressCtrl.text.trim(),
        phone: _phoneCtrl.text.trim(),
        countryCode: _countryCode,
        dialCode: _dialCode,
        farmArea: double.tryParse(_areaCtrl.text.trim()) ?? 0.0,
        numRearingHouses: int.tryParse(_rearingHousesCtrl.text.trim()) ?? 1,
        defaultMulberryVariety: _selectedVariety,
        photoPath: _photoPath.trim(),
      );

      await ref.read(settingsNotifierProvider.notifier).saveProfile(updated);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Farm profile updated successfully'),
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
    _ownerNameCtrl.dispose();
    _farmNameCtrl.dispose();
    _addressCtrl.dispose();
    _phoneCtrl.dispose();
    _areaCtrl.dispose();
    _rearingHousesCtrl.dispose();
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
      labelStyle: const TextStyle(fontSize: 14, color: Color(0xFF64748B)),
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
      padding: const EdgeInsets.only(bottom: 10.0, top: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Color(0xFF0F1E36),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final previewName = _ownerNameCtrl.text.isNotEmpty ? _ownerNameCtrl.text : 'Farmer';
    final flag = Country.tryParse(_countryCode)?.flagEmoji ?? '🇮🇳';

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
            'Edit Farm Profile',
            style: TextStyle(
              color: Color(0xFF0F1E36),
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
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
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              // SECTION 1: PROFILE PHOTO
              _buildSectionHeader('Profile Photo'),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 82,
                          height: 82,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFE2E8F0), width: 2),
                          ),
                          child: FarmerAvatar(
                            photoPath: _photoPath,
                            name: previewName,
                            size: 78,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: _pickPhoto,
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: AppColorScheme.forestGreen,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: _pickPhoto,
                          icon: const Icon(Icons.image_outlined, size: 16),
                          label: const Text('Change Photo'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColorScheme.primary,
                            side: const BorderSide(color: AppColorScheme.primary),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          ),
                        ),
                        if (_photoPath.isNotEmpty) ...[
                          const SizedBox(width: 10),
                          OutlinedButton.icon(
                            onPressed: () {
                              setState(() => _photoPath = '');
                            },
                            icon: const Icon(Icons.delete_outline, size: 16),
                            label: const Text('Remove Photo'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColorScheme.error,
                              side: const BorderSide(color: AppColorScheme.error),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),

              // SECTION 2: FARMER & FARM
              _buildSectionHeader('Farmer & Farm'),
              TextFormField(
                controller: _ownerNameCtrl,
                decoration: _inputDecoration(
                  labelText: 'Farmer / Owner Name *',
                  hintText: 'e.g. Leetej Nagabushanam',
                  prefixIcon: Icons.person_outline,
                ),
                validator: SettingsValidatorService.validateOwnerName,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _farmNameCtrl,
                decoration: _inputDecoration(
                  labelText: 'Farm Name *',
                  hintText: 'e.g. My Sericulture Farm',
                  prefixIcon: Icons.apartment_outlined,
                ),
                validator: SettingsValidatorService.validateFarmName,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: _addressCtrl,
                decoration: _inputDecoration(
                  labelText: 'Location / Address *',
                  hintText: 'e.g. Karnataka, India',
                  prefixIcon: Icons.location_on_outlined,
                ),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Location is required' : null,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: 22),

              // SECTION 3: SERICULTURE CONFIGURATION
              _buildSectionHeader('Sericulture Configuration'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _areaCtrl,
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      decoration: _inputDecoration(
                        labelText: 'Farm Area (Acres) *',
                        hintText: '2.5',
                        prefixIcon: Icons.landscape_outlined,
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Area required';
                        final num = double.tryParse(v.trim());
                        if (num == null || num <= 0) return 'Invalid area';
                        return null;
                      },
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _rearingHousesCtrl,
                      keyboardType: TextInputType.number,
                      decoration: _inputDecoration(
                        labelText: 'Rearing Houses *',
                        hintText: '1',
                        prefixIcon: Icons.home_work_outlined,
                      ),
                      validator: (v) {
                        if (v == null || v.trim().isEmpty) return 'Houses required';
                        final num = int.tryParse(v.trim());
                        if (num == null || num <= 0) return 'Invalid count';
                        return null;
                      },
                      onChanged: (_) => setState(() {}),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              DropdownButtonFormField<String>(
                initialValue: _selectedVariety,
                decoration: _inputDecoration(
                  labelText: 'Mulberry Variety *',
                  prefixIcon: Icons.eco_outlined,
                ),
                icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF64748B)),
                items: const [
                  DropdownMenuItem(value: 'V1', child: Text('V1')),
                  DropdownMenuItem(value: 'G4', child: Text('G4')),
                  DropdownMenuItem(value: 'S36', child: Text('S36')),
                  DropdownMenuItem(value: 'DD', child: Text('DD')),
                  DropdownMenuItem(value: 'Other', child: Text('Other')),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() => _selectedVariety = val);
                  }
                },
              ),
              const SizedBox(height: 22),

              // SECTION 4: CONTACT INFORMATION
              _buildSectionHeader('Contact Information'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Country Code Picker Box
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Country Code',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF64748B)),
                      ),
                      const SizedBox(height: 6),
                      InkWell(
                        onTap: _openCountryPicker,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 52,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(flag, style: const TextStyle(fontSize: 18)),
                              const SizedBox(width: 4),
                              Text(
                                _dialCode,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0F1E36),
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 18, color: Color(0xFF64748B)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Phone Number Input
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Phone Number',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF64748B)),
                        ),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: _phoneCtrl,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: _countryCode == 'IN' ? '7418661938' : 'Phone Number',
                            prefixIcon: const Icon(Icons.phone_outlined, size: 20, color: Color(0xFF64748B)),
                            filled: true,
                            fillColor: const Color(0xFFF8FAFC),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
                          ),
                          validator: (val) => SettingsValidatorService.validateCountryPhone(
                            val,
                            countryCode: _countryCode,
                            dialCode: _dialCode,
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Bottom Action Buttons matching Screen 3
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 50,
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
                  const SizedBox(width: 14),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 50,
                      child: FilledButton.icon(
                        onPressed: _isSaving ? null : _saveProfile,
                        icon: _isSaving
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Icon(Icons.check_circle_outline, size: 20),
                        label: Text(
                          _isSaving ? 'Saving...' : 'Save Profile',
                          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF13532D),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
