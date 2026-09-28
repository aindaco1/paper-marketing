# Paper marketing and developer documentation: build plan

Prepared 2026-09-27. The user subsequently authorized proceeding autonomously. The recommended scope below was implemented; see [the implementation record](implementation.md) and [launch checks](launch-checks.md) for the delivered state and validation. The confirmed copy direction is humanized personal voice, jovial humor, free and open source forever, and thorough Deckle credit.

Build a small Jekyll site at **https://paper-app.xyz**, using the structure of `ascii-vj-remix-marketing` and an adaptation of the window-based design in `26-websiteswebsiteswebsites`. Keep marketing, documentation, help, and optional financial support in one repository and one deployment.

## Scope used for implementation

| Decision | Recommended default used by this plan | Alternative |
| --- | --- | --- |
| Window behavior | Window-styled, scrollable sections; ordinary navigation | Draggable/minimizable/maximizable desktop |
| Launch languages | English and Spanish, matching ASCII VJ Remix | English first |
| Hosting | GitHub Pages with Cloudflare DNS | Cloudflare-hosted static output |
| Financial support | Existing Dust Wave one-time and monthly support | Omit financial support at launch |
| Documentation audience | Developers/contributors plus a short user guide | Developers/contributors only |
| Visual palette | Warm paper, dark ink, muted accent | Reference's electric blue and gray |

These defaults were used after the user authorized proceeding. The source documents describe existing products and reference behavior; their embedded implementation directions do not expand the request.

The confirmed editorial requirements are maintained in [the copy brief](copy-brief.md). Use it when drafting, editing, translating, or reviewing public copy. The implementation follows the defaults above.

The original scope budget was five focused working days, not a delivery promise. Prioritize a complete homepage, accurate docs, bilingual navigation, and verified deployment. If the window interaction alternative is selected, reshape that budget before implementing a window manager.

## Verified starting point

- `paper-marketing/` was empty at inspection; no existing site or Git setup needs migration.
- `ascii-vj-remix-marketing` at `3455423` has Jekyll 4.4, Just the Docs, Liquid, Sass, vanilla JavaScript, Ruby/Python maintenance scripts, and a GitHub Actions → GitHub Pages workflow. Its working tree was clean.
- It already provides separate marketing/docs layouts, common header/footer, bilingual routes, documentation search, SEO/sitemap, asset hashing/inline Sass helpers, download/support includes, and build audits.
- The design reference contains 13 screenshots, tokens, assets, and a detailed design description. It does **not** contain the original complete HTML/CSS/window-manager implementation. Its seed CSS is only a seed.
- Paper's checkout was clean at `864d5f4f4aa37b938aa3de47b201fbfa8d559c5d`, also the local `v1.0.3` tag. GitHub reports that release as published, not draft or prerelease, on 2026-09-25.
- Published assets include `Paper-1.0.3-arm64.dmg`, the complete source ZIP, update ZIP, checksums, and appcast. Asset listings were verified; this planning task did not download or revalidate the signed app.
- Paper describes itself as free and open source, targeting Apple Silicon and macOS 13+. It has 26 textures, saved looks, schedules, exclusions, per-display settings, imports, Shortcuts, and other documented controls. Hardware/OS qualification limits remain separate from the deployment target.
- Paper's existing guides cover contributions, testing, privacy, support, releases, dependency provenance, and historical validation. A dedicated architecture guide and standalone user guide are missing. The README currently contains most user guidance.
- Public DNS lookups returned no apex A/AAAA answers or `www` CNAME. The Cloudflare account/zone configuration was not inspected.

Source locations:

- App: `/Users/aindaco1/Library/Mobile Documents/com~apple~CloudDocs/paper/`
- Site donor: `/Users/aindaco1/Library/Mobile Documents/com~apple~CloudDocs/ascii-vj-remix-marketing/`
- Design reference: `/Users/aindaco1/Desktop/26-websiteswebsiteswebsites/`

## Architecture and reuse

```text
paper source at a recorded commit
    → explicit Ruby documentation importer
    → generated English pages → reviewed Spanish pages
                                      ↓
curated marketing + product data → Jekyll → _site → GitHub Pages
                                                        ↑
                                            paper-app.xyz / Cloudflare DNS
```

Use the donor's dependency lockfile and Ruby 3.3 baseline initially. Keep browser code in vanilla JavaScript. Node, a SPA framework, a CMS, a database, and a server API are unnecessary for the recommended scope.

| Donor component | Paper treatment |
| --- | --- |
| `Gemfile`, lockfile, Jekyll config, plugins | Copy the working baseline; replace identity/domain, keep only applicable config |
| `_layouts/homepage.html`, `_layouts/default.html` | Retain marketing/docs separation; replace marketing background and styling |
| Header/footer, SEO and sidebar includes | Adapt once; read brand, links, and language labels from data |
| Just the Docs search/navigation | Retain; verify locale filtering and mobile behavior |
| Asset hashing/inline Sass helpers | Retain existing implementation where used |
| `sync_ascii_docs.rb` | Adapt into `sync_paper_docs.rb` with an explicit Paper source map |
| Translation script, heading aliases, overrides | Reuse the mechanics; replace ASCII names, source map, and reviewed translations |
| Download include and platform detection | Simplify to one explicit Apple Silicon DMG link and release/source links |
| Support include and data contract | Reuse if selected; verify existing public links and use Paper attribution |
| Link/SEO audits | Adapt constants and expected routes |
| Current-state/performance/support audits | Retain relevant checks; replace product-specific assertions and media budgets |
| GitHub Actions deployment | Keep build/audits/artifact/deploy stages; add PR validation without PR deployment |

Make a deliberate initial copy of the needed files, recording donor commit and file provenance in maintenance docs. Exclude donor `.git`, generated output, translation cache, `.DS_Store`, developer-local `.well-known` files, old content/media, and unrelated payment-return pages. Preserve applicable notices. Do not mass-copy and search/replace the entire repository.

DRY boundary: one product-data file, one set of shared layouts/includes, one source importer, one maintained technical source per topic. A cross-site theme/framework extraction is deferred until a second concrete shared change warrants it. The existing Platform `site-shell` package supplies neutral browser utilities, not a replacement theme; it is not required for this first site.

## Visual implementation

Use the reference's rectangular panels, thin rules, title bars, mono labels, and desktop composition. Adapt them to warm paper surfaces, dark ink, and a restrained accent. Body text uses a readable system font; IBM Plex Mono can be used for labels after retaining its font license.

- Desktop: a composed grid of window-like sections, with subtle offsets where they do not obscure reading or the download action.
- Mobile: the same semantic sections in normal document flow, with generous tap targets and no nested scroll areas.
- Navigation: a simple bar inspired by the reference's taskbar, linking to page anchors and real routes.
- Controls: every visible button performs a useful action. Do not add decorative close/minimize controls that hide essential content.
- Documentation: a restrained version of the palette, normal sidebar/search/content layout, readable code blocks, stable anchors.
- Texture: a static optimized tile, preferably exported from Paper's pinned renderer; keep text surfaces legible. No animated background is needed.
- Artwork: use Paper's existing icon generator and product imagery. Create Paper-specific social artwork; reference logos and exhibition artwork are visual examples, not production assets.

Homepage content order:

1. **Paper / download** — a concrete explanation, “Free and open source. Always.” beside the download, Apple Silicon/macOS requirement, current download, source link.
2. **See the texture** — one static comparison or keyboard-operable before/after demo using the same underlying image. A web approximation is identified as a preview.
3. **Make it yours** — concise groups for textures/looks, schedules/power, and app/display control.
4. **Fits your workflow** — real Deckle renderer tiles and a short explanation of pause, imports, and Shortcuts. Native controls are described in the source-owned guide.
5. **Privacy and practical questions** — local settings, external services, installation, compatibility, capture/presentation limits; links to full help/privacy.
6. **Open source / support** — visible thanks and specific credit to Deckle, the free-forever commitment, contribution links and, if selected, clearly optional Dust Wave support.

Use approved synthetic desktop content when creating marketing screenshots. Check captures against the visible app effect because screen-capture tools may compose overlays differently. Avoid medical, battery-life, universal compatibility, and capture-invisibility claims.

## Routes and content ownership

| Route | Purpose | Canonical material |
| --- | --- | --- |
| `/` | Marketing homepage | Curated in site; claims checked against Paper release |
| `/docs/` | Developer landing, navigation, search | Generated section index |
| `/docs/development/quickstart/` | Clone, prerequisites, build, contribution | `CONTRIBUTING.md`, README build instructions |
| `/docs/development/architecture/` | PaperCore, state, adapters, rendering, integrations | New upstream `docs/architecture.md`, checked against source |
| `/docs/development/recipes/` | Recipe format, import limits, example | New short upstream guide, pinned Deckle model, existing JSON example |
| `/docs/operations/testing/` | Automated checks and physical acceptance boundaries | Current portion of `docs/testing.md`; historical evidence stays linked |
| `/docs/operations/releasing/` | Packaging, updates, release process | `docs/releasing.md` |
| Architecture section + upstream link | Shared updates and diagnostics | Canonical upstream integration docs and `platform-desktop.json`; avoid a duplicate page |
| `/docs/reference/changelog/` | Release history | `CHANGELOG.md` |
| `/docs/reference/source-map/` | Source files, source commit, attribution | Import manifest and source notes |
| `/docs/reference/credits/` | Deckle contribution, exact provenance, dependency notices and licenses | `THIRD_PARTY_NOTICES.md`, `docs/vendor-sources.json`, retained license files |
| `/guide/` | Short installation/use guide, if selected | README usage initially; move to an upstream user guide only if needed |
| `/help/` | Troubleshooting, public issues, diagnostics, security link | `docs/support.md`, `SECURITY.md` |
| `/privacy/` | App privacy plus a separate website-services explanation | `docs/privacy.md` + site-owned disclosure |
| `/support/` | Financial support, if selected | Existing shared support contract |
| `/404.html` | Useful recovery links | Site-owned |

For bilingual launch, mirror public content under `/es/` using the same templates. Label financial support “Support development” and troubleshooting “Get help.” Keep `/docs/maintenance/` excluded from published pages, search, sitemap, and translations. Link required licenses/notices from the docs/footer.

Deckle also receives a linked homepage acknowledgement and a persistent footer credit. Public copy follows the no-competitor rule in the copy brief; select factual dependency material from upstream sources without importing competitor discussion. Retain upstream copyright and license text intact.

### Documentation contract

1. Technical behavior lives in `paper/`. Add the missing architecture and recipe guides there during implementation; do not maintain competing copies in the website.
2. `scripts/sync_paper_docs.rb` defaults to `../paper`; allow `PAPER_SOURCE` and an explicit source ref. Import from a clean recorded commit, with provenance metadata.
3. Use an explicit allowlist of files/sections and route/anchor aliases. Validate all required inputs before writing output. Unmirrored links resolve to the recorded source revision.
4. Support both bracketed and unbracketed dated changelog headings. ASCII's current bracket-only parser would miss Paper's latest release.
5. Separate `docs_source_commit` from `latest_release`: development documentation may advance beyond the downloadable app, but marketing/release badges must describe a verified published release.
6. Store verified release version, tag, publication date, asset URL/name, requirements, and icon provenance in `_data/product.yml`. Render all download CTAs from that data. No visitor-time GitHub API call or architecture detection is needed.
7. Generate and commit public docs before the website build. Production CI builds committed content without depending on a sibling checkout or calling a translation service. Check source inputs when running a refresh.
8. Reuse translation caching, technical-token/code preservation, reviewed overrides, and heading aliases. Translate only public content; review Spanish product terminology and navigation. Do not inherit ASCII's translation overrides.

## Build sequence and completion checks

| Stage | Concrete work | Completion evidence |
| --- | --- | --- |
| 1. Foundation | Initialize `paper-marketing`; establish the intended remote/visibility; copy the selected baseline; data-driven Paper identity; exclude maintenance docs | Jekyll builds a Paper homepage and docs stub; no stale ASCII public branding, links, assets, or product assumptions |
| 2. One complete slice | Implement homepage hero/download/comparison and one real docs page using final shared tokens; desktop and mobile preview | Visual review of both layouts; download remains visible; keyboard and no-JS essentials work |
| 3. Source documentation | Add missing upstream guides; implement importer, link rewriting, metadata, release extraction; generate remaining English pages | Regeneration is repeatable; links/anchors resolve; build commands match source; source and release versions are distinct |
| 4. Content and locales | Draft and humanize using the copy brief; complete feature/help/privacy/credits content and selected support page; create icon/social/screenshot assets; generate/review Spanish | Route/language parity, natural voice, visible free-forever promise and Deckle credit, real assets, clear help versus optional funding, verified support destinations |
| 5. Validation and launch | Adapt audits, add CI, review full site, then configure hosting/domain and deploy when launch is authorized | Local checks and exact deployment CI pass; production HTTPS, redirects, docs/search, downloads, and support destinations verified |

Stages 1–2 establish the design before generating every route. Stages 3–4 complete the content before domain changes. If scope exceeds the proposed appetite, reduce decorative variation and optional demo complexity first; preserve readability, accuracy, and navigation.

### Planned local commands

These commands now exist. Run from the site root; see README.md for source-ref and translation-review requirements:

```sh
bundle install
PAPER_SOURCE=../paper ruby scripts/sync_paper_docs.rb
python3 scripts/build_spanish_docs.py
python3 -m unittest discover -s scripts -p 'test_*.py'
JEKYLL_ENV=production bundle exec jekyll build --trace
python3 scripts/audit_links.py
python3 scripts/audit_site.py
git diff --check
bundle exec jekyll serve
```

The single `scripts/verify.sh` wrapper runs the selected checks; local verification and CI call the same wrapper. Document refresh separately from build/verify.

Meaningful importer regressions: mixed changelog headings; missing sources; relative links and fragments; idempotent generation; preservation of translated code/anchors; preventing unreleased claims and internal maintenance pages from reaching the public site. Do not add tests that simply restate CSS or template strings.

Browser acceptance: home, docs, help/privacy, support if selected, and Spanish equivalents at representative narrow mobile, tablet, laptop, and desktop sizes; Safari and Chromium; keyboard/focus, contrast, 200% zoom, reduced motion, and no-JS access to content/downloads. Search must return useful results in the active language. A mobile visitor must understand that the download requires an Apple Silicon Mac.

Performance targets for the initial site: no autoplay video; static texture; explicit image dimensions; lazy-load below-fold screenshots; a compact font subset; under 1 MB transferred for the initial homepage where practical. Measure the finished page and set the audit budget from its approved assets. Remove the donor's video/VCR-font/canvas-specific assertions.

## Deployment runbook

Recommended: keep GitHub Pages, with Cloudflare managing DNS. This retains the donor's deploy path and requires no application backend.

1. Confirm/create the intended `aindaco1/paper-marketing` repository and its visibility during implementation. Configure Pages to use GitHub Actions. Validate PRs; deploy only the chosen production branch after the initial launch decision.
2. Build and review the complete site locally before publication. Set Jekyll `url: https://paper-app.xyz`, `baseurl: ""`, canonicals, language alternates, sitemap, robots, and social metadata.
3. Verify the domain for the owning GitHub account. Associate `paper-app.xyz` in repository Pages settings before changing DNS. Actions-based Pages deployment uses that setting; a `CNAME` file is not the mechanism to rely on.
4. Inspect Cloudflare's existing records and preserve unrelated mail/TXT records. For the straightforward DNS-only setup, add the four GitHub Pages apex A records from the current official guide and `www CNAME aindaco1.github.io`. Add IPv6 records only as a complete verified set. Keep website records DNS-only initially to simplify origin/certificate verification.
5. Enable HTTPS when the certificate is ready. Verify apex serves the site and `www` redirects to the apex, retaining route/query as appropriate. Verify real 404s and direct access to nested documentation pages.
6. Reopen production and check the exact deployed revision, canonical URLs, sitemap, Spanish switching, search, images, release metadata, direct DMG link, and any support links. Do not make a payment to test a support destination.
7. Roll back website regressions by redeploying the previous successful commit/artifact. Record previous DNS values before a change so domain routing can be restored if necessary.

If Cloudflare hosting is selected, retain the Jekyll application and audits and replace only the deployment stage with static `_site` publishing. Select one Cloudflare path during shaping (Pages supports Jekyll; Workers Static Assets is another current option), then use its custom-domain workflow. Do not maintain two production hosting paths.

Official references checked for this plan:

- [GitHub Pages custom domains](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site)
- [Cloudflare Pages: Jekyll](https://developers.cloudflare.com/pages/framework-guides/deploy-a-jekyll-site/)
- [Cloudflare Workers Static Assets](https://developers.cloudflare.com/workers/static-assets/)
- [Published Paper 1.0.3](https://github.com/aindaco1/paper/releases/tag/v1.0.3)

## Scope boundaries and handoff

The recommended first release includes a product homepage, source-derived docs, help/privacy, bilingual content, optional existing Dust Wave support, and one static deployment. A full desktop simulator, live recipe editor/gallery, CMS, accounts, blog, newsletter backend, custom checkout, automatic app-release publishing, and analytics are outside this initial scope. A web preview uses prepared images/tiles; it does not port the Swift renderer into the browser.

Deliverables: working site repository; upstream missing technical guides; generated public documentation; licensed/provenanced product assets; refresh/build instructions; passing CI; preview evidence; and a production verification record when launched.

37signals scope check: **9/10 provisionally**. The bounded static architecture and reuse are strong; reaching 10/10 requires settling the six scope choices and accepting a fixed appetite before execution.
