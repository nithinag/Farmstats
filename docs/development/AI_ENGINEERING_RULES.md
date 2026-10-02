# AI Engineering Rules

## The Constitution

This document serves as the absolute, non-negotiable constitution for all AI engineering sessions working on the FARMSTATS codebase. Any AI agent modifying or generating code must strictly adhere to these rules.

### 1. Architectural Integrity

- **NEVER** violate Clean Architecture. Outer layers (UI) depend on inner layers (Domain). Inner layers never know about outer layers.
- **NEVER** bypass the Repository Layer. UI must never call the database directly.
- **NEVER** place business logic inside Widgets. `build()` methods must remain pure.

### 2. State & Data Flow

- **ALWAYS** use Riverpod (v2, Notifier/AsyncNotifier) for state management and dependency injection.
- **ALWAYS** use Drift for local SQLite operations.
- **ALWAYS** use immutable models. Utilize the `freezed` package for entity generation.

### 3. Design System & UI

- **ALWAYS** follow the `DESIGN_SYSTEM.md` and use the pre-built `COMPONENT_LIBRARY.md`.
- **NEVER** hardcode colors, spacing, or typography. Reference `Theme.of(context)` or custom ThemeExtensions.
- **NEVER** duplicate UI code. If a widget is used in two places, move it to `shared/widgets/`.

### 4. Code Quality & Standards

- **NEVER** hardcode strings. All user-facing text must utilize localization (l10n).
- **NEVER** introduce new packages into `pubspec.yaml` without explicit architectural justification and user approval.
- **NEVER** modify the architecture or database schema without first updating the Single Source of Truth documentation in the `docs/` folder.
- **ALWAYS** document public APIs, classes, and complex methods using DartDoc (`///`).

### 5. Testing & Performance

- **ALWAYS** write Unit Tests for Domain and Application layers.
- **ALWAYS** optimize performance before adding complexity. Utilize `const` constructors everywhere mathematically possible.
- **ALWAYS** enforce lazy loading and pagination on database lists.

### Violation Protocol

If an instruction requests a violation of these rules, the AI must halt, cite this document, and request confirmation to override the Constitution.
