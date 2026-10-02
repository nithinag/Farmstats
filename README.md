# FARMSTATS — Offline-First Smart Sericulture Farm Management System

[![Flutter](https://img.shields.io/badge/Flutter-3.3+-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3+-blue.svg)](https://dart.dev)
![License](https://img.shields.io/badge/License-Proprietary-red.svg)

## Overview

FARMSTATS is a comprehensive, offline-first ERP application purpose-built for sericulture (silkworm) farmers. It manages the complete farming lifecycle — from batch creation and daily feeding logs through harvest, cocoon grading, financial tracking, and business intelligence reporting.

All data is stored locally on-device using SQLite (via Drift), ensuring farmers in remote areas can operate without internet connectivity.

## Key Features

| Module               | Description                                                       |
| :------------------- | :---------------------------------------------------------------- |
| **Dashboard**        | Real-time operational command center with KPI cards and charts    |
| **Batches**          | Core domain — track silkworm batches through their full lifecycle |
| **Expenses**         | Record and categorize all farm expenditures                       |
| **Income**           | Track revenue from cocoon sales and other sources                 |
| **Inventory**        | Manage stock levels, purchases, and consumption                   |
| **Labour**           | Worker management, attendance tracking, and wage processing       |
| **Feeding & Health** | Daily feeding logs, health observations, and mortality tracking   |
| **Harvest**          | Cocoon harvesting, grading, and yield analysis                    |
| **Reports**          | Financial, production, and operational analytics with charts      |
| **Notifications**    | Proactive alerts for low stock, missed feedings, pending wages    |
| **Backup & Restore** | Full database backup with checksum verification                   |
| **Settings**         | Farm profile, theme preferences, and unit configuration           |

## Architecture

FARMSTATS follows **Feature-First Clean Architecture** with MVVM presentation:

```bash
lib/
├── app/              # App entry, router, theme
├── core/             # Shared utilities, constants, errors
├── data/             # Database schema, providers
├── features/         # Feature modules (one per business domain)
│   └── <feature>/
│       ├── presentation/   # Screens, widgets, Riverpod notifiers
│       ├── application/    # Use cases, services
│       ├── domain/         # Entities, repository interfaces
│       └── data/           # DAOs, models, mappers, implementations
└── shared/           # Shared UI components
```

## Tech Stack

- **Framework**: Flutter 3.3+
- **State Management**: Riverpod (Notifier/AsyncNotifier)
- **Database**: Drift (SQLite) with type-safe queries
- **Routing**: GoRouter with StatefulShellRoute
- **Serialization**: Freezed + JSON Serializable
- **Charts**: FL Chart

## Getting Started

### Prerequisites

- Flutter SDK ≥ 3.3.0
- Dart SDK ≥ 3.3.0
- Android Studio or VS Code

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd FARMSTATS

# Install dependencies
flutter pub get

# Generate code (Drift schemas, Freezed models)
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

### Building for Release

```bash
# Android APK
flutter build apk --release

# Android App Bundle (Play Store)
flutter build appbundle --release
```

## Project Documentation

| Document               | Location                            |
| :--------------------- | :---------------------------------- |
| Architecture Guide     | `docs/technical/ARCHITECTURE.md`    |
| Database Schema        | `docs/technical/DATABASE.md`        |
| User Manual            | `docs/user/USER_MANUAL.md`          |
| Backup & Restore Guide | `docs/user/BACKUP_RESTORE_GUIDE.md` |
| Design System          | `docs/design/DESIGN_SYSTEM.md`      |
| Changelog              | `CHANGELOG.md`                      |

## License

Proprietary. All rights reserved.
