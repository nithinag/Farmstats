# Project Structure

This document outlines the absolute structure of the FARMSTATS production repository.

```text
FARMSTATS/
├── android/                 # Native Android embedding and Gradle configurations
├── ios/                     # Native iOS embedding and CocoaPods
├── linux/                   # Native Linux embedding
├── macos/                   # Native MacOS embedding
├── windows/                 # Native Windows embedding
├── web/                     # Web application compilation target
├── assets/                  # Static assets
│   ├── images/              # Raster images (PNG, JPEG)
│   ├── icons/               # Vector icons (SVG)
│   ├── fonts/               # Custom fonts (Inter)
│   └── i18n/                # Localization JSON files
├── docs/                    # Official Single Source of Truth Documentation
│   ├── business/            # BRD
│   ├── technical/           # SRS, Architecture, Database
│   ├── design/              # Design System, Component Library
│   ├── screens/             # Screen Specifications
│   └── development/         # Guidelines, Workflow, Roadmap
├── test/                    # Unit and Widget tests
├── integration_test/        # End-to-End device tests
├── tool/                    # Custom Dart scripts for CI/CD or codegen
├── scripts/                 # Bash/PowerShell helper scripts
└── lib/                     # Primary Flutter application code
    ├── app/                 # Root entry points
    │   ├── main.dart        # runApp()
    │   ├── app.dart         # MaterialApp setup
    │   └── router.dart      # GoRouter configuration
    ├── config/              # Environments and Constants
    │   ├── env.dart
    │   └── constants.dart
    ├── core/                # App-wide foundational architecture
    │   ├── errors/          # Exception definitions
    │   ├── theme/           # ThemeData, colors, typography
    │   └── utils/           # Formatters, validators
    ├── shared/              # Reusable Cross-Feature UI
    │   ├── widgets/         # Dumb components (Buttons, Cards)
    │   └── extensions/      # Dart extensions
    ├── data/                # Global infrastructure
    │   ├── secure_storage/  # Key-Value encrypted storage
    │   └── database/        # Drift setup
    │       ├── schema.dart
    │       └── migrations/
    └── features/            # Feature modules (Domain-Driven Design)
        ├── dashboard/
        ├── expenses/
        ├── income/
        ├── inventory/
        ├── batch/
        ├── labour/
        ├── reports/
        ├── analytics/
        ├── backup/
        └── settings/
```

## Feature Module Anatomy

Every directory within `lib/features/` MUST strictly follow Clean Architecture:

- **presentation/**: UI components only. Screens, local widgets, and Riverpod UI controllers. No business logic.
- **application/**: Riverpod Notifiers and Use Cases. Orchestrates the flow of data between UI and Domain.
- **domain/**: Pure Dart. Entities (Models) and abstract Repository Interfaces. Zero dependencies on Flutter or third-party packages.
- **data/**: DTOs and actual Repository Implementations. Handles calling Drift DAOs and mapping to Domain Entities.
