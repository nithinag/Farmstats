import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../../../core/theme/radius.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../application/providers/settings_notifier.dart';
import '../../application/providers/settings_state.dart';
import '../../application/providers/language_provider.dart';
import '../../domain/entities/settings_entities.dart';

class FarmProfileScreen extends ConsumerStatefulWidget {
  const FarmProfileScreen({super.key});

  @override
  ConsumerState<FarmProfileScreen> createState() => _FarmProfileScreenState();
}

class _FarmProfileScreenState extends ConsumerState<FarmProfileScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _farmNameCtrl;
  late TextEditingController _ownerNameCtrl;
  late TextEditingController _addressCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _areaCtrl;
  late TextEditingController _rearingHousesCtrl;
  late TextEditingController _mulberryVarietyCtrl;
  late TextEditingController _gstCtrl;

  @override
  void initState() {
    super.initState();
    _farmNameCtrl = TextEditingController();
    _ownerNameCtrl = TextEditingController();
    _addressCtrl = TextEditingController();
    _phoneCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _areaCtrl = TextEditingController();
    _rearingHousesCtrl = TextEditingController();
    _mulberryVarietyCtrl = TextEditingController();
    _gstCtrl = TextEditingController();

    _loadData();
  }

  void _loadData() {
    final state = ref.read(settingsNotifierProvider);
    if (state is SettingsStateData) {
      final p = state.profile;
      _farmNameCtrl.text = p.farmName.isNotEmpty ? p.farmName : 'My Sericulture Farm';
      _ownerNameCtrl.text = p.ownerName.isNotEmpty ? p.ownerName : 'Farmer';
      _addressCtrl.text = p.address.isNotEmpty ? p.address : 'Karnataka, India';
      _phoneCtrl.text = p.phone;
      _emailCtrl.text = p.email;
      _areaCtrl.text = p.farmArea > 0 ? p.farmArea.toString() : '2.5';
      _rearingHousesCtrl.text = p.numRearingHouses > 0 ? p.numRearingHouses.toString() : '1';
      _mulberryVarietyCtrl.text = p.defaultMulberryVariety.isNotEmpty ? p.defaultMulberryVariety : 'V1';
      _gstCtrl.text = p.gstNumber;
    }
  }

  @override
  void dispose() {
    _farmNameCtrl.dispose();
    _ownerNameCtrl.dispose();
    _addressCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _areaCtrl.dispose();
    _rearingHousesCtrl.dispose();
    _mulberryVarietyCtrl.dispose();
    _gstCtrl.dispose();
    super.dispose();
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      final currentProfile = ref.read(settingsNotifierProvider) is SettingsStateData
          ? (ref.read(settingsNotifierProvider) as SettingsStateData).profile
          : const FarmProfile();

      final updated = currentProfile.copyWith(
        farmName: _farmNameCtrl.text.trim(),
        ownerName: _ownerNameCtrl.text.trim(),
        address: _addressCtrl.text.trim(),
        phone: _phoneCtrl.text.trim(),
        email: _emailCtrl.text.trim(),
        farmArea: double.tryParse(_areaCtrl.text) ?? 0.0,
        numRearingHouses: int.tryParse(_rearingHousesCtrl.text) ?? 1,
        defaultMulberryVariety: _mulberryVarietyCtrl.text.trim(),
        gstNumber: _gstCtrl.text.trim(),
      );

      ref.read(settingsNotifierProvider.notifier).saveProfile(updated);
      setState(() => _isEditing = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Farm profile updated successfully'),
          backgroundColor: AppColorScheme.primary,
        ),
      );
    }
  }

  String _getInitials(String name) {
    final parts = name.trim().split(' ');
    if (parts.isEmpty || parts[0].isEmpty) return 'F';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final settingsState = ref.watch(settingsNotifierProvider);
    final languageCode = ref.watch(languageProvider);
    final currentLang = kSupportedLanguages.firstWhere(
      (l) => l.code == languageCode,
      orElse: () => kSupportedLanguages[1],
    );
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final profile = (settingsState is SettingsStateData)
        ? settingsState.profile
        : const FarmProfile(farmName: 'My Sericulture Farm', ownerName: 'Farmer');

    final displayName = profile.ownerName.isNotEmpty ? profile.ownerName : 'Farmer';
    final displayFarmName = profile.farmName.isNotEmpty ? profile.farmName : 'My Sericulture Farm';
    final displayAddress = profile.address.isNotEmpty ? profile.address : 'Karnataka, India';

    return BaseScaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Profile' : 'Farm Profile'),
        elevation: 0,
        actions: [
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              tooltip: 'Edit Profile',
              onPressed: () {
                _loadData();
                setState(() => _isEditing = true);
              },
            )
          else
            IconButton(
              icon: const Icon(Icons.check, color: AppColorScheme.primaryLight),
              tooltip: 'Save Profile',
              onPressed: _saveProfile,
            ),
        ],
      ),
      body: _isEditing ? _buildEditForm(context, isDark) : _buildProfileView(context, profile, displayName, displayFarmName, displayAddress, currentLang, isDark),
    );
  }

  Widget _buildProfileView(
    BuildContext context,
    FarmProfile profile,
    String displayName,
    String displayFarmName,
    String displayAddress,
    AppLanguage currentLang,
    bool isDark,
  ) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, AppSpacing.xxl),
      children: [
        // 1. HERO AVATAR & IDENTITY CARD
        Container(
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceLight,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            border: Border.all(
              color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Avatar
              Container(
                width: 88,
                height: 88,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF1B5E20), Color(0xFF43A047)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColorScheme.primary.withValues(alpha: 0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    _getInitials(displayName),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Farmer Name
              Text(
                displayName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                    ),
              ),
              const SizedBox(height: 4),

              // Farm Name
              Text(
                displayFarmName,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColorScheme.primaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),

              // Badges
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 6,
                children: [
                  _buildTagBadge(context, '🐛 Sericulture Farm', isDark),
                  _buildTagBadge(context, '📍 $displayAddress', isDark),
                  if (profile.defaultMulberryVariety.isNotEmpty)
                    _buildTagBadge(context, '🌿 Variety: ${profile.defaultMulberryVariety}', isDark),
                ],
              ),
              const SizedBox(height: AppSpacing.md),

              // Quick Edit Profile Button
              OutlinedButton.icon(
                onPressed: () {
                  _loadData();
                  setState(() => _isEditing = true);
                },
                icon: const Icon(Icons.edit, size: 16),
                label: const Text('Edit Farm Profile'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColorScheme.primary,
                  side: const BorderSide(color: AppColorScheme.primaryLight),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.pill)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // 2. CAPACITY & SPECS METRICS
        Row(
          children: [
            Expanded(
              child: _buildSpecCard(
                context,
                title: 'Farm Area',
                value: '${profile.farmArea > 0 ? profile.farmArea : 2.5} Acres',
                icon: Icons.landscape_outlined,
                color: const Color(0xFF2E7D32),
                isDark: isDark,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildSpecCard(
                context,
                title: 'Rearing Houses',
                value: '${profile.numRearingHouses > 0 ? profile.numRearingHouses : 1} Unit(s)',
                icon: Icons.home_work_outlined,
                color: const Color(0xFF1565C0),
                isDark: isDark,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: _buildSpecCard(
                context,
                title: 'Mulberry',
                value: profile.defaultMulberryVariety.isNotEmpty ? profile.defaultMulberryVariety : 'V1',
                icon: Icons.eco_outlined,
                color: const Color(0xFFE65100),
                isDark: isDark,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),

        // 3. CONTACT & REGISTRATION
        _buildSectionTitle(context, 'CONTACT & REGISTRATION'),
        _buildInfoGroup(
          context,
          isDark: isDark,
          items: [
            _InfoItem(
              icon: Icons.phone_outlined,
              label: 'Phone Number',
              value: profile.phone.isNotEmpty ? profile.phone : 'Not configured',
            ),
            _InfoItem(
              icon: Icons.email_outlined,
              label: 'Email Address',
              value: profile.email.isNotEmpty ? profile.email : 'Not configured',
            ),
            _InfoItem(
              icon: Icons.badge_outlined,
              label: 'GST / Farmer ID',
              value: profile.gstNumber.isNotEmpty ? profile.gstNumber : 'None',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),

        // 4. PREFERENCES SHORTCUTS
        _buildSectionTitle(context, 'PREFERENCES'),
        _buildInfoGroup(
          context,
          isDark: isDark,
          items: [
            _InfoItem(
              icon: Icons.translate,
              label: 'App Language',
              value: '${currentLang.nativeName} (${currentLang.englishName})',
              onTap: () => context.push('/settings/preferences'),
            ),
            _InfoItem(
              icon: Icons.currency_rupee,
              label: 'Currency & Units',
              value: 'INR (₹) • kg • °C • acres',
              onTap: () => context.push('/settings/preferences'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),

        // 5. APP SYSTEM
        _buildSectionTitle(context, 'APPLICATION'),
        _buildInfoGroup(
          context,
          isDark: isDark,
          items: [
            _InfoItem(
              icon: Icons.backup_outlined,
              label: 'Backup & Restore',
              value: 'Manage local database snapshots',
              onTap: () => context.push('/settings/backup'),
            ),
            _InfoItem(
              icon: Icons.info_outline,
              label: 'About FARMSTATS',
              value: 'Version 1.0.0 (Production Sericulture OS)',
              onTap: () => context.push('/settings/about'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildEditForm(BuildContext context, bool isDark) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          _buildSectionTitle(context, 'FARM IDENTIFICATION'),
          const SizedBox(height: AppSpacing.xs),
          TextFormField(
            controller: _farmNameCtrl,
            decoration: const InputDecoration(
              labelText: 'Farm Name *',
              hintText: 'e.g. My Sericulture Farm',
              prefixIcon: Icon(Icons.business_outlined),
            ),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Farm name is required' : null,
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _ownerNameCtrl,
            decoration: const InputDecoration(
              labelText: 'Farmer / Owner Name *',
              hintText: 'e.g. Nithin Nagabushanam',
              prefixIcon: Icon(Icons.person_outline),
            ),
            validator: (v) => (v == null || v.trim().isEmpty) ? 'Farmer name is required' : null,
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _addressCtrl,
            decoration: const InputDecoration(
              labelText: 'Location / Farm Address',
              hintText: 'e.g. Ramanagara, Karnataka',
              prefixIcon: Icon(Icons.location_on_outlined),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _buildSectionTitle(context, 'REARING SPECIFICATIONS'),
          const SizedBox(height: AppSpacing.xs),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _areaCtrl,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Area (Acres)',
                    prefixIcon: Icon(Icons.landscape_outlined),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: TextFormField(
                  controller: _rearingHousesCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Rearing Houses',
                    prefixIcon: Icon(Icons.home_work_outlined),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _mulberryVarietyCtrl,
            decoration: const InputDecoration(
              labelText: 'Mulberry Variety',
              hintText: 'e.g. V1, S36, G4',
              prefixIcon: Icon(Icons.eco_outlined),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),

          _buildSectionTitle(context, 'CONTACT INFORMATION'),
          const SizedBox(height: AppSpacing.xs),
          TextFormField(
            controller: _phoneCtrl,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Contact Phone',
              hintText: 'e.g. +91 9876543210',
              prefixIcon: Icon(Icons.phone_outlined),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _emailCtrl,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              hintText: 'e.g. farmer@farmstats.in',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _gstCtrl,
            decoration: const InputDecoration(
              labelText: 'GST / Farmer Reg Number',
              hintText: 'Optional registration ID',
              prefixIcon: Icon(Icons.badge_outlined),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => setState(() => _isEditing = false),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _saveProfile,
                  icon: const Icon(Icons.save),
                  label: const Text('Save Profile'),
                  style: FilledButton.styleFrom(backgroundColor: AppColorScheme.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }

  Widget _buildTagBadge(BuildContext context, String text, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceContainerDark : const Color(0xFFF1F5F0),
        borderRadius: BorderRadius.circular(AppRadius.pill),
        border: Border.all(
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
        ),
      ),
    );
  }

  Widget _buildSpecCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceLight,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 2),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: AppSpacing.xs),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  Widget _buildInfoGroup(
    BuildContext context, {
    required bool isDark,
    required List<_InfoItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColorScheme.surfaceContainerDark : AppColorScheme.surfaceLight,
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
        ),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: isDark ? AppColorScheme.cardBorderDark : AppColorScheme.cardBorderLight,
        ),
        itemBuilder: (context, index) {
          final it = items[index];
          return ListTile(
            dense: true,
            leading: Icon(it.icon, size: 20, color: AppColorScheme.primaryLight),
            title: Text(it.label, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
            subtitle: Text(
              it.value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            trailing: it.onTap != null
                ? const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey)
                : null,
            onTap: it.onTap,
          );
        },
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
    this.onTap,
  });
}
