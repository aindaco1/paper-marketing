import AppKit
let width = 1200, height = 630
let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: width, pixelsHigh: height, bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .deviceRGB, bytesPerRow: 0, bitsPerPixel: 0)!
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: rep)
let ink = NSColor(srgbRed: 0.14, green: 0.24, blue: 0.19, alpha: 1)
NSColor(srgbRed: 0.96, green: 0.95, blue: 0.91, alpha: 1).setFill()
NSRect(x: 0, y: 0, width: width, height: height).fill()
func text(_ value: String, _ x: Double, _ y: Double, _ w: Double, _ h: Double, _ size: Double, serif: Bool = false) {
    let font = serif ? NSFont(name:"Georgia", size:size)! : NSFont.monospacedSystemFont(ofSize:size, weight:.regular)
    (value as NSString).draw(in:NSRect(x:x,y:y,width:w,height:h),withAttributes:[.font:font,.foregroundColor:ink])
}
ink.setStroke()
let frame = NSBezierPath(rect:NSRect(x:55,y:55,width:1090,height:520));frame.lineWidth=1.5;frame.stroke()
NSColor(srgbRed:0.86,green:0.89,blue:0.79,alpha:1).setFill()
NSRect(x:56,y:521,width:1088,height:53).fill()
text("Paper / a small, free Mac app",77,533,900,32,18)
text("A little paper for your\nvery expensive rectangle.",90,222,1020,240,67,serif:true)
text("Free and open source. Always.",93,145,900,40,23)
text("paper-app.xyz",93,86,420,28,18)
text("Built with Deckle",815,86,290,28,18)
NSGraphicsContext.restoreGraphicsState()
try rep.representation(using:.png,properties:[:])!.write(to:URL(fileURLWithPath:CommandLine.arguments[1]))
