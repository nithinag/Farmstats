import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../shared/widgets/farmer_avatar.dart';
import '../../application/services/profile_photo_service.dart';
import '../../application/providers/settings_notifier.dart';
import '../../application/providers/settings_state.dart';
import '../../domain/entities/settings_entities.dart';

class FarmProfileScreen extends ConsumerWidget {
  const FarmProfileScreen({super.key});

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
                    ? 'Profile photo updated successfully'
                    : 'Profile photo removed',
              ),
              backgroundColor: AppColorScheme.forestGreen,
            ),
          );
        }
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

    final profile = (state is SettingsStateData)
        ? state.profile
        : const FarmProfile(
            farmName: 'My Sericulture Farm',
            ownerName: 'Nithin Nagabushanam',
            address: 'Chittoor, Andhra Pradesh',
          );

    final displayName = profile.ownerName.isNotEmpty ? profile.ownerName : 'Farmer';
    final displayFarmName = profile.farmName.isNotEmpty ? profile.farmName : 'My Sericulture Farm';
    final displayLocation = profile.address.isNotEmpty ? profile.address : 'Karnataka, India';
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
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Farm Profile',
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton.icon(
            onPressed: () => context.push('/settings/profile/edit'),
            icon: const Icon(Icons.edit_outlined, size: 18, color: AppColorScheme.primary),
            label: const Text(
              'Edit',
              style: TextStyle(
                color: AppColorScheme.primary,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
        children: [
          // 1. Profile Hero Section
          Center(
            child: Column(
              children: [
                FarmerAvatar(
                  photoPath: profile.photoPath,
                  name: displayName,
                  size: 96,
                  showEditBadge: true,
                  badgeIcon: Icons.camera_alt_rounded,
                  badgeColor: AppColorScheme.forestGreen,
                  onTap: () => _handlePhotoAction(context, ref, profile),
                  onBadgeTap: () => _handlePhotoAction(context, ref, profile),
                ),
                const SizedBox(height: 14),
                Text(
                  displayName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  displayFarmName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // 2. Section: Farm Details
          _buildSectionHeader('SERICULTURE FARM CONFIGURATION'),
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
                _buildReadOnlyRow(
                  icon: Icons.location_on_outlined,
                  title: 'Location / Address',
                  value: displayLocation,
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildReadOnlyRow(
                  icon: Icons.landscape_outlined,
                  title: 'Farm Area',
                  value: displayArea,
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildReadOnlyRow(
                  icon: Icons.home_work_outlined,
                  title: 'Rearing Houses',
                  value: displayHouses,
                ),
                const Divider(height: 1, indent: 16, endIndent: 16, color: Color(0xFFE2E8F0)),
                _buildReadOnlyRow(
                  icon: Icons.eco_outlined,
                  title: 'Mulberry Variety',
                  value: displayVariety,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          // 3. Section: Contact
          _buildSectionHeader('CONTACT'),
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
            child: _buildReadOnlyRow(
              icon: Icons.phone_outlined,
              title: 'Contact Phone',
              value: displayPhone,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // 4. Primary Edit Action Button
          SizedBox(
            height: 48,
            child: FilledButton.icon(
              onPressed: () => context.push('/settings/profile/edit'),
              icon: const Icon(Icons.edit_outlined, size: 20),
              label: const Text(
                'Edit Farm Profile',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: AppColorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 30),
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

  Widget _buildReadOnlyRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
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
            constraints: const BoxConstraints(maxWidth: 190),
            child: Text(
              value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF64748B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
