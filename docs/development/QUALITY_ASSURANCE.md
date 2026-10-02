# Quality Assurance (QA) Standards

## Testing Strategy

FarmOS mandates a strict "Test-Driven Architecture" approach. The highly decoupled nature of the app demands automated verification at every layer.

### Unit Tests

- **Target:** Domain (Entities, Use Cases), Application (Riverpod Notifiers), and Core (Utils).
- **Rule:** >80% coverage required. Logic must be tested independently of Flutter (no `dart:ui` imports in domain tests).

### Widget Tests

- **Target:** Shared Components and complex layout states.
- **Rule:** Verify that widgets render correctly based on given mocked states and respond appropriately to simulated gestures (taps, drags).

### Integration Tests

- **Target:** Complete user journeys (e.g., E2E Batch Lifecycle).
- **Rule:** Must run on a physical device or emulator. Must hit the real (or in-memory test) database, simulating real-world UI traversal.

### Golden Tests

- **Target:** Charts, complex Dashboards.
- **Rule:** Pixel-perfect visual regression testing to ensure Material 3 theme updates or dependency bumps do not break the UI layout.

### Performance Tests

- **Target:** Ledger lists and Database read/writes.
- **Rule:** Ensure scrolling remains at 60fps and DB queries execute in <50ms. (Measured via Flutter DevTools timeline profiles).

### Accessibility Tests

- **Rule:** Ensure minimum contrast ratios, 48dp touch targets, and proper semantic labels using `flutter_test` accessibility matchers.

---

## Definition of Done (DoD)

A ticket/feature is strictly "Done" only when:

1. Business requirements (BRD/SRS) are fully met.
2. Code complies with `AI_ENGINEERING_RULES.md`.
3. Unit and Widget tests pass in CI.
4. UI matches `DESIGN_SYSTEM.md` perfectly.
5. Code is peer-reviewed and merged into `develop`.

---

## Release Checklist

Before tagging a release to `main`:

- [ ] Database migrations are tested end-to-end.
- [ ] ProGuard/R8 obfuscation rules validated on Android release build.
- [ ] App signs correctly with production Keystore.
- [ ] Integration tests pass on minimum target API level.

## Regression Checklist

Core flows that MUST be manually tested before any major version bump:

- [ ] Complete database backup and restore cycle.
- [ ] Logging an expense and seeing it reflect on the Dashboard.
- [ ] Moving a Batch from creation to Harvest.
- [ ] Toggling dark/light mode and rotating device.
