import 'package:flutter/material.dart';
import '../../../../shared/widgets/layout_components.dart';
import '../../../../core/theme/spacing.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseScaffold(
      appBar: const FarmAppBar(title: 'About FARMSTATS'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.eco, size: 80, color: Colors.green),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'FARMSTATS',
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Version 1.0.0',
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Offline-first Smart Sericulture ERP platform built to empower farmers with reliable, localized data management.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.xl),
              const Divider(),
              const SizedBox(height: AppSpacing.md),
              _buildInfoRow(context, Icons.code, 'Built with', 'Flutter & Drift'),
              const SizedBox(height: AppSpacing.sm),
              _buildInfoRow(context, Icons.storage, 'Database', 'SQLite (Offline-first)'),
              const SizedBox(height: AppSpacing.sm),
              _buildInfoRow(context, Icons.architecture, 'Architecture', 'Clean Architecture / MVVM'),
              const SizedBox(height: AppSpacing.xl),
              FilledButton.icon(
                onPressed: () {
                  showLicensePage(
                    context: context,
                    applicationName: 'FARMSTATS',
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2026 FARMSTATS. All rights reserved.',
                  );
                },
                icon: const Icon(Icons.description_outlined),
                label: const Text('View Open Source Licenses'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: AppSpacing.sm),
        Text('$label: ', style: const TextStyle(color: Colors.grey)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
