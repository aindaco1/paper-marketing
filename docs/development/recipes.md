---
title: Recipes and backups
description: Recipes and backups for Paper, the free and open-source macOS paper-texture
  app.
lang: en
source_commit: 871398865f5ee28615b51d21dfcc30e4b3604d48
generated: true
parent: Development
nav_order: 3
---

# Paper recipes

Paper imports Deckle-compatible JSON recipes, including files ending in `.decklepaper.json`. A recipe describes a texture. It is not an image, executable plugin, or web download instruction.

## Import an example

Save [Soft Linen](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/docs/examples/soft-linen.decklepaper.json) and choose **Import paper…** in Paper. You can select more than one file. Invalid files report an error while valid files still import.

Each file is limited to 1 MiB (1,048,576 bytes), and Paper stores up to 50 custom papers. Each imported recipe receives a fresh local ID while keeping its rendering seed. Importing a recipe twice is different from reimporting an unchanged library backup.

## Recipe fields

The canonical model and conversion are in [`CustomPaper.swift`](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/Sources/Paper/Vendor/Deckle/CustomPaper.swift), extracted from the pinned Deckle source. Prefer that implementation when extending a recipe rather than inventing a second schema.

| Field | Meaning |
| --- | --- |
| `id`, `name` | Original identity and display name; import assigns a new local identity |
| `tintRed`, `tintGreen`, `tintBlue` | Texture tint channels |
| `wash` | Tint wash strength |
| `weave`, `blotch` | Weave and low-frequency texture contributions |
| `engineVersion` | Rendering engine: legacy (1), spectral (2), or spectral-plus (3) |
| `seed` | Deterministic rendering seed |
| `fiberAngle`, `fiberStrength`, `surfaceRoughness` | Spectral-plus controls |
| `darkGrainStrength`, `lightGrainStrength` | Optional grain-strength overrides |

Older recipes can omit newer fields. The decoder supplies compatibility defaults and derives a deterministic legacy seed from the original identity when needed. The renderer clamps rendering parameters; Paper rejects nonfinite numeric values and unsupported/incomplete data. Names are stripped of control characters and surrounding whitespace, must remain readable, and are limited to 80 characters.

Paper exposes import/removal controls, not a recipe editor or online gallery.

## Library backups

**Export library…** produces a versioned JSON backup of custom recipes, favorites and up to eight saved looks. **Import library…** merges that snapshot with the current collection. It remaps conflicting recipe/look IDs together and does not duplicate unchanged reimports. Invalid or over-capacity merges make no changes.

A backup has the same 1 MiB size limit. It does not include the selected city, app rules, display identities, desk profiles, shortcut bindings, or every other setting. See [`PaperArchive.swift`](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/Sources/Paper/PaperArchive.swift) and its tests for the exact merge behavior.

## Credit

Deckle's contributors built the recipe model, preset conversion and texture renderer used here. Paper retains their MIT notices and records the exact source in [the vendor manifest](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/docs/vendor-sources.json). See [all third-party notices](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/THIRD_PARTY_NOTICES.md).

## Source material

This page follows Paper source at [`8713988`](https://github.com/aindaco1/paper/tree/871398865f5ee28615b51d21dfcc30e4b3604d48). [docs/recipes.md](https://github.com/aindaco1/paper/blob/871398865f5ee28615b51d21dfcc30e4b3604d48/docs/recipes.md) is its maintained source. Website service details, where present, are maintained here.
