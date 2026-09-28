# Paper site launch checks

Initial site commit: `8f5f83d`. App documentation source: `6ff7e17c1a53e93f94f6987fae508a8f9e8e2b95`. Published app: 1.0.3. Checked 2026-09-27 (America/Denver).

## Build and content

- `./scripts/verify.sh`: passed. Seven documentation pipeline regression tests, production Jekyll build, all internal links/anchors across 35 HTML pages, locale navigation, release/download, Deckle credit, support-link attribution, metadata, privacy assertions and public-file exclusions passed.
- The source importer regenerated all 15 English documentation pages and provenance/product data byte-for-byte identically at the recorded revision.
- The 15 Spanish documentation bodies were reviewed and regenerated through the inherited heading-alias pipeline. The script now rejects changed sources without a reviewed translation by default.
- [GitHub Actions run 36370491831](https://github.com/aindaco1/paper-marketing/actions/runs/36370491831): build and deployment passed on the initial site commit.
- Homepage static asset budget: 524,267 bytes, counting all three texture tiles, both font weights, icon, HTML and first-party JavaScript. This is an asset budget, not a network-performance score.
- Real preview tiles were exported from the pinned Deckle renderer. Icon and social artwork were inspected. The three upstream guides passed Paper's validation and [PR #7](https://github.com/aindaco1/paper/pull/7) CI before merge.

## Browser and payment-link checks

- Chromium: desktop documentation layout at 1440 pixels, Spanish homepage at 390 and 320 pixels, Spanish support at 320 pixels, and source-map content at 768 pixels. No page-level horizontal overflow in those checks. The narrow-screen paper-stack overflow found during review was corrected.
- English and Spanish search returned results only in the active language. Mobile documentation menu opened. Language switching preserved an English section fragment with a matching alias in the translated page.
- Preview toggle set opacity to zero; selecting Rice Paper changed the actual tile; the intensity slider updated both opacity and its displayed value. Spanish status labels updated correctly.
- Safari: homepage rendered and the texture toggle visibly switched to “Texture off.” The focus indicator remained visible.
- Lighthouse mobile homepage and Spanish recipes page: accessibility 100, best practices 100, SEO 100, no failed audits. These checks exclude performance scoring and are not a complete assistive-technology audit.
- All four public Stripe links opened Dust Wave Support. One-time links offered a customer-chosen amount with $10 suggested. Monthly links showed $5/month. No payment details were entered and no transaction or subscription was created. Hosted checkout language follows Stripe/browser behavior; the support-page copy is translated.

## Domain and live site

The site uses GitHub Pages Actions publishing and Cloudflare DNS. The custom domain was associated in Pages before DNS changes. The zone initially contained no DNS records. Four DNS-only apex A records now point to `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, and `185.199.111.153`; DNS-only `www` CNAME points to `aindaco1.github.io`. Public DNS and Cloudflare's saved table confirmed all five records. No unrelated DNS records were changed.

- GitHub issued a valid certificate for both `paper-app.xyz` and `www.paper-app.xyz`. Pages reports `https_enforced: true`; HTTPS requests passed normal certificate validation.
- `http://paper-app.xyz/`, `http://www.paper-app.xyz/docs/`, and `https://www.paper-app.xyz/es/docs/` returned 301 redirects to the HTTPS apex, preserving the path.
- All 35 deployed HTML routes returned 200 with the expected locale, a nonempty title, and an HTTPS canonical URL. The directly requested `404.html` is a normal static document; an unknown route correctly returned 404 with Paper's custom page.
- Live `robots.txt`, `sitemap.xml`, and the documentation search index returned 200. Chromium loaded the live homepage with the intended heading, exact 1.0.3 DMG link, no broken images, and no desktop horizontal overflow.
- Added the GitHub Pages ownership TXT record, confirmed it through public DNS, and completed account-level verification. GitHub displayed “Successfully verified paper-app.xyz” and listed the domain as Verified. Retain this TXT record.
- [GitHub Actions run 36371316820](https://github.com/aindaco1/paper-marketing/actions/runs/36371316820): build and deployment passed on `03c65ea`, the published revision used for the live checks above. This launch record is the only subsequent change.
