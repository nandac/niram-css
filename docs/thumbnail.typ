#import "@preview/niram-css:0.2.0": *

#set page(height: auto, margin: 5mm, fill: none)

// style thumbnail for light and dark theme
#let theme = sys.inputs.at("theme", default: "light")
#set text(white) if theme == "dark"

#set text(22pt)
#align(center)[Normal text may be #text(fill: css("crimson"))[colored so.]]
