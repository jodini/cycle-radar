# Cycle Radar — Agent Instructions

This repository is the canonical source of truth for the Cycle Radar project.

## Before making changes

1. Read `README.md`.
2. Read `methodology.md`.
3. Read `llm-protocol.md`.
4. Inspect `cycles.json` and the existing implementation before editing.
5. Preserve the existing architecture unless the requested change requires otherwise.

## Editing rules

- Make incremental edits. Do not rebuild the application from scratch unless explicitly requested.
- Preserve existing functionality, styling, and data that are unrelated to the requested change.
- `cycles.json` is the canonical source for cycle data and forecasts.
- `index.html` should render data from `cycles.json`; avoid duplicating cycle data in presentation code unless technically necessary.
- Keep cycle stage, action qualifier, and shock qualifier as separate dimensions.
- Cycle stages are: `D`, `T`, `R`, `E`, `L`, `P`.
- Action qualifiers are: `W`, `B`, `OB`, `H`, `T`, `OS`, `S`.
- A shock is an overlay, not a cycle stage.
- Do not smooth forecasts merely to make the timeline visually pleasing.
- Distinguish evidence-based current-stage changes from speculative future-stage changes.
- Future-quarter confidence should decline with forecast horizon where appropriate.
- Do not convert structural deterioration into a cyclical trough without evidence for a reversal mechanism.

## Research / recalibration rules

When re-evaluating cycles:

- Follow `llm-protocol.md`.
- Prefer primary sources, company filings, industry data, and high-quality current reporting.
- Separate leading, coincident, and lagging indicators.
- Explicitly record contradictory evidence and invalidation conditions.
- Remember that equity prices usually lead the underlying business cycle.
- Treat `OB` and `OS` as narrow optimal windows, not broad phase labels.

## Validation

After changing `cycles.json`:

- Validate that it is syntactically valid JSON.
- Confirm that every timeline array has the expected number of quarters.
- Confirm that all stage/action codes are valid.
- Check that the application still loads locally.

After changing `index.html`:

- Check for JavaScript errors.
- Test the main Radar view and filters.
- Test Cycle detail views.
- Test Framework and LLM Protocol views.
- Preserve the two-row timeline header format: year spanning its visible quarters, then quarter labels beneath it.

## Changelog

Update `changelog.md` for any material change to:

- cycle stage or timing
- OB / OS windows
- methodology
- data schema
- UI behavior or major presentation

Minor typo/formatting fixes do not require a changelog entry.

## Git / publishing

- Do not commit or push unless explicitly requested.
- Do not rewrite Git history.
- Do not force-push.
- Before publication, review `git diff` and confirm that only intended files changed.
- GitHub Pages deployment is driven by pushes to the configured publishing branch.
