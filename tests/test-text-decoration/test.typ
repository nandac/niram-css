/// Verifies that colors returned by `css` can be used in text fill and
/// underline stroke, producing output identical to the equivalent `rgb` literal.

#import "/src/lib.typ": *

#assert.eq(
  text(fill: css("crimson"))[colored text],
  text(fill: rgb("#dc143c"))[colored text],
  message: "The text 'colored text' is not colored crimson."
)

#assert.eq(
  underline(stroke: css("teal"))[important.],
  underline(stroke: rgb("#008080"))[important.],
  message: "This underline is not in the color teal."
)
