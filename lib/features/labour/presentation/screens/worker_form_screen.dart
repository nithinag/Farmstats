import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';
import 'package:country_picker/country_picker.dart';
import '../theme/labour_theme.dart';
import '../widgets/labour_components.dart';
import '../../domain/entities/labour_entities.dart';
import '../../application/providers/labour_notifier.dart';
import '../../application/services/worker_photo_service.dart';
import '../../../settings/application/services/settings_validator_service.dart';

class WorkerFormScreen extends ConsumerStatefulWidget {
  final LabourWorker? worker;
  const WorkerFormScreen({super.key, this.worker});

  @override
  ConsumerState<WorkerFormScreen> createState() => _WorkerFormScreenState();
}

class _WorkerFormScreenState extends ConsumerState<WorkerFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _wageController;
  late TextEditingController _notesController;

  String _countryCode = 'IN';
  String _dialCode = '+91';
  String? _customPhotoPath;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final w = widget.worker;
    _nameController = TextEditingController(text: w?.fullName ?? '');
    _addressController = TextEditingController(text: w?.address ?? '');
    _wageController = TextEditingController(
      text: w != null ? w.dailyWage.toStringAsFixed(0) : '500',
    );
    _notesController = TextEditingController(text: w?.notes ?? '');

    // Parse phone & country if editing
    String nationalPhone = '';
    if (w != null && w.phoneNumber.isNotEmpty) {
      final raw = w.phoneNumber.trim();
      if (raw.startsWith('+91')) {
        _countryCode = 'IN';
        _dialCode = '+91';
        nationalPhone = raw.substring(3).trim();
      } else if (raw.startsWith('+')) {
        final match = RegExp(r'^\+(\d{1,4})\s*(.*)$').firstMatch(raw);
        if (match != null) {
          _dialCode = '+${match.group(1)}';
          nationalPhone = match.group(2) ?? '';
        } else {
          nationalPhone = raw;
        }
      } else {
        nationalPhone = raw;
      }
    }
    _phoneController = TextEditingController(text: nationalPhone);

    _loadExistingPhoto();
  }

  Future<void> _loadExistingPhoto() async {
    if (widget.worker != null) {
      final path = await WorkerPhotoService.getPhotoPath(widget.worker!.id);
      if (mounted && path != null) {
        setState(() => _customPhotoPath = path);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _wageController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String _getFlagEmoji(String iso) {
    try {
      final country = Country.tryParse(iso);
      if (country != null) return country.flagEmoji;
    } catch (_) {}
    return '🇮🇳';
  }

  String? _validatePhone(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Phone number is required';
    }
    final trimmed = val.trim().replaceAll(RegExp(r'[\s\-]'), '');
    if (_countryCode == 'IN') {
      if (trimmed.length > 10) {
        return 'Indian mobile number cannot exceed 10 digits';
      }
      if (trimmed.length < 10) {
        return 'Indian mobile number must be exactly 10 digits';
      }
      if (!RegExp(r'^[6-9]\d{9}$').hasMatch(trimmed)) {
        return 'Indian mobile number must start with 6, 7, 8, or 9';
      }
      return null;
    }

    return SettingsValidatorService.validateCountryPhone(
      trimmed,
      countryCode: _countryCode,
      dialCode: _dialCode,
    );
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);
    try {
      final nationalDigits = _phoneController.text.trim().replaceAll(RegExp(r'[\s\-]'), '');
      final formattedPhone = '$_dialCode $nationalDigits'.trim();
      final wage = double.tryParse(_wageController.text.trim()) ?? 500.0;
      final workerId = widget.worker?.id ?? const Uuid().v4();

      final worker = LabourWorker(
        id: workerId,
        fullName: _nameController.text.trim(),
        phoneNumber: formattedPhone,
        address: _addressController.text.trim().isNotEmpty ? _addressController.text.trim() : null,
        role: widget.worker?.role ?? WorkerRole.other,
        dailyWage: wage,
        joiningDate: widget.worker?.joiningDate ?? DateTime.now(),
        status: widget.worker?.status ?? WorkerStatus.active,
        notes: _notesController.text.trim().isNotEmpty ? _notesController.text.trim() : null,
      );

      bool success;
      if (widget.worker != null) {
        success = await ref.read(labourNotifierProvider.notifier).updateWorker(worker);
      } else {
        success = await ref.read(labourNotifierProvider.notifier).addWorker(worker);
      }

      if (success) {
        // Handle worker photo
        if (_customPhotoPath != null) {
          await WorkerPhotoService.setPhotoPath(workerId, _customPhotoPath!);
        } else if (widget.worker != null) {
          await WorkerPhotoService.deletePhoto(workerId);
        }

        if (mounted) {
          showLabourSuccessFeedback(
            context,
            title: widget.worker != null ? 'Worker Updated Successfully' : 'Worker Added Successfully',
            subtitle: '${worker.fullName} has been saved to your farm workers.',
          );
          if (Navigator.maybeOf(context)?.canPop() == true) {
            context.pop();
          } else {
            context.go('/labour');
          }
        }
      } else {
        if (mounted) {
          showLabourErrorFeedback(
            context,
            title: 'Failed to Save Worker',
            subtitle: 'An error occurred while saving the worker details.',
          );
        }
      }
    } catch (e) {
      if (mounted) {
        showLabourErrorFeedback(
          context,
          title: 'Error Saving Worker',
          subtitle: e.toString(),
        );
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.worker != null;
    final flag = _getFlagEmoji(_countryCode);

    return Scaffold(
      backgroundColor: LabourColors.background,
      appBar: AppBar(
        backgroundColor: LabourColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: LabourColors.primaryText),
          onPressed: () {
            if (Navigator.maybeOf(context)?.canPop() == true) {
              context.pop();
            } else {
              context.go('/labour');
            }
          },
        ),
        title: Text(
          isEditing ? 'Edit Worker' : 'Add Worker',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: LabourColors.primaryText,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Photo Upload Circle
                      Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                WorkerPhotoService.showPhotoOptionsModal(
                                  context: context,
                                  hasCustomPhoto: _customPhotoPath != null,
                                  onPhotoSelected: (path) {
                                    setState(() => _customPhotoPath = path);
                                  },
                                );
                              },
                              child: Container(
                                width: 88,
                                height: 88,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: LabourColors.softGreenSurface,
                                  border: Border.all(color: LabourColors.border, width: 1.5),
                                  image: _customPhotoPath != null && File(_customPhotoPath!).existsSync()
                                      ? DecorationImage(
                                          image: FileImage(File(_customPhotoPath!)),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: _customPhotoPath == null || !File(_customPhotoPath!).existsSync()
                                    ? const Icon(
                                        Icons.camera_alt_rounded,
                                        size: 34,
                                        color: LabourColors.forestGreen,
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Add Profile Photo\n(Optional)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.3,
                                color: LabourColors.secondaryText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Full Name
                      _buildFieldLabel('Full Name *'),
                      TextFormField(
                        controller: _nameController,
                        textCapitalization: TextCapitalization.words,
                        style: const TextStyle(fontSize: 14, color: LabourColors.primaryText),
                        decoration: _inputDecoration(
                          hint: 'Enter worker name',
                          prefixIcon: const Icon(Icons.person_outline_rounded, color: LabourColors.secondaryText, size: 20),
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Worker name is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Phone Number
                      _buildFieldLabel('Phone Number *'),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(fontSize: 14, color: LabourColors.primaryText),
                        decoration: InputDecoration(
                          hintText: 'Enter phone number',
                          hintStyle: const TextStyle(fontSize: 14, color: LabourColors.mutedText),
                          filled: true,
                          fillColor: LabourColors.cardSurface,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          helperText: _countryCode == 'IN' ? 'Indian numbers must be 10 digits' : null,
                          helperStyle: const TextStyle(fontSize: 11, color: LabourColors.secondaryText),
                          prefixIcon: InkWell(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                favorite: ['IN', 'US', 'GB', 'AE', 'AU'],
                                countryListTheme: CountryListThemeData(
                                  bottomSheetHeight: 500,
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                                  searchTextStyle: const TextStyle(fontSize: 14, color: LabourColors.primaryText),
                                  inputDecoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.search, size: 20, color: LabourColors.secondaryText),
                                    hintText: 'Search country or code...',
                                    filled: true,
                                    fillColor: LabourColors.background,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: const BorderSide(color: LabourColors.border),
                                    ),
                                  ),
                                ),
                                onSelect: (Country c) {
                                  setState(() {
                                    _countryCode = c.countryCode;
                                    _dialCode = '+${c.phoneCode}';
                                  });
                                },
                              );
                            },
                            borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12, right: 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(flag, style: const TextStyle(fontSize: 16)),
                                  const SizedBox(width: 4),
                                  Text(
                                    _dialCode,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: LabourColors.primaryText,
                                    ),
                                  ),
                                  const Icon(Icons.arrow_drop_down, size: 16, color: LabourColors.secondaryText),
                                  Container(
                                    height: 20,
                                    width: 1,
                                    margin: const EdgeInsets.symmetric(horizontal: 8),
                                    color: LabourColors.border,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: LabourColors.border),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: LabourColors.border),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: LabourColors.forestGreen, width: 1.5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: LabourColors.error),
                          ),
                        ),
                        validator: _validatePhone,
                      ),
                      const SizedBox(height: 16),

                      // Address
                      _buildFieldLabel('Address (Optional)'),
                      TextFormField(
                        controller: _addressController,
                        style: const TextStyle(fontSize: 14, color: LabourColors.primaryText),
                        decoration: _inputDecoration(
                          hint: 'Enter address',
                          prefixIcon: const Icon(Icons.location_on_outlined, color: LabourColors.secondaryText, size: 20),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Default Daily Wage
                      _buildFieldLabel('Default Daily Wage'),
                      TextFormField(
                        controller: _wageController,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(fontSize: 14, color: LabourColors.primaryText),
                        decoration: _inputDecoration(
                          hint: 'Enter daily wage (₹)',
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                            child: Text(
                              '₹',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: LabourColors.secondaryText,
                              ),
                            ),
                          ),
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Daily wage cannot be empty';
                          }
                          final num = double.tryParse(val.trim());
                          if (num == null || num < 0) {
                            return 'Enter a valid wage amount';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Notes
                      _buildFieldLabel('Notes (Optional)'),
                      TextFormField(
                        controller: _notesController,
                        maxLines: 3,
                        style: const TextStyle(fontSize: 14, color: LabourColors.primaryText),
                        decoration: _inputDecoration(
                          hint: 'Additional notes about the worker',
                          prefixIcon: const Padding(
                            padding: EdgeInsets.only(left: 12, top: 12, right: 8),
                            child: Align(
                              alignment: Alignment.topCenter,
                              widthFactor: 1,
                              heightFactor: 1,
                              child: Icon(Icons.description_outlined, color: LabourColors.secondaryText, size: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Actions (Cancel & Save Worker)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: const BoxDecoration(
                color: LabourColors.cardSurface,
                border: Border(top: BorderSide(color: LabourColors.border)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: OutlinedButton(
                      onPressed: _isSaving
                          ? null
                          : () {
                              if (Navigator.maybeOf(context)?.canPop() == true) {
                                context.pop();
                              } else {
                                context.go('/labour');
                              }
                            },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: LabourColors.border),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: LabourColors.secondaryText,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: _isSaving ? null : _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LabourColors.forestGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: _isSaving
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                            )
                          : const Text(
                              'Save Worker',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
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

  Widget _buildFieldLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: LabourColors.primaryText,
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({required String hint, Widget? prefixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14, color: LabourColors.mutedText),
      filled: true,
      fillColor: LabourColors.cardSurface,
      prefixIcon: prefixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LabourColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LabourColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LabourColors.forestGreen, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: LabourColors.error),
      ),
    );
  }
}
