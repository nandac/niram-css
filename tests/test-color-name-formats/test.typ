/// Verifies that `css` accepts color names written in all common separator
/// styles and letter-case conventions used across software ecosystems
/// (CSS/SVG, X11, GIMP, Matplotlib, LaTeX xcolor, Python/R, .NET/Java).
/// All variants must resolve to the same color value as the canonical
/// CSS no-separator lowercase form.

#import "/src/lib.typ": *

// --- format coverage on a single color (aliceblue → #f0f8ff) ---
// Every documented input form must resolve to the canonical CSS value.

// no separator, lowercase — CSS/SVG canonical
#assert.eq(
  css("aliceblue"),
  rgb("#f0f8ff"),
  message: "'aliceblue' should resolve to #f0f8ff."
)

// space-separated, lowercase
#assert.eq(
  css("alice blue"),
  rgb("#f0f8ff"),
  message: "'alice blue' should resolve to #f0f8ff."
)

// space-separated, title case
#assert.eq(
  css("Alice Blue"),
  rgb("#f0f8ff"),
  message: "'Alice Blue' should resolve to #f0f8ff."
)

// hyphen-separated, lowercase
#assert.eq(
  css("alice-blue"),
  rgb("#f0f8ff"),
  message: "'alice-blue' should resolve to #f0f8ff."
)

// underscore-separated, lowercase
#assert.eq(
  css("alice_blue"),
  rgb("#f0f8ff"),
  message: "'alice_blue' should resolve to #f0f8ff."
)

// lowerCamelCase
#assert.eq(
  css("aliceBlue"),
  rgb("#f0f8ff"),
  message: "'aliceBlue' should resolve to #f0f8ff."
)

// UpperCamelCase / PascalCase
#assert.eq(
  css("AliceBlue"),
  rgb("#f0f8ff"),
  message: "'AliceBlue' should resolve to #f0f8ff."
)

// SCREAMING_SNAKE_CASE
#assert.eq(
  css("ALICE_BLUE"),
  rgb("#f0f8ff"),
  message: "'ALICE_BLUE' should resolve to #f0f8ff."
)

// all-uppercase, no separator
#assert.eq(
  css("ALICEBLUE"),
  rgb("#f0f8ff"),
  message: "'ALICEBLUE' should resolve to #f0f8ff."
)

// --- three-word color name (darkslategray → #2f4f4f) ---
// Verifies the normalizer handles names with more than two segments.

// mixed: spaces + mixed case
#assert.eq(
  css("Dark Slate Gray"),
  rgb("#2f4f4f"),
  message: "Mixed form 'Dark Slate Gray' should resolve to #2f4f4f."
)

// mixed: hyphens + mixed case
#assert.eq(
  css("Dark-Slate-Gray"),
  rgb("#2f4f4f"),
  message: "Mixed form 'Dark-Slate-Gray' should resolve to #2f4f4f."
)

// mixed: underscores + mixed case
#assert.eq(
  css("Dark_Slate_Gray"),
  rgb("#2f4f4f"),
  message: "Mixed form 'Dark_Slate_Gray' should resolve to #2f4f4f."
)

// --- CSS alias pairs ---
// The CSS spec lists these names as distinct entries that share identical hex values.
// Each pair must resolve to the same color regardless of which name is used.

#assert.eq(css("aqua"),    css("cyan"),    message: "aqua/cyan should be equal")
#assert.eq(css("fuchsia"), css("magenta"), message: "fuchsia/magenta should be equal")

// --- CSS gray/grey spelling pairs ---
// The CSS spec lists both spellings as distinct named colors with equal values.
// Each pair must resolve to the same color regardless of which spelling is used.

#assert.eq(css("gray"),           css("grey"),           message: "gray/grey should be equal")
#assert.eq(css("darkgray"),       css("darkgrey"),       message: "darkgray/darkgrey should be equal")
#assert.eq(css("darkslategray"),  css("darkslategrey"),  message: "darkslategray/darkslategrey should be equal")
#assert.eq(css("dimgray"),        css("dimgrey"),        message: "dimgray/dimgrey should be equal")
#assert.eq(css("lightgray"),      css("lightgrey"),      message: "lightgray/lightgrey should be equal")
#assert.eq(css("lightslategray"), css("lightslategrey"), message: "lightslategray/lightslategrey should be equal")
#assert.eq(css("slategray"),      css("slategrey"),      message: "slategray/slategrey should be equal")
