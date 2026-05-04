/// Verifies that colors returned by `css` can be used as fill values on
/// Typst shapes (rect, box, polygon), producing output identical to the
/// equivalent `rgb` literal.

#import "/src/lib.typ": *

#assert.eq(
  rect(width: 100%, height: auto, fill: css("darkorchid")),
  rect(width: 100%, height: auto, fill: rgb("#9932cc")),
  message: "This rectangle is not filled with the color darkorchid."
)

#assert.eq(
  box(width: 30mm, height: 1em, fill: css("saddlebrown")),
  box(width: 30mm, height: 1em, fill: rgb("#8b4513")),
  message: "This box is not filled with the color saddlebrown."
)

#assert.eq(
  polygon.regular(
    fill: css("darkgoldenrod").lighten(60%), stroke: (paint: css("darkgoldenrod"), thickness: 4pt, cap: "round"), size: 20mm, vertices: 6,
  ),
  polygon.regular(
    fill: rgb("#b8860b").lighten(60%), stroke: (paint: rgb("#b8860b"), thickness: 4pt, cap: "round"), size: 20mm, vertices: 6,
  ),
  message: "This polygon is not filled with the color darkgoldenrod."
)
