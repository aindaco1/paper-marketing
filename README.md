# Paper website

Marketing, user guides, and developer documentation for [Paper](https://paper-app.xyz), a free and open-source Mac app. Free forever. Built with [Deckle](https://github.com/YellowFoxH4XOR/deckle), whose renderer, catalog, and recipe model deserve the credit.

Jekyll 4.4 + Just the Docs + Liquid/Sass + a little vanilla JavaScript, based on the existing ASCII VJ Remix marketing site. English and Spanish share templates and product data. One repository, one static build, no visitor-time API or translation service.

## Run and check

Use Ruby 3.3, Bundler and Python 3.10+ (standard library only). The lockfile also works with the local Ruby 3.0 installation used for initial checks.

```sh
bundle install
bundle exec jekyll serve --host 127.0.0.1
./scripts/verify.sh
```

The verification wrapper runs importer/translation regression tests, builds production output, audits every local link and anchor, and checks language navigation, metadata, attribution, download/support links, asset budgets and excluded maintenance content. CI runs the same wrapper. PRs are checked; main deploys to GitHub Pages. Cloudflare manages DNS for `paper-app.xyz`.

## Content ownership

- `_data/product.yml`: verified release, requirements, app/source URLs, Deckle pin, icon provenance. All download buttons read this file.
- `_data/i18n/{en,es}.json`: reviewed marketing copy and interface labels.
- `_includes/`, `_layouts/`, `_sass/`, `assets/css/home.scss`: shared presentation.
- Technical documentation lives in [Paper's repository](https://github.com/aindaco1/paper). `_data/doc_sources.yml` defines the exact import allowlist. Generated pages identify their source commit; `_data/docs_provenance.json` records source hashes.
- `scripts/spanish-docs-overrides.json`: reviewed Spanish bodies keyed by their exact English source. Code blocks, app control names, links and English heading aliases are preserved.
- `_data/support.yml`: existing Dust Wave Stripe support contract, with Paper campaign attribution. Donations never unlock app features.

## Refresh documentation

First update and commit the maintained sources in Paper. Verify the published GitHub release and actual asset before changing `latest_release`; source changes and released app changes are separate.

```sh
PAPER_SOURCE=../paper PAPER_SOURCE_REF=<committed-ref> ruby scripts/sync_paper_docs.rb
python3 scripts/build_spanish_docs.py
./scripts/verify.sh
```

The importer reads the recorded Git commit, never uncommitted working files. It validates the complete allowlist before writing. The Spanish command stops if an English body lacks a reviewed translation. Add or update its entry in the overrides file, then rerun. A source commit update changes provenance links, which need review too. `PAPER_TRANSLATION_FILES=guide.md,docs/development/recipes.md` can limit a refresh. An explicitly requested machine draft is available with `PAPER_ALLOW_UNREVIEWED_TRANSLATION=1`; that sends public text to Google's translation endpoints and must be edited before commit. Production builds do not use it.

Do not hand-edit generated pages. Change the upstream source, the importer for website-owned notes/indexes/credits, or the reviewed translation. Keep maintenance documents out of the public build, navigation, sitemap and search.

## Artwork and provenance

`./scripts/generate_assets.sh` exports the texture tiles from the sibling Paper checkout's pinned Deckle renderer and uses Paper's icon generator. It requires macOS and Swift. Verify the source checkout against `_data/product.yml` before regenerating. The social image is drawn by `scripts/generate_social.swift`. The web texture demo is labelled as a preview.

Retain Deckle's MIT notice and IBM Plex's OFL in `assets/licenses/`. See [implementation notes](docs/maintenance/implementation.md), the [build plan](docs/maintenance/build-plan.md), and the [copy brief](docs/maintenance/copy-brief.md) for provenance and maintenance decisions.
