---
title: Testing
description: Testing for Paper, the free and open-source macOS paper-texture app.
lang: en
source_commit: 6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95
generated: true
parent: Operations
nav_order: 1
---

# Paper validation

This file separates automated evidence, local app acceptance and broader release qualification.

For the current release, see [Paper 1.0.3 validation](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/validation/1.0.3.md). The versioned results below are historical.

The Dock/Command-Tab fix has separate [regression evidence](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/validation/dock-command-tab.md),
including real desktop interaction tests and the corrected overview policy.

Automated coverage includes the retained Deckle renderer suite and Record login-service tests, plus Paper's schedule boundaries, DST behavior, snooze expiry, manual-off/display/app/power precedence, corrupt-data recovery, recipe identity/seed compatibility, partial import failures, and overlay window input/focus configuration.

Run:

```sh
node script/validate.mjs
swift test
./script/build_and_run.sh --verify
```

Local UI checks should exercise the actual bundled application: toggle, texture/intensity changes, snooze/resume from the menu, a display exclusion, app exclusion, schedule gating, valid/invalid recipe imports, persistence after relaunch, the global shortcut, and clean quit. Do not toggle launch at login or change system battery settings merely to make a test pass; use the adapter/policy tests for those paths and mark real system acceptance separately.

The declared deployment floor is macOS 13 with an arm64 binary. Runtime testing on macOS 13/14/15/26 and other Apple Silicon machines, base-memory M1, HDR/EDR, mixed external monitors, fullscreen/Stage Manager, hot-plug, sleep/wake and screen-sharing tools remains required before a broad compatibility claim. Developer ID distribution, notarization and installation from the signed DMG have their own checks.


## Source material

This page follows Paper source at [`6ff7e17`](https://github.com/aindaco1/paper/tree/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95). [docs/testing.md](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/testing.md) is its maintained source. Website service details, where present, are maintained here.
