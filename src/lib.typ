/// Mapping of the 147 standardized CSS named colors to their canonical
/// `rgb` values, as defined in the
/// #link("https://www.w3.org/TR/css-color-3/#svg-color")[CSS Color Module Level 3]
/// specification. Keys are stored in the canonical CSS form — lowercase with
/// no separators (e.g. `cornflowerblue`, not `cornflower-blue`).
///
/// Prefer `css` for lookups, which accepts names in any common naming
/// convention. Direct dictionary access requires the canonical form.
///
/// -> dictionary
#let css-colors = (
  aliceblue: rgb("#f0f8ff"),
  antiquewhite: rgb("#faebd7"),
  aqua: rgb("#00ffff"),
  aquamarine: rgb("#7fffd4"),
  azure: rgb("#f0ffff"),
  beige: rgb("#f5f5dc"),
  bisque: rgb("#ffe4c4"),
  black: rgb("#000000"),
  blanchedalmond: rgb("#ffebcd"),
  blue: rgb("#0000ff"),
  blueviolet: rgb("#8a2be2"),
  brown: rgb("#a52a2a"),
  burlywood: rgb("#deb887"),
  cadetblue: rgb("#5f9ea0"),
  chartreuse: rgb("#7fff00"),
  chocolate: rgb("#d2691e"),
  coral: rgb("#ff7f50"),
  cornflowerblue: rgb("#6495ed"),
  cornsilk: rgb("#fff8dc"),
  crimson: rgb("#dc143c"),
  cyan: rgb("#00ffff"),
  darkblue: rgb("#00008b"),
  darkcyan: rgb("#008b8b"),
  darkgoldenrod: rgb("#b8860b"),
  darkgray: rgb("#a9a9a9"),
  darkgreen: rgb("#006400"),
  darkgrey: rgb("#a9a9a9"),
  darkkhaki: rgb("#bdb76b"),
  darkmagenta: rgb("#8b008b"),
  darkolivegreen: rgb("#556b2f"),
  darkorange: rgb("#ff8c00"),
  darkorchid: rgb("#9932cc"),
  darkred: rgb("#8b0000"),
  darksalmon: rgb("#e9967a"),
  darkseagreen: rgb("#8fbc8f"),
  darkslateblue: rgb("#483d8b"),
  darkslategray: rgb("#2f4f4f"),
  darkslategrey: rgb("#2f4f4f"),
  darkturquoise: rgb("#00ced1"),
  darkviolet: rgb("#9400d3"),
  deeppink: rgb("#ff1493"),
  deepskyblue: rgb("#00bfff"),
  dimgray: rgb("#696969"),
  dimgrey: rgb("#696969"),
  dodgerblue: rgb("#1e90ff"),
  firebrick: rgb("#b22222"),
  floralwhite: rgb("#fffaf0"),
  forestgreen: rgb("#228b22"),
  fuchsia: rgb("#ff00ff"),
  gainsboro: rgb("#dcdcdc"),
  ghostwhite: rgb("#f8f8ff"),
  gold: rgb("#ffd700"),
  goldenrod: rgb("#daa520"),
  gray: rgb("#808080"),
  green: rgb("#008000"),
  greenyellow: rgb("#adff2f"),
  grey: rgb("#808080"),
  honeydew: rgb("#f0fff0"),
  hotpink: rgb("#ff69b4"),
  indianred: rgb("#cd5c5c"),
  indigo: rgb("#4b0082"),
  ivory: rgb("#fffff0"),
  khaki: rgb("#f0e68c"),
  lavender: rgb("#e6e6fa"),
  lavenderblush: rgb("#fff0f5"),
  lawngreen: rgb("#7cfc00"),
  lemonchiffon: rgb("#fffacd"),
  lightblue: rgb("#add8e6"),
  lightcoral: rgb("#f08080"),
  lightcyan: rgb("#e0ffff"),
  lightgoldenrodyellow: rgb("#fafad2"),
  lightgray: rgb("#d3d3d3"),
  lightgreen: rgb("#90ee90"),
  lightgrey: rgb("#d3d3d3"),
  lightpink: rgb("#ffb6c1"),
  lightsalmon: rgb("#ffa07a"),
  lightseagreen: rgb("#20b2aa"),
  lightskyblue: rgb("#87cefa"),
  lightslategray: rgb("#778899"),
  lightslategrey: rgb("#778899"),
  lightsteelblue: rgb("#b0c4de"),
  lightyellow: rgb("#ffffe0"),
  lime: rgb("#00ff00"),
  limegreen: rgb("#32cd32"),
  linen: rgb("#faf0e6"),
  magenta: rgb("#ff00ff"),
  maroon: rgb("#800000"),
  mediumaquamarine: rgb("#66cdaa"),
  mediumblue: rgb("#0000cd"),
  mediumorchid: rgb("#ba55d3"),
  mediumpurple: rgb("#9370db"),
  mediumseagreen: rgb("#3cb371"),
  mediumslateblue: rgb("#7b68ee"),
  mediumspringgreen: rgb("#00fa9a"),
  mediumturquoise: rgb("#48d1cc"),
  mediumvioletred: rgb("#c71585"),
  midnightblue: rgb("#191970"),
  mintcream: rgb("#f5fffa"),
  mistyrose: rgb("#ffe4e1"),
  moccasin: rgb("#ffe4b5"),
  navajowhite: rgb("#ffdead"),
  navy: rgb("#000080"),
  oldlace: rgb("#fdf5e6"),
  olive: rgb("#808000"),
  olivedrab: rgb("#6b8e23"),
  orange: rgb("#ffa500"),
  orangered: rgb("#ff4500"),
  orchid: rgb("#da70d6"),
  palegoldenrod: rgb("#eee8aa"),
  palegreen: rgb("#98fb98"),
  paleturquoise: rgb("#afeeee"),
  palevioletred: rgb("#db7093"),
  papayawhip: rgb("#ffefd5"),
  peachpuff: rgb("#ffdab9"),
  peru: rgb("#cd853f"),
  pink: rgb("#ffc0cb"),
  plum: rgb("#dda0dd"),
  powderblue: rgb("#b0e0e6"),
  purple: rgb("#800080"),
  red: rgb("#ff0000"),
  rosybrown: rgb("#bc8f8f"),
  royalblue: rgb("#4169e1"),
  saddlebrown: rgb("#8b4513"),
  salmon: rgb("#fa8072"),
  sandybrown: rgb("#f4a460"),
  seagreen: rgb("#2e8b57"),
  seashell: rgb("#fff5ee"),
  sienna: rgb("#a0522d"),
  silver: rgb("#c0c0c0"),
  skyblue: rgb("#87ceeb"),
  slateblue: rgb("#6a5acd"),
  slategray: rgb("#708090"),
  slategrey: rgb("#708090"),
  snow: rgb("#fffafa"),
  springgreen: rgb("#00ff7f"),
  steelblue: rgb("#4682b4"),
  tan: rgb("#d2b48c"),
  teal: rgb("#008080"),
  thistle: rgb("#d8bfd8"),
  tomato: rgb("#ff6347"),
  turquoise: rgb("#40e0d0"),
  violet: rgb("#ee82ee"),
  wheat: rgb("#f5deb3"),
  white: rgb("#ffffff"),
  whitesmoke: rgb("#f5f5f5"),
  yellow: rgb("#ffff00"),
  yellowgreen: rgb("#9acd32"),
)

/// Resolves a CSS color name to its Typst `color` value.
///
/// The input is normalized (lowercased, with all spaces, hyphens, and
/// underscores stripped) before lookup, so every common naming convention
/// resolves to the same color. For example, all of the inputs below
/// resolve to `rgb("#6495ed")`:
///
/// - `cornflowerblue` — CSS / SVG canonical
/// - `cornflower blue` — X11 / GIMP
/// - `Cornflower Blue` — UI Labels / Figma
/// - `cornflower-blue` — SASS / Less / Tailwind
/// - `cornflower_blue` — Python / R
/// - `cornflowerBlue` — JavaScript / JSON / Swift
/// - `CornflowerBlue` — X11 / .NET / LaTeX xcolor
/// - `CORNFLOWER_BLUE` — Bash / C constants
/// - `CORNFLOWERBLUE` — JavaFX
///
/// Panics with `"error: CSS color name cannot be empty"` when `color-name`
/// is the empty string. Panics with `"error: invalid CSS color name: <input>"`
/// (echoing the original input) when the normalized name is not one of the
/// 147 CSS named colors.
///
/// *Example:*
/// ```typ
/// #import "@preview/niram-css:0.2.0": *
///
/// #rect(width: 100%, height: 1em, fill: css("crimson"))
/// #text(fill: css("Cornflower Blue"))[blue text]
/// #box(fill: css("DARK_ORCHID"))
/// ```
///
/// - color-name (str): The CSS color name in any supported naming convention.
/// -> color
#let css(color-name) = {
  let original = str(color-name)
  if original.len() == 0 {
    panic("error: CSS color name cannot be empty")
  }
  let normalized = lower(original)
    .replace(" ", "")
    .replace("-", "")
    .replace("_", "")
  if normalized in css-colors {
    css-colors.at(normalized)
  } else {
    panic("error: invalid CSS color name: " + original)
  }
}
