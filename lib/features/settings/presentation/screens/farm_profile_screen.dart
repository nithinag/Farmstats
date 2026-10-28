import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../../../shared/widgets/farmer_avatar.dart';
import '../../application/providers/settings_notifier.dart';
import '../../application/providers/settings_state.dart';
import '../../domain/entities/settings_entities.dart';

class FarmProfileScreen extends ConsumerWidget {
  const FarmProfileScreen({super.key});

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
        : const FarmProfile();

    final displayName = profile.ownerName.trim().isNotEmpty ? profile.ownerName.trim() : 'Sericulture Farmer';
    final displayFarmName = profile.farmName.trim().isNotEmpty ? profile.farmName.trim() : 'My Sericulture Farm';
    final displayLocation = profile.address.trim().isNotEmpty ? profile.address.trim() : 'Not configured';
    final displayArea = profile.farmArea > 0 ? '${profile.farmArea} Acres' : '2.5 Acres';
    final displayHouses = profile.numRearingHouses > 0 ? '${profile.numRearingHouses} Unit(s)' : '1 Unit(s)';
    final displayVariety = profile.defaultMulberryVariety.trim().isNotEmpty ? profile.defaultMulberryVariety.trim() : 'V1';
    final displayPhone = _formatPhone(profile);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
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
            color: Color(0xFF0F1E36),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton.icon(
              onPressed: () => context.push('/settings/profile/edit'),
              icon: const Icon(Icons.edit_outlined, size: 18, color: AppColorScheme.forestGreen),
              label: const Text(
                'Edit',
                style: TextStyle(
                  color: AppColorScheme.forestGreen,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          // 1. Profile Hero Section
          Center(
            child: Column(
              children: [
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: FarmerAvatar(
                    photoPath: profile.photoPath,
                    name: displayName,
                    size: 82,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  displayName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F1E36),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  displayFarmName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.eco_rounded, size: 16, color: Color(0xFF165B33)),
                    const SizedBox(width: 6),
                    Text(
                      'Sericulture Farmer',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF165B33).withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 2. Section: Farmer & Farm
          _buildSectionHeader('Farmer & Farm'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1E293B).withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildStackedInfoRow(
                  icon: Icons.person_outline,
                  label: 'Farmer / Owner Name',
                  value: displayName,
                ),
                const Divider(height: 1, indent: 56, endIndent: 16, color: Color(0xFFF1F5F9)),
                _buildStackedInfoRow(
                  icon: Icons.apartment_outlined,
                  label: 'Farm Name',
                  value: displayFarmName,
                ),
                const Divider(height: 1, indent: 56, endIndent: 16, color: Color(0xFFF1F5F9)),
                _buildStackedInfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'Location / Address',
                  value: displayLocation,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 3. Section: Sericulture Configuration
          _buildSectionHeader('Sericulture Configuration'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1E293B).withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildInlineInfoRow(
                  icon: Icons.landscape_outlined,
                  label: 'Farm Area (Acres)',
                  value: displayArea,
                ),
                const Divider(height: 1, indent: 56, endIndent: 16, color: Color(0xFFF1F5F9)),
                _buildInlineInfoRow(
                  icon: Icons.home_work_outlined,
                  label: 'Rearing Houses',
                  value: displayHouses,
                ),
                const Divider(height: 1, indent: 56, endIndent: 16, color: Color(0xFFF1F5F9)),
                _buildInlineInfoRow(
                  icon: Icons.eco_outlined,
                  label: 'Mulberry Variety',
                  value: displayVariety,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 4. Section: Contact Information
          _buildSectionHeader('Contact Information'),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9)),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1E293B).withValues(alpha: 0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _buildStackedInfoRow(
              icon: Icons.phone_outlined,
              label: 'Contact Phone',
              value: displayPhone,
            ),
          ),
          const SizedBox(height: 32),
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
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF0F1E36),
        ),
      ),
    );
  }

  Widget _buildStackedInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 22, color: const Color(0xFF64748B)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F1E36),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInlineInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 22, color: const Color(0xFF64748B)),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0F1E36),
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F1E36),
            ),
          ),
        ],
      ),
    );
  }
}
