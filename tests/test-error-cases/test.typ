/// Verifies that `css` panics with a descriptive message when given a
/// color name that does not exist in the CSS named-color table, and that
/// the message always contains the original input — not the normalized form.

#import "/src/lib.typ": *

// already-normalized invalid name
#assert.eq(
  catch(() => css("invalidcolor")),
  "panicked with: \"error: invalid CSS color name: invalidcolor\""
)

// un-normalized invalid name: message must echo the original input, not "notacolor"
#assert.eq(
  catch(() => css("Not A Color")),
  "panicked with: \"error: invalid CSS color name: Not A Color\""
)

// empty input: produces a dedicated message instead of a dangling colon
#assert.eq(
  catch(() => css("")),
  "panicked with: \"error: CSS color name cannot be empty\""
)
