import importlib.util
import json
import subprocess
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def ruby(expression, *args):
    return subprocess.check_output(['ruby','-rjson','-r'+str(ROOT/'scripts/sync_paper_docs.rb'),'-e',expression,*args],text=True).strip()

spec=importlib.util.spec_from_file_location('spanish',ROOT/'scripts/build_spanish_docs.py')
spanish=importlib.util.module_from_spec(spec);spec.loader.exec_module(spanish)

class ImportContract(unittest.TestCase):
    def test_mixed_changelog_headings_ignore_unreleased(self):
        text='## Unreleased\nfuture\n## 1.0.3 - 2026-09-25\ncurrent\n## [1.0.1] - 2026-09-25\nold'
        self.assertEqual(json.loads(ruby('puts JSON.generate(SyncPaperDocs.released_version(ARGV[0]))',text)),['1.0.3','2026-09-25'])
        self.assertEqual(json.loads(ruby('puts JSON.generate(SyncPaperDocs.released_version(ARGV[0]))','## [2.0.0] - 2026-10-01')),['2.0.0','2026-10-01'])
    def test_relative_links_use_local_routes_or_pinned_sources(self):
        value=ruby('puts SyncPaperDocs.rewrite_links(ARGV[0], "docs/a.md", {"docs/b.md"=>{url:"/docs/b/",partial:false}}, "https://source/commit/")','[B](b.md#anchor) [code](../Sources/Paper.swift) [external](https://example.org/)')
        self.assertIn('[B](/docs/b/#anchor)',value)
        self.assertIn('https://source/commit/Sources/Paper.swift',value)
        self.assertIn('https://example.org/',value)
    def test_partial_import_fragment_remains_upstream(self):
        value=ruby('puts SyncPaperDocs.rewrite_links(ARGV[0], "README.md", {"docs/testing.md"=>{url:"/docs/testing/",partial:true}}, "https://source/commit/")','[Old](docs/testing.md#historical)')
        self.assertEqual(value,'[Old](https://source/commit/docs/testing.md#historical)')
    def test_front_matter_supports_quoted_titles(self):
        front,body=spanish.load_front_matter('---\ntitle: "Recipes: imports"\nnav_order: 2\ngenerated: true\n---\n# Example\n')
        self.assertEqual(front['title'],'Recipes: imports');self.assertTrue(front['generated']);self.assertIn('# Example',body)
    def test_translated_headings_keep_english_anchor(self):
        value=spanish.preserve_heading_links('# Import recipes\n\n## Next steps\n','# Importar recetas\n\n## Próximos pasos\n')
        self.assertIn('id="import-recipes"',value);self.assertIn('id="next-steps"',value)
    def test_code_and_urls_survive_protection(self):
        text='Run `swift test` in Paper; see [Deckle](https://github.com/YellowFoxH4XOR/deckle).'
        protected,tokens=spanish.protect_text(text)
        self.assertEqual(spanish.restore_text(protected,tokens),text)
    def test_localized_links_do_not_change_assets(self):
        self.assertEqual(spanish.rewrite_docs_links('[Guide](/guide/) [Docs](/docs/a/) [File](/assets/a.json)'), '[Guide](/es/guide/) [Docs](/es/docs/a/) [File](/assets/a.json)')

if __name__ == '__main__': unittest.main()
