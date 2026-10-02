# Software Requirements Specification (SRS)

**Version:** 1.0.0
**Status:** Draft
**Project:** FARMSTATS (Product: FarmOS)
**Document Owner:** Product Team
**Reviewed By:**
**Approved By:**
**Last Updated:** 2026-07-28
**Next Review Date:**
**Confidentiality:** Internal Use Only

## Related Documents

- [BRD.md](../business/BRD.md)
- PRD.md
- Architecture.md
- Database.md

## Revision History

| Version | Date       | Author                 | Changes                        |
| ------- | ---------- | ---------------------- | ------------------------------ |
| 1.0.0   | 2026-07-28 | Lead Product Architect | Initial Draft derived from BRD |

---

## 1. Introduction

### 1.1 Purpose

This Software Requirements Specification (SRS) provides a comprehensive, detailed description of the technical and functional requirements for the FarmOS mobile application (Project FARMSTATS). It is intended for the engineering, QA, and product teams to guide architecture, development, and testing phases.

### 1.2 Scope

FarmOS is a 100% offline-first mobile application designed to manage the end-to-end operations of sericulture farms. It covers batch tracking (silkworm rearing lifecycles), financial ledger management, inventory control, and labour tracking. Out of scope for this version are cloud synchronization, P2P data sharing, web dashboards, and IoT hardware integrations.

### 1.3 Definitions, Acronyms, and Abbreviations

- **ERP:** Enterprise Resource Planning
- **Batch:** A specific lifecycle of silkworms from egg/chawki to cocoon harvest.
- **Local-First:** An architectural paradigm where the local device database is the absolute primary source of truth, eliminating backend reliance.
- **ANR:** Application Not Responding.
- **DFL:** Disease Free Laying (Standard unit of measurement for silkworm eggs).

---

## 2. Overall Description

### 2.1 Product Perspective

FarmOS is an independent, standalone mobile application. It does not rely on a central backend server or cloud infrastructure for any core operations, ensuring complete, uninterrupted functionality in zero-connectivity rural environments.

### 2.2 Product Functions

- **Batch Management:** Strict lifecycle tracking of sericulture operations.
- **Financial Ledger:** Income and expense tracking, categorized and linkable to distinct rearing batches.
- **Inventory Control:** Inward (procurement) and outward (usage) tracking of farm consumables and assets.
- **Labour Tracking:** Daily wage, attendance logging, and payout reconciliation.
- **Reporting Engine:** On-device generation of profitability, expense breakdowns, and yield metrics.
- **Data Export & Security:** Manual encrypted local database backup and PDF/CSV report generation.

### 2.3 User Characteristics

- **Primary Users:** Sericulture farmers who may possess limited digital literacy and operate in harsh field conditions (requiring large touch targets and high-contrast UI).
- **Secondary Users:** Farm managers who require rapid, repetitive data entry capabilities with minimal friction.

### 2.4 Operating Environment

- **Platform:** Android OS (API Level 26 / Android 8.0 and above).
- **Hardware Profile:** Optimized for low-end to mid-range smartphones (minimum 2GB RAM, standard ARM processors).
- **Network Dependency:** Absolute zero connectivity assumed post-installation.

### 2.5 Design and Implementation Constraints

- **Database Architecture:** Must utilize a highly performant, ACID-compliant local database capable of handling complex relational or document-based queries instantly on-device.
- **Storage Profile:** Application footprint and database size must remain deeply optimized to prevent storage bloat on low-capacity hardware.
- **UI Responsiveness:** Must maintain strict adherence to Material Design 3 guidelines without compromising rendering speed.

---

## 3. System Features (Functional Requirements)

### 3.1 Batch Management Module

#### 3.1.1 Description

The core operational module allowing farmers to initiate, track, and conclude a silkworm rearing cycle.

#### 3.1.2 Functional Requirements

- **FR_BM_01:** The system shall allow the creation of a new batch requiring: Start Date, Initial Quantity (DFLs), Breed Type, and Source.
- **FR_BM_02:** The system shall support unidirectional state transitions for a batch representing biological stages (e.g., Chawki -> Late Age Rearing -> Spinning -> Harvested).
- **FR_BM_03:** The system shall enforce that only one state transition can occur at a time, locked in chronological sequence.
- **FR_BM_04:** The system shall allow logging of daily operational observations (e.g., Temperature, Humidity, Mortality rate) explicitly against an Active batch.

### 3.2 Financial Ledger Module

#### 3.2.1 Description

Tracks all monetary inflows and outflows, associating them with farm operations where applicable.

#### 3.2.2 Functional Requirements

- **FR_FIN_01:** The system shall allow users to log an Expense requiring: Amount, Category, Date, and optional descriptive Note.
- **FR_FIN_02:** The system shall allow an Expense to be explicitly linked to a specific Active or Historical Batch.
- **FR_FIN_03:** The system shall allow users to log Income (e.g., Cocoon Sales) specifying: Amount, Total Weight Sold, Rate per Kg, Date, and the linked completed Batch.
- **FR_FIN_04:** The system shall support predefined, customizable expense categories (e.g., Feed, Disinfectant, Labour, Transport).

### 3.3 Inventory Control Module

#### 3.3.1 Description

Manages raw materials, consumables, and fixed assets used on the farm.

#### 3.3.2 Functional Requirements

- **FR_INV_01:** The system shall maintain a catalog of standard inventory items defined by the user.
- **FR_INV_02:** The system shall allow logging an "Inward" transaction (purchasing/adding stock), which must optionally auto-generate a corresponding Expense entry in the ledger.
- **FR_INV_03:** The system shall allow logging an "Outward" transaction (usage of stock) and strictly link it to an Active Batch to track resource consumption per cycle.

### 3.4 Labour Tracking Module

#### 3.4.1 Description

Manages daily worker attendance and calculates wage payouts.

#### 3.4.2 Functional Requirements

- **FR_LAB_01:** The system shall allow the creation of Worker profiles containing Name, Contact, and Default Daily Wage.
- **FR_LAB_02:** The system shall support a "Bulk Attendance" view, allowing rapid toggling of presence for multiple workers on a specific date.
- **FR_LAB_03:** The system shall automatically calculate and display pending wage balances based on logged attendance days minus recorded payment entries.

### 3.5 Reporting & Export Module

#### 3.5.1 Description

Provides actionable on-device insights and handles data portability.

#### 3.5.2 Functional Requirements

- **FR_REP_01:** The system shall dynamically generate a "Batch Profitability Report" summarizing total linked income vs. total linked expenses, revealing net profit/loss for a selected batch.
- **FR_REP_02:** The system shall allow exporting any generated report view directly to a local PDF or CSV file in the device's standard Downloads directory.
- **FR_REP_03:** The system shall provide a utility to export the entire local database to a secure, encrypted file format (e.g., AES-256 encrypted dump) for local backup.
- **FR_REP_04:** The system shall provide a utility to safely restore the database from a previously exported valid backup file.

---

## 4. External Interface Requirements

### 4.1 User Interfaces

- **Design System:** The UI shall rigorously adhere to Material Design 3 specifications.
- **Accessibility:** Minimum interactive touch target size shall be 48x48 dp. High contrast ratios must be maintained for outdoor visibility.
- **Theming:** The application shall support automatic and manual switching between Light and Dark themes.
- **Localization:** The architecture must utilize dynamic string resource lookups (i18n), allowing users to switch languages instantly without application restart.

### 4.2 Hardware Interfaces

- **File System:** The application requires read/write access to standard device storage directories solely for the purpose of backup generation and restoration.
- **Camera (Optional Phase 2):** Future integration for receipt scanning or basic image capture.

### 4.3 Software Interfaces

- The application is entirely self-contained. It shall not make any external HTTP/API requests for core functionality.

---

## 5. Non-Functional Requirements

### 5.1 Performance Requirements

- **NFR_PERF_01:** Application cold-start launch time must not exceed 2.0 seconds on target low-end hardware.
- **NFR_PERF_02:** All synchronous local database read queries required to render a UI view must execute in < 50ms.
- **NFR_PERF_03:** The application must maintain locked 60fps scrolling performance on complex list views (e.g., Ledger containing 1,000+ entries).

### 5.2 Security Requirements

- **NFR_SEC_01:** The local database shall implement transparent encryption at rest (e.g., SQLCipher/Isar Encryption) to secure financial data against unauthorized device access.
- **NFR_SEC_02:** Manual database backup files must enforce password-based encryption prior to export.

### 5.3 Reliability and Availability

- **NFR_REL_01:** The application must prove identical functionality in Airplane mode as in connected states.
- **NFR_REL_02:** All database write operations must be wrapped in ACID-compliant transactions to prevent data corruption during unexpected application termination or device power loss.

### 5.4 Maintainability

- **NFR_MAINT_01:** The codebase shall strictly enforce an architectural pattern (e.g., Clean Architecture, MVVM) that deeply decouples the presentation layer from the persistence layer.
- **NFR_MAINT_02:** The data models shall be designed with robust schema versioning and forward-compatible migration strategies from Version 1.

---

## 6. Data Requirements

### 6.1 Data Model Guidelines

- **Primary Keys:** All primary entities (Batches, Expenses, Incomes, Inventory, Workers) MUST utilize uniquely generated UUIDs (v4) rather than auto-incrementing integers, paving the way for conflict-free future P2P synchronization.
- **Timekeeping:** All timestamps must be strictly persisted in UTC (Epoch milliseconds) and formatted to the device's local timezone only at the presentation layer.

### 6.2 Data Retention

- Data is retained perpetually on the device until explicitly purged by the user or upon application uninstallation. There shall be no automated archiving or deletion of historical operational data to ensure long-term farm analytics remain intact.
