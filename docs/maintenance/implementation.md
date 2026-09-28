# Implementation record

## Scope and provenance

The user approved proceeding autonomously after the plan and copy brief. The recommended defaults were implemented: English and Spanish, scrollable window-styled sections, warm paper/ink/moss palette, one GitHub Pages site with Cloudflare DNS, developer docs plus user guidance, and optional existing Dust Wave support links. No new app, framework, CMS, checkout, or window manager was introduced.

The site baseline is `ascii-vj-remix-marketing` at `3455423`. Reused material includes Gemfile/lockfile, the default documentation layout and head, asset hashing/inline Sass helpers, support data/include, local-link audit, and Spanish translation/heading-alias utilities. Paper-specific product data, import allowlist, copy, styles, preview, assets, audits and release workflow replace donor assumptions. The MIT Just the Docs theme remains a locked dependency.

The visual reference is the local `26-websiteswebsiteswebsites` design study: rectangular windows, thin rules, mono labels, layered composition and orderly mobile flow. Its original exhibition text and artwork were not copied. IBM Plex Mono font files are retained with the upstream OFL. The Paper icon uses the app's existing generator. The social graphic is original text/vector artwork.

The preview tiles are actual renderer output from Deckle commit `cb4eb09dc117bb046c3ca83b782c5a9ed53dfd91`, as vendored by Paper. `TexturePreset.swift` and `TextureRenderer.swift` are retained unchanged upstream; Paper's custom recipe model/conversion is extracted from Deckle's PaperMill. The website links Deckle from the homepage and every footer, describes the contribution on the credits page, and ships Deckle's MIT notice. Source files, exact revision and additional dependencies are linked there. The web preview is clearly labelled; no simulated settings screen is presented as a native screenshot.

## Documentation ownership

The missing user guide, architecture and recipe guides were added to Paper through [PR #7](https://github.com/aindaco1/paper/pull/7), validated by the app repository's checks, and merged. They are maintained upstream. This site imports source at `6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95`. The currently published app remains version 1.0.3. No app functionality or release artifact changed in this task.

The importer reads an explicit committed source ref, checks every input before writing, rewrites links to mirrored routes or the recorded source, and records file hashes. A partial testing guide links to the full upstream history. Shared desktop services are covered in architecture and linked to their canonical integration guide, avoiding a redundant page. CI builds committed docs without fetching Paper or calling translation services.

Spanish marketing copy and all 15 generated documentation bodies were edited for meaning and tone. English control names match the app. The translation script fails when a changed English source lacks a reviewed body, unless the maintainer explicitly requests an unreviewed machine draft. English anchor aliases support links shared between languages.

## Validation and launch

The final live acceptance record is in `launch-checks.md`. Local verification uses `scripts/verify.sh`, the same entry point as CI. It covers source import/link/translation edge cases, 35 rendered pages, local links and anchors, locale navigation, release/download identity, Deckle credit, support attribution, metadata, excluded internal files and static asset budgets.

Browser checks cover the mobile menu, locale-specific search, preview toggle/texture/intensity, language switching, content widths, and representative English/Spanish routes. Lighthouse checks accessibility, SEO and best practices; it does not establish physical app behavior or browser performance timings. App signing, native hardware qualification and installation remain the app repository's responsibility.

## Deliberate simplifications

- One data file for product/release identity; one group of shared layouts and includes.
- One combined site audit alongside the reusable local-link audit.
- Real renderer tiles instead of a native settings screenshot. This avoids exposing a personal configuration and keeps the initial download small.
- No visitor telemetry, analytics, tracking cookies, remote fonts, account system, autoplay video, or browser storage.
- Existing Stripe hosted links only. No payment or subscription was created during verification.
- No scheduled task or continuing monitor. Routine future updates run through the repository workflow.
