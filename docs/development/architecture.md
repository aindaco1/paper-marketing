---
title: Architecture
description: Architecture for Paper, the free and open-source macOS paper-texture
  app.
lang: en
source_commit: 871398865f5ee28615b51d21dfcc30e4b3604d48
generated: true
parent: Development
nav_order: 2
---

# Paper architecture

Paper is an Apple Silicon macOS menu-bar app. SwiftPM separates policy from Apple system integrations: `PaperCore` contains value types and decisions; the `Paper` executable owns AppKit, SwiftUI, persistence, and platform adapters.

## Follow a setting

1. A menu action, Settings control, or App Intent calls `PaperState`.
2. `PaperState` updates typed settings, normalizes selections, and persists local state. Visibility decisions use the policy types in `PaperCore`.
3. `OverlayController` observes state and system events, then decides which connected displays need a window. Closely spaced state changes are coalesced.
4. Each eligible display receives a nonactivating, click-through `PaperOverlayWindow`. A cached Deckle texture tile supplies its layer; window alpha supplies intensity.

Manual off and display exclusions always win. Saved looks and automatic appearance changes do not bypass snooze, presentation pause, schedules, or power rules. Check the policy and its tests before changing precedence.

## Source map

| Area | Main source | Responsibility |
| --- | --- | --- |
| App lifecycle | `Sources/Paper/PaperApp.swift` | Menu bar, settings presentation, application lifecycle |
| State and commands | `Sources/Paper/PaperState.swift` | Settings, appearance selection, imports, persistence, common command entry points |
| Pure policy | `Sources/PaperCore/` | Visibility rules, schedules, solar times, looks, shortcuts and library models |
| Overlay windows | `Sources/Paper/OverlayController.swift` | Display lifecycle, window configuration, texture placement |
| System adapters | `SystemEnvironment.swift`, `SystemOverviewMonitor.swift`, `ExcludedPanelMonitor.swift` | Power/app changes and bounded public window-metadata checks |
| Settings UI | `PaperView.swift`, `ScheduleControls.swift`, `LibraryControls.swift`, `WorkflowControls.swift` | User-facing configuration |
| Automation | `PaperIntents.swift`, `GlobalShortcut.swift` | Native Shortcuts actions and registered hotkeys |
| Imports and backup | `BoundedJSONFile.swift`, `PaperArchive.swift` | Bounded reads, validation and atomic library merges |
| Diagnostics | `PaperDiagnostics.swift` | Paper's filtered report contract and shared support adapter |
| One-instance rule | `SingleInstance.swift` | One running instance per user and reopening Settings |

Paths without a directory in the table are under `Sources/Paper/`.

## Rendering and provenance

Paper retains Deckle's pinned `TexturePreset.swift` and `TextureRenderer.swift` unchanged. `CustomPaper.swift` contains the model and conversion portion extracted from Deckle's `PaperMill.swift`. The renderer produces reusable tiles rather than a screen-sized image on every refresh. It supports legacy, spectral and spectral-plus recipe engines and bounded caches.

The built-in catalog comes directly from Deckle. Paper places its default Soft Wove first instead of maintaining a separate subset of texture IDs. Per-display overrides change effective intensity independently of the selected look.

Read [third-party notices](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/THIRD_PARTY_NOTICES.md) and [the vendor manifest](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/docs/vendor-sources.json) for exact revisions, hashes and retained licenses. Importing a recipe changes its local identity while preserving its rendering seed; see [recipes](/docs/development/recipes/).

## System behavior

Overlay windows do not accept focus or intercept input. Paper uses public window metadata for exclusions and Mission Control; it does not capture screen contents, inspect window titles, install event taps, or change display gamma. Visibility monitors stop when the overlay is ineligible.

App activation, display changes, sleep/wake and session changes feed narrow adapters. Fixed-time scheduling uses boundary timers and time-change notifications. Solar scheduling resolves an explicitly entered city through Apple's geocoder and computes approximate solar times locally.

`PaperCore` tests cover policy. They cannot prove behavior with every real fullscreen app, monitor, OS release, or capture provider. [Testing](/docs/operations/testing/) separates those acceptance conditions.

## Local state and services

Settings use the `xyz.dustwave.paper` preferences domain. The paper collection stores recipes and their library references together. Invalid or over-capacity library merges leave the existing collection unchanged; unreadable settings are retained for recovery and leave the overlay off.

Desk profiles, app assignments, shortcut bindings and other device-specific settings are local. Library exports include custom papers, favorites and saved looks, not every preference.

The pinned Dust Wave Platform desktop package supplies Sparkle update integration and reviewed diagnostics mechanics. Paper retains its own report schema and submission destination. There is no speech or AI runtime in the app. See [privacy](/privacy/), [desktop integration](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/docs/SHARED_DESKTOP_MIGRATION.md), and [release workflow](/docs/operations/releasing/).

## Changing the code

Keep new policy testable in `PaperCore` and Apple APIs in narrow adapters. Reuse the commands in `PaperState` so menu controls, Settings, hotkeys and App Intents agree. Preserve pinned vendor sources and their provenance. Follow [Contributing](/docs/development/quickstart/) for the exact checks.

## Source material

This page follows Paper source at [`8713988`](https://github.com/aindaco1/paper/tree/871398865f5ee28615b51d21dfcc30e4b3604d48). [docs/architecture.md](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/docs/architecture.md) is its maintained source. Website service details, where present, are maintained here.
