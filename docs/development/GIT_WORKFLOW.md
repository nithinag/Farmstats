# Git Workflow & Standards

## Branch Strategy

FarmOS utilizes a simplified GitFlow model:

- `main`: Absolute production state. Stable, tagged releases only.
- `develop`: The active integration branch. All features merge here.
- `feature/*`: For new additions (e.g., `feature/expense-module`).
- `bugfix/*`: For non-critical fixes (e.g., `bugfix/date-parsing-error`).
- `hotfix/*`: For urgent production patches originating from `main`.

## Commit Message Convention

Strictly adhere to Conventional Commits:

- `feat:` A new feature.
- `fix:` A bug fix.
- `docs:` Documentation only changes.
- `style:` Formatting, missing semi colons, etc (no code change).
- `refactor:` Code change that neither fixes a bug nor adds a feature.
- `test:` Adding missing tests.
- `chore:` Updating build tasks, dependencies.

_Example:_ `feat(ledger): implement income validation rules`

## Pull Request Rules

- PRs must target `develop` (unless hotfix).
- Must contain a clear title and description of changes.
- Must link to the relevant feature ticket/issue.
- CI pipeline (Lint, Format, Test) MUST pass.
- Must include screenshots for any UI modifications.

## Review Checklist

- [ ] No architectural violations (UI isolated from Data).
- [ ] Code is formatted (`flutter format`).
- [ ] No `dynamic` types or forced unwrapping (`!`) without validation.
- [ ] New functionality is covered by tests.
- [ ] Const constructors used where applicable.
- [ ] Documentation updated if schema/logic changed.

## Release Tagging & Versioning

- Semantic Versioning (SemVer) is strictly enforced: `MAJOR.MINOR.PATCH`.
- Releases are tagged on the `main` branch (e.g., `v1.2.0`).
- `MAJOR`: Breaking architectural or schema changes requiring complex migrations.
- `MINOR`: New features added in a backward-compatible manner.
- `PATCH`: Backward-compatible bug fixes.
