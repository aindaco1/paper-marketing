#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
python3 -m unittest discover -s scripts -p 'test_*.py'
JEKYLL_ENV=production bundle exec jekyll build --trace
python3 scripts/audit_links.py
python3 scripts/audit_site.py
git diff --check
