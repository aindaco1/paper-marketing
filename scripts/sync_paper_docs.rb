#!/usr/bin/env ruby
# frozen_string_literal: true
# Adapted from ASCII VJ Remix's source importer. Technical sources stay in Paper.
require 'yaml'
require 'json'
require 'pathname'
require 'open3'
require 'digest'
require 'fileutils'

module SyncPaperDocs
  ROOT = Pathname(__dir__).join('..').expand_path
  module_function

  def released_version(markdown)
    match = markdown.match(/^##\s+\[?(\d+\.\d+\.\d+)\]?\s+-\s+(\d{4}-\d{2}-\d{2})\s*$/)
    raise 'No dated release found in CHANGELOG.md' unless match
    [match[1], match[2]]
  end

  def rewrite_links(markdown, source, routes, base)
    markdown.gsub(/(?<!!)\[([^\]]+)\]\(([^)\s]+)\)/) do
      label, target = Regexp.last_match.captures
      next Regexp.last_match[0] if target.match?(%r{\A(?:[a-z]+:|/|#)})
      path, fragment = target.split('#', 2)
      resolved = Pathname(source).dirname.join(path).cleanpath.to_s
      # Fragment links to partial imports stay upstream, where the full section exists.
      destination = routes[resolved]
      destination = nil if fragment && destination && destination[:partial]
      url = destination ? destination[:url] : "#{base}#{resolved}"
      "[#{label}](#{url}#{fragment ? "##{fragment}" : ''})"
    end
  end

  def page(data, body)
    "#{YAML.dump(data)}---\n\n#{body.strip}\n"
  end

  def run
    source = Pathname(ENV.fetch('PAPER_SOURCE', ROOT.join('../paper').to_s)).expand_path
    ref = ENV.fetch('PAPER_SOURCE_REF', 'HEAD')
    commit, status = Open3.capture2('git', '-C', source.to_s, 'rev-parse', "#{ref}^{commit}")
    raise 'Paper source ref is not a committed Git revision' unless status.success?
    commit = commit.strip
    base = "https://github.com/aindaco1/paper/blob/#{commit}/"
    read = lambda do |path|
      value, err, result = Open3.capture3('git', '-C', source.to_s, 'show', "#{commit}:#{path}")
      raise "Missing source #{path}: #{err.strip}" unless result.success?
      value
    end
    definitions = YAML.load_file(ROOT.join('_data/doc_sources.yml'))
    routes = definitions.to_h do |entry|
      url = entry['route'] || '/' + entry['path'].sub(/\.md$/, '/')
      [entry['source'], {url: url, partial: !!entry['before']}]
    end
    output = {}
    source_hashes = {}
    definitions.each do |entry|
      original = read.call(entry['source'])
      source_hashes[entry['source']] = Digest::SHA256.hexdigest(original)
      if entry['before'] && !original.include?(entry['before'])
        raise "Missing excerpt boundary in #{entry['source']}"
      end
      body = entry['before'] ? original.split(entry['before'], 2).first : original
      raise "Empty source #{entry['source']}" if body.strip.empty?
      body = rewrite_links(body, entry['source'], routes, base)
      if entry['path'] == 'privacy.md'
        body += "\n## This website\n\nThe Paper website is a static site hosted by GitHub Pages, with DNS managed by Cloudflare. It has no analytics scripts, advertising, sign-in, or marketing cookies. Hosting providers receive ordinary connection metadata. Documentation search runs in your browser. The texture preview does not save settings or upload anything.\n\nOptional support links open Stripe's hosted checkout. Payments and any recurring support are handled by Stripe, not this site. GitHub hosts app downloads and source code. [GitHub privacy](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement), [Cloudflare privacy](https://www.cloudflare.com/privacypolicy/), and [Stripe privacy](https://stripe.com/privacy).\n"
      end
      body += "\n## Source material\n\nThis page follows Paper source at [`#{commit[0,7]}`](https://github.com/aindaco1/paper/tree/#{commit}). [#{entry['source']}](#{base}#{entry['source']}) is its maintained source. Website service details, where present, are maintained here.\n"
      data = {'title'=>entry['title'], 'description'=>"#{entry['title']} for Paper, the free and open-source macOS paper-texture app.", 'lang'=>'en', 'source_commit'=>commit, 'generated'=>true}
      if entry['route']
        data.merge!('layout'=>'page', 'permalink'=>entry['route'], 'nav_exclude'=>true)
      else
        data.merge!('parent'=>entry['parent'], 'nav_order'=>entry['order'])
      end
      output[entry['path']] = page(data, body)
    end
    product = YAML.load_file(ROOT.join('_data/product.yml'))
    version, = released_version(read.call('CHANGELOG.md'))
    raise 'Source release differs from verified product data; verify GitHub assets before updating product.yml' unless version == product.fetch('latest_release').fetch('version')
    manifest = JSON.parse(read.call('docs/vendor-sources.json'))
    deckle = manifest.find { |entry| entry['repository'].include?('/deckle') }
    product['docs_source_commit'] = commit
    product['deckle']['commit'] = deckle.fetch('commit')
    icon = ROOT.join(product['app_icon']['path'].sub(%r{^/}, ''))
    product['app_icon']['sha256'] = Digest::SHA256.file(icon).hexdigest
    groups = {'Development'=>1,'Operations'=>2,'Reference'=>3}
    groups.each do |title, order|
      slug = title.downcase
      body = "# #{title}\n\n"
      body += definitions.select { |entry| entry['parent']==title }.map { |entry| "- [#{entry['title']}](/#{entry['path'].sub(/\.md$/, '/')})" }.join("\n")
      if title == 'Reference'
        body += "\n- [Credits and licenses](/docs/reference/credits/)\n- [Source map](/docs/reference/source-map/)"
      end
      output["docs/#{slug}/index.md"] = page({'title'=>title,'lang'=>'en','description'=>"#{title} documentation for Paper.",'nav_order'=>order,'has_children'=>true,'generated'=>true}, body)
    end
    output['docs/index.md'] = page({'title'=>'Developer docs','lang'=>'en','description'=>'Build, understand and contribute to Paper. Source-derived developer documentation with clear release and testing boundaries.','nav_order'=>0,'generated'=>true}, <<~MD)
      # Small app. Open notebook.

      Paper is a free, open-source texture overlay for Apple Silicon Macs. These guides cover the code, recipes, testing and releases. If you just want to use the app, start with the [user guide](/guide/).

      - [Build Paper](/docs/development/quickstart/) — requirements and contribution checks.
      - [Understand the architecture](/docs/development/architecture/) — policy, state and native adapters.
      - [Make a recipe](/docs/development/recipes/) — Deckle-compatible imports and library backups.
      - [Test a change](/docs/operations/testing/) — automated evidence and real-device limits.
      - [Package a release](/docs/operations/releasing/) — signing, updates and validation.
      - [Meet the upstream projects](/docs/reference/credits/) — starting with Deckle.

      ## Source and release

      The downloadable app is **Paper #{version}**. These docs follow source commit [`#{commit[0,7]}`](https://github.com/aindaco1/paper/tree/#{commit}), including documentation changes after that release. A source change is not automatically a shipped app feature. See the [source map](/docs/reference/source-map/) and [changelog](/docs/reference/changelog/).
    MD
    rows = source_hashes.map { |path, hash| "| [#{path}](#{base}#{path}) | `#{hash[0,12]}` |" }.join("\n")
    output['docs/reference/source-map.md'] = page({'title'=>'Source map','lang'=>'en','description'=>'The exact Paper sources behind the public documentation.','parent'=>'Reference','nav_order'=>3,'generated'=>true}, <<~MD)
      # Follow the paper trail

      Technical behavior is maintained in the [Paper repository](https://github.com/aindaco1/paper). The website imports selected guides from commit [`#{commit}`](https://github.com/aindaco1/paper/tree/#{commit}). Marketing copy and presentation are maintained in [paper-marketing](https://github.com/aindaco1/paper-marketing).

      | Source | SHA-256 prefix |
      | --- | --- |
      #{rows}

      Testing documentation includes the current guidance. Historical reports remain linked at their original source. Credits use the retained notices and vendor manifest. The website's privacy section describes its own hosting and optional payment links.

      The download remains tied to the verified published release, **#{version}**. Source documentation can advance independently. Internal website maintenance notes are not part of these public guides.
    MD
    output['docs/reference/credits.md'] = page({'title'=>'Credits and licenses','lang'=>'en','description'=>'Paper is built with Deckle. Exact attribution, upstream sources and licenses.','parent'=>'Reference','nav_order'=>2,'generated'=>true}, <<~MD)
      # Good work deserves its name on it.

      Paper is free and open source, and it always will be. A big part of making it possible was work other people had already shared.

      ## Deckle

      [Deckle and its contributors](https://github.com/YellowFoxH4XOR/deckle) built the texture renderer and paper catalog used by Paper. Paper retains `TextureRenderer.swift` and `TexturePreset.swift` unchanged at revision [`#{deckle['commit']}`](https://github.com/YellowFoxH4XOR/deckle/tree/#{deckle['commit']}). Its `CustomPaper.swift` is the model/conversion portion extracted from Deckle's `PaperMill.swift`. Overlay drawing follows Deckle's tiled-layer approach.

      All 26 built-in textures come from that pinned catalog. The samples on this website are exported from that same renderer. This is code reuse, not just visual inspiration. Thank you to everyone who made it available.

      Copyright (c) 2026 Deckle contributors. [Read the complete MIT license](/assets/licenses/Deckle-MIT.txt). Exact file hashes and source paths live in [Paper's vendor manifest](#{base}docs/vendor-sources.json).

      Paper is an independent application; upstream credit does not imply endorsement.

      ## Other shoulders

      - [Record](https://github.com/aindaco1/record) supplies the login adapter and informs shortcuts and display placement. Its retained copyright is Copyright (c) 2026 Andrew Jones, under MIT.
      - [Dust Wave Platform](https://github.com/aindaco1/dust-wave-platform) supplies pinned tooling and the separate native updates/diagnostics package. Its retained upstream notices are included with the app.
      - [Sparkle](https://sparkle-project.org/) supplies signed application updates; its license ships with Paper.
      - OwlSwitch-derived display fixtures are separate GPL-3.0 development/test tooling. They are not shipped inside Paper.app.

      [Paper's complete third-party notices](#{base}THIRD_PARTY_NOTICES.md) retain dependency licenses and provenance.

      ## This website

      The site adapts the Jekyll and Just the Docs structure of [ASCII VJ Remix's website](https://github.com/aindaco1/ascii-vj-remix-marketing). Its window styling takes a cue from the supplied WEBSITES WEBSITES WEBSITES! design reference; its exhibition artwork is not used here.

      [IBM Plex Mono](https://github.com/IBM/plex) is used under the [SIL Open Font License](/assets/licenses/IBM-Plex-OFL.txt). The app icon is generated by Paper's own icon script. [Website source](https://github.com/aindaco1/paper-marketing).
    MD
    # Resolve everything before writing, so a missing source cannot leave half a refresh.
    output.each { |path, body| target=ROOT.join(path); target.dirname.mkpath; target.write(body) }
    ROOT.join('_data/product.yml').write(YAML.dump(product))
    ROOT.join('_data/docs_provenance.json').write(JSON.pretty_generate({source_commit:commit,files:source_hashes,outputs:output.keys})+"\n")
    puts "Imported #{output.size} pages from Paper #{commit[0,7]}; release #{version}."
  end
end
SyncPaperDocs.run if $PROGRAM_NAME == __FILE__
