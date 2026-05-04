/// Verifies that `css` accepts color names written in all common separator
/// styles and letter-case conventions used across software ecosystems
/// (CSS/SVG, X11, GIMP, Matplotlib, LaTeX xcolor, Python/R, .NET/Java).
/// All variants must resolve to the same color value as the canonical
/// CSS no-separator lowercase form.

#import "/src/lib.typ": *

// --- case insensitivity ---

// all-lowercase
#assert.eq(
  css("aliceblue"),
  rgb("#f0f8ff"),
  message: "Lowercase 'aliceblue' should resolve to #f0f8ff."
)

// mixed case
#assert.eq(
  css("AliceBlue"),
  rgb("#f0f8ff"),
  message: "Mixed-case 'AliceBlue' should resolve to #f0f8ff."
)

// --- separator styles ---

// no separator — CSS/SVG canonical form
#assert.eq(
  css("cornflowerblue"),
  rgb("#6495ed"),
  message: "No-separator form 'cornflowerblue' should resolve to #6495ed."
)

// spaces — X11 / GIMP / Matplotlib
#assert.eq(
  css("cornflower blue"),
  rgb("#6495ed"),
  message: "Space-separated form 'cornflower blue' should resolve to #6495ed."
)

// hyphens — CSS tooling / LaTeX xcolor
#assert.eq(
  css("cornflower-blue"),
  rgb("#6495ed"),
  message: "Hyphen-separated form 'cornflower-blue' should resolve to #6495ed."
)

// underscores — X11 alternate / Python / R
#assert.eq(
  css("cornflower_blue"),
  rgb("#6495ed"),
  message: "Underscore-separated form 'cornflower_blue' should resolve to #6495ed."
)

// CamelCase — X11 / .NET / Java
#assert.eq(
  css("CornflowerBlue"),
  rgb("#6495ed"),
  message: "CamelCase form 'CornflowerBlue' should resolve to #6495ed."
)

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
