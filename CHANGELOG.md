# Changelog

All notable changes to FARMSTATS are documented in this file.

## [1.0.0] — 2026-07-29

### 🎉 Initial Release

#### Sprint 1–3: Foundation

- Project scaffolding with Clean Architecture (Feature-First MVVM)
- Drift/SQLite database with typed schema and migrations
- Riverpod state management with AsyncNotifier pattern
- Material 3 design system with Light and Dark themes
- Dashboard, Expenses, and Income modules

#### Sprint 4: Batch Management

- Core silkworm batch lifecycle tracking
- Batch stages, statuses, and timeline visualization
- Batch filtering and search

#### Sprint 5: Inventory Management

- Stock tracking with categories and minimum thresholds
- Purchase and consumption recording
- Low-stock detection

#### Sprint 6: Labour Management

- Worker profiles and daily attendance
- Work assignments linked to batches
- Wage calculation and payment tracking

#### Sprint 7: Feeding & Health Management

- Daily feeding logs with leaf type and quantity
- Health observations and treatment records
- Mortality tracking and environmental readings

#### Sprint 8: Harvest & Cocoon Production

- Cocoon harvesting with weight and grading
- Yield analysis and production summaries
- Batch completion workflow

#### Sprint 9: Reports & Business Intelligence

- Financial reports (income, expenses, profit)
- Production reports (yield, mortality, batch comparison)
- CSV export functionality
- Interactive FL Chart visualizations

#### Sprint 10: Smart Dashboard

- Real-time KPI cards aggregating all modules
- Financial trend charts
- Active batch monitoring
- Alert badges for critical conditions

#### Sprint 11: Notifications & Reminders

- Proactive alert engine for low stock, missed feedings, pending wages
- Notification center with read/unread management
- Rule-based evaluation system

#### Sprint 12: Backup & Restore

- Full SQLite database backup
- Checksum-verified restore
- Backup history tracking

#### Sprint 13: Settings & Configuration

- Farm profile management
- Theme preferences (Light/Dark/System)
- Unit configuration (Temperature, Weight, Area)
- About screen with license viewer

#### Sprint 14: Production Hardening

- Global error handling with graceful fallback UI
- Database stress testing (70,000+ records)
- Performance optimization and memory profiling
- Zero analyzer warnings

#### Sprint 15: Quality Assurance

- End-to-end workflow validation
- Regression testing across all 13 modules
- Accessibility verification (touch targets, contrast, screen readers)

#### Sprint 16: Release Candidate

- First-launch onboarding experience
- Developer tools removed from production build
- Complete documentation suite
- Release APK and AAB packaging
