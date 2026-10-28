import 'package:flutter/material.dart';
import '../../../../core/theme/color_scheme.dart';

class SecurityAppScreen extends StatelessWidget {
  const SecurityAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Security & App',
          style: TextStyle(
            color: Color(0xFF0F1E36),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          // Section 1: Security & Privacy
          _buildSectionHeader('DATA SECURITY & PRIVACY'),
          const SizedBox(height: 10),
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
                _buildInfoTile(
                  icon: Icons.lock_outline_rounded,
                  title: 'Offline-First Local Storage',
                  subtitle: 'All batch, financial, and labour records are stored securely in a local SQLite database on your device.',
                ),
                const Divider(height: 1, indent: 64, endIndent: 16, color: Color(0xFFF1F5F9)),
                _buildInfoTile(
                  icon: Icons.shield_outlined,
                  title: 'Device App Lock Protection',
                  subtitle: 'FARMSTATS operates within your device\'s hardware sandbox and is protected by your system PIN, pattern, or biometrics.',
                ),
                const Divider(height: 1, indent: 64, endIndent: 16, color: Color(0xFFF1F5F9)),
                _buildInfoTile(
                  icon: Icons.cloud_off_outlined,
                  title: 'Private Farm Records',
                  subtitle: 'Your production data never leaves your device unless you explicitly export or back up records.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Section 2: About FARMSTATS
          _buildSectionHeader('ABOUT APPLICATION'),
          const SizedBox(height: 10),
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
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Color(0xFFE8F5EC),
                        child: Icon(Icons.eco_rounded, color: Color(0xFF165B33), size: 24),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FARMSTATS',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0F1E36),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Version 1.0.0 (Production Release)',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF64748B),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: Color(0xFFF1F5F9)),
                ListTile(
                  leading: const Icon(Icons.description_outlined, color: AppColorScheme.primary),
                  title: const Text('Open Source Licenses', style: TextStyle(fontSize: 14.5, fontWeight: FontWeight.w600)),
                  trailing: const Icon(Icons.chevron_right, size: 20, color: Color(0xFF94A3B8)),
                  onTap: () {
                    showLicensePage(
                      context: context,
                      applicationName: 'FARMSTATS',
                      applicationVersion: '1.0.0',
                      applicationLegalese: '© 2026 FARMSTATS. All rights reserved.',
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Section 3: Farmer Support & Helpline
          _buildSectionHeader('FARMER SUPPORT & HELPLINE'),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.headset_mic_outlined, color: AppColorScheme.primary, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Dedicated Sericulture Support',
                      style: TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F1E36),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildSupportRow('Support Email', 'support@farmstats.in'),
                const SizedBox(height: 8),
                _buildSupportRow('Sericulture Extension Helpline', '1800-425-4554 (Toll-Free)'),
                const SizedBox(height: 8),
                _buildSupportRow('Advisory Hours', 'Mon - Sat (9:00 AM - 6:00 PM IST)'),
              ],
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
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF64748B),
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xFFE8F5EC),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Icon(icon, size: 20, color: const Color(0xFF165B33)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F1E36),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF64748B),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F1E36),
            ),
          ),
        ),
      ],
    );
  }
}
