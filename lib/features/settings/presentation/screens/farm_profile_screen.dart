import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';
import '../../application/providers/settings_notifier.dart';
import '../../application/providers/settings_state.dart';
import '../../domain/entities/settings_entities.dart';

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
  late TextEditingController _emailCtrl;
  late TextEditingController _areaCtrl;

  @override
  void initState() {
    super.initState();
    _farmNameCtrl = TextEditingController();
    _ownerNameCtrl = TextEditingController();
    _addressCtrl = TextEditingController();
    _phoneCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _areaCtrl = TextEditingController();
    
    _initValues();
  }

  void _initValues() {
    final state = ref.read(settingsNotifierProvider);
    if (state is SettingsStateData) {
      final p = state.profile;
      _farmNameCtrl.text = p.farmName;
      _ownerNameCtrl.text = p.ownerName;
      _addressCtrl.text = p.address;
      _phoneCtrl.text = p.phone;
      _emailCtrl.text = p.email;
      _areaCtrl.text = p.farmArea.toString();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(settingsNotifierProvider, (previous, next) {
      if (next is SettingsStateError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(next.message), backgroundColor: Colors.red));
      }
    });

    return BaseScaffold(
      appBar: AppBar(
        title: const Text('Farm Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final currentProfile = ref.read(settingsNotifierProvider) is SettingsStateData 
                    ? (ref.read(settingsNotifierProvider) as SettingsStateData).profile 
                    : const FarmProfile();
                    
                final updated = currentProfile.copyWith(
                  farmName: _farmNameCtrl.text,
                  ownerName: _ownerNameCtrl.text,
                  address: _addressCtrl.text,
                  phone: _phoneCtrl.text,
                  email: _emailCtrl.text,
                  farmArea: double.tryParse(_areaCtrl.text) ?? 0.0,
                );
                
                ref.read(settingsNotifierProvider.notifier).saveProfile(updated);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Profile saved successfully'), backgroundColor: Colors.green));
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            TextFormField(
              controller: _farmNameCtrl,
              decoration: const InputDecoration(labelText: 'Farm Name', border: OutlineInputBorder()),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _ownerNameCtrl,
              decoration: const InputDecoration(labelText: 'Owner Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _phoneCtrl,
              decoration: const InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _emailCtrl,
              decoration: const InputDecoration(labelText: 'Email Address', border: OutlineInputBorder()),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _areaCtrl,
              decoration: const InputDecoration(labelText: 'Farm Area (Acres)', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _addressCtrl,
              decoration: const InputDecoration(labelText: 'Address', border: OutlineInputBorder()),
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
