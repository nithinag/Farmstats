import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import '../../../../core/theme/color_scheme.dart';

class SelectCountryScreen extends StatefulWidget {
  final String selectedCountryCode;

  const SelectCountryScreen({
    super.key,
    required this.selectedCountryCode,
  });

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  late List<Country> _allCountries;
  List<Country> _filteredCountries = [];

  static const List<String> _topCountryCodes = [
    'IN', 'US', 'GB', 'CA', 'AU', 'AE', 'SG', 'SA', 'MY', 'LK', 'DE', 'FR', 'QA',
  ];

  @override
  void initState() {
    super.initState();
    final all = CountryService().getAll();
    
    // Sort with common sericulture & trade countries first, then alphabetical
    final topCountries = <Country>[];
    final otherCountries = <Country>[];

    for (final code in _topCountryCodes) {
      final match = all.where((c) => c.countryCode == code);
      if (match.isNotEmpty) {
        topCountries.add(match.first);
      }
    }

    for (final c in all) {
      if (!_topCountryCodes.contains(c.countryCode)) {
        otherCountries.add(c);
      }
    }

    _allCountries = [...topCountries, ...otherCountries];
    _filteredCountries = List.from(_allCountries);
    _searchCtrl.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchCtrl.text.trim().toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredCountries = List.from(_allCountries);
      } else {
        _filteredCountries = _allCountries.where((c) {
          final nameMatch = c.name.toLowerCase().contains(query);
          final codeMatch = c.phoneCode.contains(query) || '+${c.phoneCode}'.contains(query);
          final isoMatch = c.countryCode.toLowerCase().contains(query);
          return nameMatch || codeMatch || isoMatch;
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchCtrl.removeListener(_onSearchChanged);
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Select Country',
          style: TextStyle(
            color: Color(0xFF0F1E36),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar matching Screen 4
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: TextField(
                controller: _searchCtrl,
                style: const TextStyle(fontSize: 15, color: Color(0xFF0F1E36)),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, size: 20, color: Color(0xFF64748B)),
                  suffixIcon: _searchCtrl.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 18, color: Color(0xFF94A3B8)),
                          onPressed: () => _searchCtrl.clear(),
                        )
                      : null,
                  hintText: 'Search country or code',
                  hintStyle: const TextStyle(fontSize: 14.5, color: Color(0xFF94A3B8)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),

          // List of Countries
          Expanded(
            child: _filteredCountries.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Text(
                        'No matching countries found',
                        style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: _filteredCountries.length,
                    separatorBuilder: (_, __) => const Divider(
                      height: 1,
                      indent: 64,
                      endIndent: 16,
                      color: Color(0xFFF8FAFC),
                    ),
                    itemBuilder: (context, index) {
                      final country = _filteredCountries[index];
                      final isSelected = country.countryCode.toUpperCase() ==
                          widget.selectedCountryCode.toUpperCase();

                      return Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.pop(context, country),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            child: Row(
                              children: [
                                Text(
                                  country.flagEmoji,
                                  style: const TextStyle(fontSize: 22),
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Text(
                                    country.name,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF0F1E36),
                                    ),
                                  ),
                                ),
                                Text(
                                  '+${country.phoneCode}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF64748B),
                                  ),
                                ),
                                const SizedBox(width: 14),
                                Container(
                                  width: 22,
                                  height: 22,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSelected ? AppColorScheme.forestGreen : Colors.transparent,
                                    border: Border.all(
                                      color: isSelected ? AppColorScheme.forestGreen : const Color(0xFFCBD5E1),
                                      width: 2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: isSelected
                                      ? Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                        )
                                      : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
