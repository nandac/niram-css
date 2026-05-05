#import "@preview/niram-css:0.2.0": *

#set page(width: 200pt, height: 200pt, margin: 0pt, fill: none)

#let outer-colors = (
  "red", "tomato", "darkorange", "orange", "gold", "yellow",
  "chartreuse", "lawngreen", "lime", "springgreen", "teal", "turquoise",
  "deepskyblue", "dodgerblue", "cornflowerblue", "royalblue",
  "blue", "blueviolet", "darkviolet", "purple",
  "mediumorchid", "orchid", "hotpink", "deeppink",
)

#let inner-colors = (
  "tomato", "orange", "yellow", "lawngreen",
  "springgreen", "turquoise", "dodgerblue", "royalblue",
  "darkviolet", "purple", "orchid", "deeppink",
)

#let cx = 100pt
#let cy = 100pt

// outer ring: 24 dots
#{
  let n = outer-colors.len()
  let ring-r = 78pt
  let dot-r = 9pt
  for i in range(n) {
    let angle = i * 360deg / n - 90deg
    let x = cx + ring-r * calc.cos(angle) - dot-r
    let y = cy + ring-r * calc.sin(angle) - dot-r
    place(top + left, dx: x, dy: y,
      circle(radius: dot-r, fill: css(outer-colors.at(i)), stroke: none)
    )
  }
}

// inner ring: 12 dots
#{
  let n = inner-colors.len()
  let ring-r = 45pt
  let dot-r = 7pt
  for i in range(n) {
    let angle = i * 360deg / n - 90deg
    let x = cx + ring-r * calc.cos(angle) - dot-r
    let y = cy + ring-r * calc.sin(angle) - dot-r
    place(top + left, dx: x, dy: y,
      circle(radius: dot-r, fill: css(inner-colors.at(i)), stroke: none)
    )
  }
}
