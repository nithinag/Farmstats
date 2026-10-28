import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/theme/color_scheme.dart';
import '../../application/services/settings_validator_service.dart';

class CountryPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String countryCode;
  final String dialCode;
  final ValueChanged<Country> onCountrySelected;
  final ValueChanged<String>? onChanged;
  final bool isRequired;

  const CountryPhoneField({
    super.key,
    required this.controller,
    required this.countryCode,
    required this.dialCode,
    required this.onCountrySelected,
    this.onChanged,
    this.isRequired = false,
  });

  String _getFlagEmoji(String iso) {
    try {
      final country = Country.tryParse(iso);
      if (country != null) return country.flagEmoji;
    } catch (_) {}
    return '🇮🇳';
  }

  @override
  Widget build(BuildContext context) {
    final flag = _getFlagEmoji(countryCode);
    final displayDial = dialCode.startsWith('+') ? dialCode : '+$dialCode';

    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      onChanged: onChanged,
      validator: (val) {
        if (isRequired && (val == null || val.trim().isEmpty)) {
          return 'Phone number is required';
        }
        return SettingsValidatorService.validateCountryPhone(
          val,
          countryCode: countryCode,
          dialCode: dialCode,
        );
      },
      decoration: InputDecoration(
        labelText: 'Contact Phone',
        hintText: countryCode == 'IN' ? '98765 43210' : 'Enter mobile number',
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        prefixIcon: InkWell(
          onTap: () {
            showCountryPicker(
              context: context,
              showPhoneCode: true,
              favorite: ['IN', 'US', 'GB', 'AE', 'AU'],
              countryListTheme: CountryListThemeData(
                bottomSheetHeight: 520,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                searchTextStyle: const TextStyle(fontSize: 15, color: Color(0xFF1E293B)),
                inputDecoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF64748B)),
                  hintText: 'Search country or dialing code...',
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
                ),
              ),
              onSelect: onCountrySelected,
            );
          },
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(flag, style: const TextStyle(fontSize: 18)),
                const SizedBox(width: 6),
                Text(
                  displayDial,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_drop_down, size: 18, color: Color(0xFF64748B)),
                Container(
                  height: 24,
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: const Color(0xFFCBD5E1),
                ),
              ],
            ),
          ),
        ),
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
    );
  }
}
