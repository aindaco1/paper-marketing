#!/usr/bin/env python3
"""Check the built product, locale, metadata and asset contracts in one pass."""
import hashlib
import json
import re
import sys
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import urlparse, parse_qs

ROOT = Path(__file__).resolve().parents[1]
SITE = ROOT / '_site'
ORIGIN = 'https://paper-app.xyz'

class Page(HTMLParser):
    def __init__(self, text):
        super().__init__(); self.lang = ''; self.links = []; self.meta = []; self.assets = []; self.headings = 0; self.text = []
        self.feed(text)
    def handle_starttag(self, tag, attrs):
        a = dict(attrs)
        if tag == 'html': self.lang = a.get('lang')
        if tag == 'link': self.links.append(a)
        if tag == 'meta': self.meta.append(a)
        if tag == 'h1': self.headings += 1
        if tag in ('script','img','source') and a.get('src'): self.assets.append(a['src'])
        if tag == 'img' and 'alt' not in a: self.assets.append('MISSING_ALT')
    def handle_data(self, data): self.text.append(data)

def main():
    errors = []
    def require(test, message):
        if not test: errors.append(message)
    product = json.loads(__import__('subprocess').check_output(['ruby','-ryaml','-rjson','-e','puts JSON.generate(YAML.load_file(ARGV[0]))',str(ROOT/'_data/product.yml')]))
    version = product['latest_release']['version']
    paths = sorted(SITE.rglob('*.html'))
    require(bool(paths), 'No built HTML')
    for path in paths:
        relative = str(path.relative_to(SITE)); text = path.read_text(); page = Page(text)
        route = '/' + relative.removesuffix('index.html')
        expected_lang = 'es' if relative.startswith('es/') else 'en'
        require(page.lang == expected_lang, f'{relative}: incorrect language')
        require(page.headings == 1, f'{relative}: expected one h1, found {page.headings}')
        require(any(m.get('name') == 'description' and m.get('content') for m in page.meta), f'{relative}: missing description')
        require(any(m.get('property') == 'og:image' and m.get('content') == ORIGIN + '/assets/images/paper-social.png' for m in page.meta), f'{relative}: missing social image')
        require(any(l.get('rel') == 'canonical' and l.get('href') == ORIGIN + route for l in page.links), f'{relative}: incorrect canonical')
        if relative != '404.html':
            for lang in ('en','es','x-default'):
                require(any(l.get('hreflang') == lang for l in page.links), f'{relative}: missing {lang} alternate')
        require('paperman' not in text.lower(), f'{relative}: competitor reference')
        require(not re.search(r'ZZTOKEN|ZXQZXQ|ZXC[A-Z0-9]+ZX',text), f'{relative}: translation placeholder')
        require('asciivj.com' not in text and 'utm_source=asciivj' not in text, f'{relative}: donor product destination')
        require(not re.search(r'googletagmanager|google-analytics|static.cloudflareinsights|vercel/analytics',text), f'{relative}: unexpected analytics')
        for asset in page.assets:
            if asset.startswith('/'):
                require((SITE/urlparse(asset).path.lstrip('/')).is_file(), f'{relative}: missing asset {asset}')
            elif not urlparse(asset).scheme:
                require((path.parent/urlparse(asset).path).is_file(), f'{relative}: missing asset {asset}')
        if '/docs/' in route:
            # Navigation is rendered by locale, not hidden after first paint.
            nav = re.search(r'<nav[^>]*id="site-nav"[\s\S]*?</nav>',text)
            require(bool(nav), f'{relative}: missing docs navigation')
            if nav:
                links = re.findall(r'<a\b[^>]*\bhref="([^"]+)"',nav.group())
                require(all(link.startswith('/es/docs/') if expected_lang == 'es' else link.startswith('/docs/') for link in links), f'{relative}: mixed-language navigation')
    for language, prefix in [('en',''),('es','es/')]:
        homepage = (SITE/prefix/'index.html').read_text()
        promise = json.loads((ROOT/f'_data/i18n/{language}.json').read_text())['promise']
        require(promise in homepage, f'{language}: missing free-forever promise')
        require(product['latest_release']['download'] in homepage, f'{language}: download differs from product data')
        require('https://github.com/YellowFoxH4XOR/deckle' in homepage, f'{language}: missing Deckle credit')
        support = (SITE/prefix/'support/index.html').read_text()
        for cadence in ('one_time','monthly'):
            require(f'data-support-cadence="{cadence}"' in support, f'{language}: missing support cadence')
        for url in re.findall(r'href="(https://buy\.stripe\.com/[^"]+)"',support):
            require('test_' not in url, 'Test checkout in public site')
            require(parse_qs(urlparse(url.replace('&amp;','&')).query).get('utm_source') == ['paper'], 'Wrong support attribution')
    require(not (SITE/'docs/maintenance').exists(), 'Internal maintenance docs published')
    require(not (SITE/'scripts').exists(), 'Internal scripts published')
    require(not (SITE/'AGENTS.md').exists(), 'Agent instructions published')
    search = json.loads((SITE/'assets/js/search-data.json').read_text())
    require(all('/maintenance/' not in str(entry.get('url','')) for entry in search.values()), 'Search contains internal maintenance routes')
    require('/maintenance/' not in (SITE/'sitemap.xml').read_text(), 'Sitemap contains internal maintenance routes')
    actual = hashlib.sha256((ROOT/product['app_icon']['path'].lstrip('/')).read_bytes()).hexdigest()
    require(actual == product['app_icon']['sha256'], 'App icon provenance changed')
    asset_paths = [ROOT/'assets/js/site.js',*list((ROOT/'assets/fonts').glob('*.woff2')),*list((ROOT/'assets/textures').glob('*.png'))]
    asset_bytes = sum(path.stat().st_size for path in asset_paths)+(SITE/'index.html').stat().st_size+(ROOT/'assets/images/paper-icon.png').stat().st_size
    require(asset_bytes < 1_000_000, f'Homepage static asset budget exceeded: {asset_bytes}')
    require((ROOT/'assets/js/site.js').stat().st_size < 10_000, 'Homepage JS exceeded 10 KB')
    if errors:
        print('\n'.join('- '+error for error in errors)); return 1
    print(f'Site audit passed: {len(paths)} pages; homepage assets {asset_bytes:,} bytes; release {version}; locales, credits, support, SEO and privacy checked.')
    return 0

if __name__ == '__main__': sys.exit(main())
