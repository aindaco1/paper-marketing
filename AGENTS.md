# Paper marketing

Stay with Jekyll, Just the Docs, Liquid, Sass and small vanilla JavaScript. Reuse the shared includes and data; avoid a parallel app or documentation system.

Technical behavior is maintained in the Paper app repository. Refresh generated pages through scripts/sync_paper_docs.rb and review Spanish through scripts/build_spanish_docs.py. Verify release assets before updating product data. Keep source and published release versions distinct.

Use docs/maintenance/copy-brief.md for public copy: natural, lightly funny, free and open source forever, generous factual Deckle credit. Never introduce competitor names or comparisons. Preserve upstream license text and attribution. The website is MIT-licensed; bundled assets retain their notices.

Run ./scripts/verify.sh after content or template changes. For visual/interaction changes, review English and Spanish home/docs at desktop and narrow mobile widths, including keyboard use and search. Do not claim a live deployment from a local build. Main deploys to GitHub Pages; PRs only validate.
