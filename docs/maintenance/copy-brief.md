# Paper copy brief

Confirmed by the user on 2026-09-27. This is the editorial source for the marketing site and public documentation. Examples below are draft voice samples, not published copy.

## The message

**Paper is free and open source, and it always will be.** Treat this as the maintainer's explicit product commitment. Keep it prominent beside the download, explain it briefly in the FAQ, and repeat it where optional support is offered. Avoid weaker language such as “free for now,” “free to get started,” or “free tier.”

Explain what the app does immediately: Paper adds a paper-texture overlay to an Apple Silicon Mac. Use concrete features and a useful preview to carry the rest of the pitch.

Credit Deckle openly and specifically. Its renderer, preset catalog, and recipe-model foundation are substantial parts of Paper. The contribution deserves visible thanks as well as retained technical attribution.

Keep the user's competitive motivation as background context. Public copy must not name competitors, quote their prices, hint at a particular developer, or make claims about another product's ancestry. Express Paper's own choices positively. Do not copy another site's slogans or turn the page into an argument about charging for software.

## Voice

Use the user's direct, practical language as the anchor, with the requested jovial humor. Existing Dust Wave product copy supplies context for clarity, not proof that every phrase is the user's own writing. Match through concrete drafts and feedback; do not claim that a style checklist fully captures a person's voice.

| Principle | Write like this | Avoid |
| --- | --- | --- |
| Plain and direct | “Pick a texture and adjust the intensity.” | “Curate your bespoke digital environment.” |
| Cheerful, mildly irreverent | “A little paper for your very expensive rectangle.” | A punchline in every paragraph or exaggerated internet slang |
| Specific | “Pause Paper before sharing your screen.” | Vague reassurance that everything is handled |
| Generous about shared work | “Paper uses Deckle's texture renderer and paper catalog.” | Passing reused work off as a wholly original invention |
| Economical | “Free and open source. Always.” | Repeating the pricing promise in every feature description |

Humor should come from the small absurdity of putting paper on a computer and the maker's affection for the thing. Let it be a little silly. Keep the actual download label, requirements, settings names, and instructions unambiguous. Contractions and varied sentence lengths should follow natural speech, not a quota.

Marketing can be playful. Help and developer docs should sound like a knowledgeable person saving the reader time. Privacy, security, licensing, and error guidance stay precise; jokes must not obscure a limitation or instruction.

## Writing and editing workflow

1. Apply `brand-voice-manager` to keep the voice and context-specific tone consistent. Use this brief instead of creating another competing voice guide.
2. Apply `copywriter` to produce concise, concrete options for the main headline and CTA. Choose a clear direction before drafting every section.
3. Apply `humanizer` after the factual draft. For marketing, remove generic sales language, repetitive rhythms, overexplaining, and forced jokes. For docs, preserve commands, URLs, code, facts, and technical names.
4. Use `anti-machine-writing-editorial-pass` only if a longer maker/about passage needs it. It is not a reason to turn short product copy into an essay.
5. Make at most two editorial passes, then read the copy aloud mentally and in its actual page layout. Keep the sentences that already work. Leave room for the user's own prose edits.
6. For Spanish, preserve the strength of the free-forever promise and rewrite jokes naturally. Keep UI names recognizable and preserve technical tokens. A literal translation that kills the joke should become a simpler, warmer sentence.

No detector score is part of acceptance. The work should sound natural, express the user's choices, and remain factually accurate.

## Draft voice samples

Headline directions, in preference order:

1. **A little paper for your very expensive rectangle.** Preferred: a friendly joke with a concrete product explanation immediately underneath.
2. **Give your Mac a paper habit.** Shorter and playful, but needs the subheading to make the effect clear.
3. **Paper textures for your Mac. Free forever.** Most literal; useful when the visual carries the personality.

Suggested hero pairing:

> A little paper for your very expensive rectangle.
>
> Paper adds a paper texture to your Mac. Pick one you like, adjust it, and get on with whatever you opened the computer to do.
>
> **Free and open source. Always.**

CTA: **Download Paper**. Secondary link: **Have a look at the code**. Keep the Apple Silicon/macOS requirement adjacent.

FAQ answer:

> Paper is free and open source, and it always will be. Download it, use it, tinker with it. That's the whole arrangement.

Deckle acknowledgement:

> A big thank-you to [Deckle](https://github.com/YellowFoxH4XOR/deckle) and its contributors. Paper uses Deckle's texture renderer and paper catalog, and adapts its recipe model for imports. They made the paper part of Paper possible.

Optional support copy, only if that page is included:

> If you'd like to support Dust Wave, thank you. Donations are optional. Everyone gets the same free app.

## Deckle attribution contract

Use the verified sources in `paper/THIRD_PARTY_NOTICES.md`, `paper/docs/vendor-sources.json`, and `paper/Licenses/Deckle-MIT.txt`.

- Homepage: a visible linked acknowledgement explaining what Paper uses, in the open-source section.
- Footer: a concise persistent “Built with Deckle” link, alongside the source and full credits links.
- Developer docs: `/docs/reference/credits/` explains the renderer and presets retained unchanged, the `CustomPaper` model/conversion adapted from `PaperMill`, and the tiled-layer approach. Reference the recorded upstream commit and file manifest. Also retain credit for the other actual dependencies.
- License material: preserve “Copyright (c) 2026 Deckle contributors” and the full upstream MIT license text. Link to the upstream project and the retained license. Credit prose supplements these notices.
- Source map: record Deckle revision `cb4eb09dc117bb046c3ca83b782c5a9ed53dfd91` as the inspected pin; refresh from the app's manifest during implementation rather than maintaining another hand-edited pin.
- Relationship: describe Paper as an independent app built using Deckle components. Do not imply upstream endorsement or that “inspiration” is the extent of the code reuse.

Keep canonical product/dependency data in the planned `_data/product.yml` and translated public strings in the existing locale data. Reuse the same credit include across locales. There is no need for a new attribution service or framework.

## Copy acceptance

The homepage must make the free-forever promise visible without hunting through the FAQ. The download must remain free regardless of donations. Deckle's role must be clear from the public site, with complete technical credit one link away. Public rendered text and metadata must contain no competitor references or pricing comparisons; upstream research remains source background.

Review the whole page for repetitive jokes, slogan chains, generic “elevate/transform/unlock” language, and unsupported health, energy, or capture claims. Give the source facts and copyright text a final check after humanization and translation.
