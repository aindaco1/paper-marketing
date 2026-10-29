---
title: Quickstart
description: Quickstart for Paper, the free and open-source macOS paper-texture app.
lang: en
source_commit: d20a6dfa0c6f9195eb544b21826eacbd0b3bcf58
generated: true
parent: Development
nav_order: 1
---

# Contributing to Paper

Use Xcode 27+, Node 24, and an Apple Silicon Mac. Initialize the exact Platform submodule with `git submodule update --init --recursive`. Do not edit vendored Deckle/Record files without updating their provenance and retained tests.

Quit an installed Paper copy before running a development build or the native suites. The single-instance rule otherwise reopens the existing app instead of the new binary. Normal app settings are separate from the native suites' disposable preferences.

Before a pull request:

```sh
node script/validate.mjs
node --test Tests/relay/*.test.mjs
swift test --package-path shared/dust-wave-platform/desktop
swift test
./script/build_and_run.sh --verify
```

CI runs the same source/contract/Swift checks and builds an ad-hoc app using the official GitHub `xcode-27` runner. Real pointer input, login, physical HDR, other OS versions and actual update installation are separate acceptance gates. See [testing](/docs/operations/testing/).

Keep pure visibility/schedule policy in PaperCore and system integrations in narrow adapters. Keep the app small, reuse the shared modules, and never introduce screen capture, event taps, gamma adjustment, hidden uploads or a custom updater. Product-specific report contracts stay in Paper; relay aggregation stays shared. Keep `Package.resolved` and the Platform pin exact.

Submit clear reproduction steps and relevant checks. Use synthetic reports/media for examples. Never commit credentials, real crash logs, private paths or local outputs. Build artifacts belong in ignored `dist/`; delivery evidence belongs in ignored `outputs/`. The application is MIT; the separate display test tooling is GPL-3.0 and must not be shipped in Paper.app.

## Match the CI toolchain

The [app's CI workflow](https://github.com/aindaco1/paper/blob/d20a6dfa0c6f9195eb544b21826eacbd0b3bcf58/.github/workflows/ci.yml) pins Node **24.22.1** on the **xcode-27** runner. Use that Node patch release when reproducing CI locally. Node is used by development checks; it is not bundled with Paper.

The workflow also runs the tracked-secret scan and Python native-display oracle tests. Consult the pinned workflow for the complete check sequence. A passing CI build does not establish real-display behavior, notarization or installed-update acceptance.

## Source material

This page follows Paper source at [`d20a6df`](https://github.com/aindaco1/paper/tree/d20a6dfa0c6f9195eb544b21826eacbd0b3bcf58). [CONTRIBUTING.md](https://github.com/aindaco1/paper/blob/d20a6dfa0c6f9195eb544b21826eacbd0b3bcf58/CONTRIBUTING.md) is its maintained source. Website service details, where present, are maintained here.
