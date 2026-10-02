# Implementation Roadmap

## Document Control

**Version:** 1.0.0
**Status:** Approved
**Phase:** Pre-Implementation

---

## Sprint 0: Project Bootstrap

- **Objectives:** Establish the core infrastructure, dependencies, linting rules, theme engine, navigation router, and database schema.
- **Deliverables:** `pubspec.yaml` fully configured, GoRouter setup, Material 3 Theme injected, Drift Database initialized with schema, CI pipeline scaffolded.
- **Dependencies:** None.
- **Acceptance Criteria:** App compiles on Android/iOS. SQLite database creates tables without errors. Router navigates to placeholder screens.
- **Definition of Done (DoD):** Code merged to `develop`, 0 lint warnings, CI passes.
- **Risks:** Drift schema generation conflicts.

## Sprint 1: Dashboard

- **Objectives:** Build the central command center and KPI aggregations.
- **Deliverables:** Dashboard UI, Dashboard Notifier, Aggregation queries in DAO.
- **Dependencies:** Sprint 0 (Database).
- **Acceptance Criteria:** UI displays correctly. KPIs reflect mock data injected into SQLite.
- **DoD:** Widget tests passed, UI matches Figma exactly.
- **Risks:** Complex SQL aggregations causing UI stutter.

## Sprint 2: Expense Module

- **Objectives:** Implement cash outflow logging and categorization.
- **Deliverables:** Expense Ledger UI, Add Expense Form, Category Manager, Expense Repository.
- **Dependencies:** Sprint 0, Dashboard (for KPI updates).
- **Acceptance Criteria:** User can add, edit, and delete an expense. Expenses reflect immediately in the ledger.
- **DoD:** 100% Unit test coverage on Expense Use Cases.
- **Risks:** Date and timezone parsing issues.

## Sprint 3: Income Module

- **Objectives:** Implement cash inflow logging and cocoon sales.
- **Deliverables:** Income Ledger UI, Add Income Form, Income Repository.
- **Dependencies:** Sprint 2 (reusing ledger components).
- **Acceptance Criteria:** User can log income. Dashboard KPIs update correctly.
- **DoD:** Income Use Cases fully tested.
- **Risks:** Minimal (pattern mirrors Expense).

## Sprint 4: Inventory Module

- **Objectives:** Track raw materials and consumables.
- **Deliverables:** Inventory List, Add Inventory, Stock adjustment forms.
- **Dependencies:** Sprint 2 (Optionally linking inventory to expenses).
- **Acceptance Criteria:** Adding inward stock increases quantity; usage decreases it. Negative stock blocked.
- **DoD:** Constraints validated at the Drift database level.
- **Risks:** Transaction blocks failing midway.

## Sprint 5: Batch Module

- **Objectives:** Manage the sericulture biological lifecycle.
- **Deliverables:** Batch List, Create Batch Form, Batch Details, State transition logic.
- **Dependencies:** Sprint 4 (Inventory usage per batch).
- **Acceptance Criteria:** Batch state machine prevents invalid transitions.
- **DoD:** Integration test verifying full batch lifecycle creation.
- **Risks:** Complex UUID linking across multiple tables.

## Sprint 6: Labour Module

- **Objectives:** Manage workforce attendance and payouts.
- **Deliverables:** Worker List, Attendance toggler, Salary calculation.
- **Dependencies:** Sprint 5 (Linking labour to specific batches).
- **Acceptance Criteria:** Bulk attendance logging works instantly. Pending balances calculate correctly.
- **DoD:** Repository mapped correctly.
- **Risks:** High UI rebuilds during bulk toggling.

## Sprint 7: Reports

- **Objectives:** Generate P&L and yield insights.
- **Deliverables:** Report views, PDF generation logic.
- **Dependencies:** Sprints 1-6.
- **Acceptance Criteria:** P&L correctly aggregates income minus expenses for a given batch. PDF exports to Downloads folder.
- **DoD:** Golden tests for report tables.
- **Risks:** Native file system permissions on Android 13+.

## Sprint 8: Analytics

- **Objectives:** Visualizing trends via charts.
- **Deliverables:** Line charts for yield, Pie charts for expense breakdown.
- **Dependencies:** Sprint 7.
- **Acceptance Criteria:** Charts render without jitter. Data is accurate.
- **DoD:** Caching implemented to prevent heavy re-renders.
- **Risks:** High memory consumption from charting library.

## Sprint 9: Backup & Restore

- **Objectives:** Local data portability and security.
- **Deliverables:** Encrypted DB export, DB import, File picker integration.
- **Dependencies:** Database layer finalized.
- **Acceptance Criteria:** User can export `.db` file securely and restore it, replacing all app data safely.
- **DoD:** E2E test verifying data persistence post-restore.
- **Risks:** Bricking the database during a failed restore.

## Sprint 10: Settings

- **Objectives:** App configuration and localization.
- **Deliverables:** Farm Profile, Theme toggle, Language selection.
- **Dependencies:** Sprint 0.
- **Acceptance Criteria:** Changing theme/language reflects globally without app restart.
- **DoD:** Shared preferences secured.
- **Risks:** Minimal.

## Sprint 11: Testing

- **Objectives:** Hardening the application.
- **Deliverables:** Full Integration Test suite, Penetration testing (local), Performance profiling.
- **Dependencies:** All previous sprints.
- **Acceptance Criteria:** Minimum 80% coverage on Domain/Data. Zero ANRs on target low-end device.
- **DoD:** QA sign-off.
- **Risks:** Flaky UI tests.

## Sprint 12: Production Release

- **Objectives:** Final deployment preparation.
- **Deliverables:** App signing, ProGuard configuration, APK/AAB generation, Play Store listing.
- **Dependencies:** Sprint 11.
- **Acceptance Criteria:** AAB passes Google Play console checks.
- **DoD:** App is live.
- **Risks:** Store rejection due to permission policies.
