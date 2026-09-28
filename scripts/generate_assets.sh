#!/bin/sh
# Export real tiles from the exact Paper source, using its retained Deckle renderer.
set -eu
cd "$(dirname "$0")/.."
source_root=${PAPER_SOURCE:-../paper}
mkdir -p .artifacts/asset-export assets/textures assets/images
cat > .artifacts/asset-export/main.swift <<'SWIFT'
import AppKit
let output = URL(fileURLWithPath: CommandLine.arguments[1])
for id in ["classic-matte", "book-cream", "rice-paper"] {
    let image = TextureRenderer.compositeTile(for: TexturePreset.preset(id: id), backingScale: 1)
    let rep = NSBitmapImageRep(data: image.tiffRepresentation!)!
    try rep.representation(using: .png, properties: [:])!.write(to: output.appendingPathComponent("\(id).png"))
}
SWIFT
swiftc "$source_root/Sources/Paper/Vendor/Deckle/TexturePreset.swift" "$source_root/Sources/Paper/Vendor/Deckle/TextureRenderer.swift" .artifacts/asset-export/main.swift -O -o .artifacts/asset-export/export
.artifacts/asset-export/export assets/textures
swift "$source_root/script/generate_icon.swift" .artifacts/asset-export
cp .artifacts/asset-export/Paper.iconset/icon_256x256@2x.png assets/images/paper-icon.png
swift scripts/generate_social.swift assets/images/paper-social.png
