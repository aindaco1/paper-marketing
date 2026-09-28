---
title: Privacy
description: Privacy for Paper, the free and open-source macOS paper-texture app.
lang: en
source_commit: 6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95
generated: true
layout: page
permalink: "/privacy/"
nav_exclude: true
---

# Privacy and diagnostics

Paper renders local texture tiles. It does not capture screens, install event taps, adjust gamma, or send telemetry. Recipes, looks and visibility rules stay on the Mac. City lookup sends the entered city to Apple's geocoding service.

Sparkle checks the official GitHub release feed at launch and periodically when automatic checks are enabled. Checks can be disabled in settings; manual checks remain available. Installation requires user action. System profiling and automatic installation are disabled. Connections expose ordinary provider connection metadata; Paper does not add a device identifier.

**Help & diagnostics** prepares an exact JSON preview. Only numeric app/build/OS versions, architecture, broad overlay/power/schedule state, coarse intensity, bounded display counts and the last 20 event categories are included. Event categories never carry arbitrary messages. Reports exclude paths, application names and IDs, display IDs, city, recipe names/content, saved looks, credentials, stack symbols, raw crash reports and environment variables. A bounded event journal and one pending filtered report are kept in the local Paper preferences domain. A report ID identifies a retryable submission, not a person or device.

**Import crash log** accepts a user-selected Paper `.ips` file up to 2 MB. The shared native parser checks its product identity and retains only allowlisted exception/signal/image, a bounded image offset and incident versions. The incident's build and OS govern grouping; current settings do not split identical crashes. The raw incident stays local.

**Send to public GitHub issues** is an explicit action. It sends the displayed report, at most 8 KiB, over HTTPS to `https://crash.dustwave.xyz/v1/paper/reports`. The existing relay holds GitHub credentials and creates or updates an issue only in `aindaco1/paper`. Identical fingerprints share an issue; retries retain their ID and do not increment the count twice within the relay's bounded receipt retention. Opening the sheet, importing a crash or saving JSON does not upload it. No report is automatically sent after a crash.

The transport rejects redirects, oversized replies and mismatched acknowledgements. Failed/unconfirmed sends remain retryable. GitHub issues are public; use the [private security channel](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/SECURITY.md) for vulnerabilities. Relay IP rate limits use connection metadata for abuse prevention, never issue content. Counts are submissions, not unique users or proven root causes.

Desk profiles, per-app look assignments, shortcut bindings, texture intensity recall,
reading-strip geometry and lamp settings remain in local preferences. None are
added to diagnostic reports. Presentation/low-battery pauses map to the existing
coarse snooze/battery categories of the deployed report schema. The reading strip
uses fixed user-chosen geometry, without pointer monitoring or screen analysis.
The instance coordinator accepts only a request to show Settings; it has no remote
configuration, file-opening or command-execution protocol.

## This website

The Paper website is a static site hosted by GitHub Pages, with DNS managed by Cloudflare. It has no analytics scripts, advertising, sign-in, or marketing cookies. Hosting providers receive ordinary connection metadata. Documentation search runs in your browser. The texture preview does not save settings or upload anything.

Optional support links open Stripe's hosted checkout. Payments and any recurring support are handled by Stripe, not this site. GitHub hosts app downloads and source code. [GitHub privacy](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement), [Cloudflare privacy](https://www.cloudflare.com/privacypolicy/), and [Stripe privacy](https://stripe.com/privacy).

## Source material

This page follows Paper source at [`6ff7e17`](https://github.com/aindaco1/paper/tree/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95). [docs/privacy.md](https://github.com/aindaco1/paper/blob/6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95/docs/privacy.md) is its maintained source. Website service details, where present, are maintained here.
