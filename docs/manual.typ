#import "@preview/niram-css:0.2.0": *
#import "highlight-type.typ": highlight-type

// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Libertinus Serif")
#set par(spacing: 1.5em)
#set strong(delta: 200)

// Customize appearance
#show raw: set text(font: "DejaVu Sans Mono")
#show raw.where(block: true): set block(
  fill: css("antiquewhite"),
  inset: 1em,
  radius: 0.5em,
  width: 100%,
)
#show link: set text(fill: blue)

// Text Element configuration
#show heading.where(level: 1): h1 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h1
}

#show heading.where(level: 2): h2 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h2
}

#show heading.where(level: 3): h3 => {
  set block(above: 2em, below: 1.5em)
  set text(weight: "bold")
  h3
}

// Table and figure configuration
#show table.cell.where(y: 0): set text(weight: "bold")
#show table.cell.where(y: 0): smallcaps

#show figure: set block(breakable: true)

// End of setup

= `niram-css v0.2.0`

The `niram-css` package lets you use standard CSS color names directly within your Typst documents.

While Typst includes a curated set of predefined colors, accessing the full spectrum of familiar CSS keywords often requires hunting down exact hex or RGB values. `niram-css` eliminates this friction by bringing all 147 standardized CSS colors natively into your workflow. Instead of pausing to look up a value like `#6495ed`, you can simply type `cornflowerblue` and let the package do the rest.

*Key features include:*

- *Complete CSS Color Support:* Access all 147 standard color keywords from the CSS3 specification (see @available-css-colors, or #link("https://htmlpreview.github.io/?https://github.com/nandac/niram-css/blob/main/docs/css-colors-table.html")[view in a browser]).

- *Flexible Naming Conventions:* Write color names in the format most natural to you. The package automatically normalizes inputs, meaning `cornflowerblue`, `cornflower blue`, `cornflower-blue`, `cornflower_blue`, and `CornflowerBlue` all resolve to the exact same color.

The word _niram_ (நிறம்) means "color" in #link("https://en.wikipedia.org/wiki/Tamil_language")[Tamil], reflecting the package's singular focus on color.

== Requirements

This package requires Typst 0.13.0 or higher.

== Getting Started

Import the package at the top of your Typst document:

```typ
#import "@preview/niram-css:0.2.0": *
```

Then, use the `css` function anywhere a color value is expected:

```typ
Normal text may be #text(fill: css("crimson"))[colored so.]
```

Normal text may be #text(fill: css("crimson"))[colored so.]

That is all it takes to start using CSS color names in your document.

== Usage

=== Function Reference

```typ
css(color-name: str) -> color
```

*color-name* #h(15pt) #highlight-type.str

A string representing the color name. The following conventions are all accepted and normalized to a canonical form before lookup:

#table(
  columns: (auto, auto, auto),
  stroke: none,
  inset: (x: 8pt, y: 6pt),
  table.header([Style], [Example], [Common in]),
  [No separator], [`cornflowerblue`], [CSS/SVG],
  [Spaces], [`cornflower blue`], [X11/GIMP/Matplotlib],
  [Hyphens], [`cornflower-blue`], [CSS tooling/LaTeX xcolor],
  [Underscores], [`cornflower_blue`], [X11 alternate/Python/R],
  [CamelCase], [`CornflowerBlue`], [X11/.NET/Java],
)

Color name matching is completely case-insensitive; `AliceBlue`, `aliceblue`, and `ALICEBLUE` are all treated identically.

-> #h(15pt) #highlight-type.color

The `css` function returns an RGB color. Because this returned value is a standard Typst color type, you can seamlessly modify it using any of Typst's built-in #link("https://typst.app/docs/reference/visualize/color/#definitions-space")[color functions], such as `.lighten()` or `.darken().`

=== Examples

All the examples below assume `#import "@preview/niram-css:0.2.0": *` is at the top of the document.

+ Filling a rectangle with a CSS color.

  ```typ
  #rect(width: 100%, height: auto, fill: css("darkorchid"))
  ```

  #rect(width: 100%, height: auto, fill: css("darkorchid"))

+ CSS color names can be written in lowercase or CamelCase. Both variants are valid.

  ```typ
  (a) saddlebrown: #box(width: 30mm, height: 1em, fill: css("saddlebrown"))

  (b) SaddleBrown: #box(width: 30mm, height: 1em, fill: css("SaddleBrown"))
  ```

  (a) saddlebrown: #box(width: 30mm, height: 1em, fill: css("saddlebrown"))

  (b) SaddleBrown: #box(width: 30mm, height: 1em, fill: css("SaddleBrown"))

+ Typst's built-in `maroon` has a different hex value than the standard CSS `maroon`. To highlight this distinction, the CSS version in the example below uses an initial uppercase letter (`Maroon`).

  ```typ
  #grid(
    columns: 3,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [Typst maroon], [#color.maroon.to-hex()], [#box(width: 30mm, height: 1em, fill: maroon)],
    [CSS maroon], [#css("Maroon").to-hex()], [#box(width: 30mm, height: 1em, fill: css("Maroon"))]
  )
  ```

  #grid(
    columns: 3,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [Typst maroon], [#color.maroon.to-hex()], [#box(width: 30mm, height: 1em, fill: maroon)],
    [CSS maroon], [#css("Maroon").to-hex()], [#box(width: 30mm, height: 1em, fill: css("Maroon"))],
  )

+ Using CSS colors in drawing and data visualization.

  ```typ
  #align(center)[
    #polygon.regular(
      fill: css("darkgoldenrod").lighten(60%),
      stroke: (paint: css("darkgoldenrod"), thickness: 4pt, cap: "round"),
      size: 60mm,
      vertices: 6,
    )
  ]
  ```

  #align(center)[
    #polygon.regular(
      fill: css("darkgoldenrod").lighten(60%),
      stroke: (paint: css("darkgoldenrod"), thickness: 4pt, cap: "round"),
      size: 40mm,
      vertices: 6,
    )
  ]

+ Using CSS colors to underline text.

  ```typ
  This is #underline(stroke: css("teal"))[important.]

  This is #underline(stroke: (paint: css("teal"), thickness: 2pt))[important.]
  ```

  This is #underline(stroke: css("teal"))[important.]

  This is #underline(stroke: (paint: css("teal"), thickness: 2pt))[important.]


== Background: The CSS Color Standard

=== X11 Colors

The #link("https://en.wikipedia.org/wiki/X11_color_names")[X11 color names] #cite(<X11colors>), developed in the 1980s, included a file named `rgb.txt` that was shipped with every #link("https://en.wikipedia.org/wiki/X_Window_System")[X11] installation. It mapped over 400 color names to specific RGB values. This list was used in Unix-based systems to standardize color representation, but the list was never formally standardized across web formats, leading to variations between distributions.

=== Sixteen Named Colors

The #link("https://www.w3.org/MarkUp/Wilbur/features.html")[HTML 3.2 specification] #cite(<HTML32>) of 1996 introduced sixteen color names, derived from the standard 16 colors supported by the Windows VGA palette. These colors, called the sixteen named colors, are:

- `aqua`
- `black`
- `blue`
- `fuchsia`
- `gray`
- `green`
- `lime`
- `maroon`
- `navy`
- `olive`
- `purple`
- `red`
- `silver`
- `teal`
- `white`
- `yellow`

Thanks to this standard, these sixteen color names could be used reliably and consistently in documents across the Web, without needing to specify hexadecimal values.

The CSS Level 1 colors introduced in 1996 specified these exact same sixteen colors, while the CSS Level 2 colors, introduced in 1998, expanded to seventeen colors with the addition of `orange`.

== CSS/SVG Colors

Finally, the #link("https://www.w3.org/TR/SVG11/types.html#ColorKeywords")[SVG 1.1 Specification] of 2011 #cite(<SVG11>) and the #link("https://www.w3.org/TR/css-color-3/#html4")[CSS Color Module Level 3] #cite(<CSS3>) of 2022 standardized on a list of 147 color names, known as the "recognized color keyword names." They comprise the original HTML/VGA named colors, `orange`, and additional colors drawn from the X11 set.

This standardized list provides a consistent color naming scheme across the Web and has remained stable since its adoption. It is this set of color names that forms the basis for this package. How the CSS colors were given their rather idiosyncratic names is explained in a lighthearted but factual fashion by Alex Sexton in #link("https://www.youtube.com/watch?v=HmStJQzclHc")[this YouTube video] #cite(<CSShistory>).

While all 147 CSS color names are distinct, only 138 have unique hex values. The nine pairs of color names that share identical hex values are detailed in @css-colors-sharing-hex-value.

=== CSS Colors vs. Typst Built-ins

Typst ships with #link("https://typst.app/docs/reference/visualize/color/#predefined-colors")[eighteen predefined colors], including the sixteen HTML named colors, `orange`, and one additional color named `eastern`. The color `eastern` has no CSS equivalent.

The remaining seventeen Typst colors share names with their CSS counterparts, but---with the exception of white and black---they have different hex values, as shown in @comparison-typst-css-colors.

=== X11 Gray Equivalents

X11 color coverage is intentionally out of scope for this package. The X11 database includes numbered color families (e.g. `red1`--`red4`, `blue1`--`blue4`, `gray0`--`gray100`) that are rarely used today.

However, any X11 numbered gray shade can be reproduced exactly without this package using `black.lighten(n%)`, which produces the same result as the corresponding X11 gray. These equivalents are detailed in @x11-gray-equivalents.

#pagebreak()

== CSS Color Reference

#figure(
  align(center)[
    #table(
      inset: 10pt,
      columns: 3,
      stroke: none,
      align: (center + horizon, center + horizon, center + horizon),
      table.header([Color Name], [Hex Value], [Swatch]),
      [aliceblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("aliceblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("aliceblue"))],

      [antiquewhite],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("antiquewhite").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("antiquewhite"))],

      [aqua],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("aqua").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("aqua"))],

      [aquamarine],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("aquamarine").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("aquamarine"))],

      [azure],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("azure").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("azure"))],

      [beige],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("beige").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("beige"))],

      [bisque],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("bisque").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("bisque"))],

      [black],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("black").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("black"))],

      [blanchedalmond],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("blanchedalmond").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("blanchedalmond"))],

      [blue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("blue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("blue"))],

      [blueviolet],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("blueviolet").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("blueviolet"))],

      [brown],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("brown").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("brown"))],

      [burlywood],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("burlywood").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("burlywood"))],

      [cadetblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("cadetblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("cadetblue"))],

      [chartreuse],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("chartreuse").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("chartreuse"))],

      [chocolate],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("chocolate").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("chocolate"))],

      [coral],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("coral").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("coral"))],

      [cornflowerblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("cornflowerblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("cornflowerblue"))],

      [cornsilk],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("cornsilk").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("cornsilk"))],

      [crimson],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("crimson").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("crimson"))],

      [cyan],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("cyan").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("cyan"))],

      [darkblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkblue"))],

      [darkcyan],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkcyan").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkcyan"))],

      [darkgoldenrod],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkgoldenrod").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkgoldenrod"))],

      [darkgray],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkgray").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkgray"))],

      [darkgreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkgreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkgreen"))],

      [darkgrey],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkgrey").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkgrey"))],

      [darkkhaki],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkkhaki").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkkhaki"))],

      [darkmagenta],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkmagenta").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkmagenta"))],

      [darkolivegreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkolivegreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkolivegreen"))],

      [darkorange],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkorange").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkorange"))],

      [darkorchid],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkorchid").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkorchid"))],

      [darkred],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkred").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkred"))],

      [darksalmon],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darksalmon").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darksalmon"))],

      [darkseagreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkseagreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkseagreen"))],

      [darkslateblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkslateblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkslateblue"))],

      [darkslategray],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkslategray").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkslategray"))],

      [darkslategrey],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkslategrey").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkslategrey"))],

      [darkturquoise],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkturquoise").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkturquoise"))],

      [darkviolet],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("darkviolet").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkviolet"))],

      [deeppink],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("deeppink").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("deeppink"))],

      [deepskyblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("deepskyblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("deepskyblue"))],

      [dimgray],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("dimgray").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("dimgray"))],

      [dimgrey],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("dimgrey").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("dimgrey"))],

      [dodgerblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("dodgerblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("dodgerblue"))],

      [firebrick],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("firebrick").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("firebrick"))],

      [floralwhite],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("floralwhite").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("floralwhite"))],

      [forestgreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("forestgreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("forestgreen"))],

      [fuchsia],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("fuchsia").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("fuchsia"))],

      [gainsboro],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("gainsboro").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("gainsboro"))],

      [ghostwhite],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("ghostwhite").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("ghostwhite"))],

      [gold],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("gold").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("gold"))],

      [goldenrod],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("goldenrod").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("goldenrod"))],

      [gray],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("gray").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("gray"))],

      [green],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("green").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("green"))],

      [greenyellow],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("greenyellow").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("greenyellow"))],

      [grey],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("grey").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("grey"))],

      [honeydew],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("honeydew").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("honeydew"))],

      [hotpink],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("hotpink").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("hotpink"))],

      [indianred],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("indianred").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("indianred"))],

      [indigo],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("indigo").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("indigo"))],

      [ivory],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("ivory").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("ivory"))],

      [khaki],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("khaki").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("khaki"))],

      [lavender],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lavender").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lavender"))],

      [lavenderblush],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lavenderblush").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lavenderblush"))],

      [lawngreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lawngreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lawngreen"))],

      [lemonchiffon],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lemonchiffon").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lemonchiffon"))],

      [lightblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightblue"))],

      [lightcoral],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightcoral").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightcoral"))],

      [lightcyan],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightcyan").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightcyan"))],

      [lightgoldenrodyellow],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightgoldenrodyellow").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightgoldenrodyellow"))],

      [lightgray],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightgray").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightgray"))],

      [lightgreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightgreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightgreen"))],

      [lightgrey],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightgrey").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightgrey"))],

      [lightpink],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightpink").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightpink"))],

      [lightsalmon],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightsalmon").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightsalmon"))],

      [lightseagreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightseagreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightseagreen"))],

      [lightskyblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightskyblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightskyblue"))],

      [lightslategray],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightslategray").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightslategray"))],

      [lightslategrey],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightslategrey").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightslategrey"))],

      [lightsteelblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightsteelblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightsteelblue"))],

      [lightyellow],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lightyellow").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightyellow"))],

      [lime],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("lime").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lime"))],

      [limegreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("limegreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("limegreen"))],

      [linen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("linen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("linen"))],

      [magenta],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("magenta").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("magenta"))],

      [maroon],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("maroon").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("maroon"))],

      [mediumaquamarine],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumaquamarine").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumaquamarine"))],

      [mediumblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumblue"))],

      [mediumorchid],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumorchid").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumorchid"))],

      [mediumpurple],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumpurple").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumpurple"))],

      [mediumseagreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumseagreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumseagreen"))],

      [mediumslateblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumslateblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumslateblue"))],

      [mediumspringgreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumspringgreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumspringgreen"))],

      [mediumturquoise],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumturquoise").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumturquoise"))],

      [mediumvioletred],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mediumvioletred").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumvioletred"))],

      [midnightblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("midnightblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("midnightblue"))],

      [mintcream],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mintcream").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mintcream"))],

      [mistyrose],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("mistyrose").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mistyrose"))],

      [moccasin],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("moccasin").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("moccasin"))],

      [navajowhite],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("navajowhite").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("navajowhite"))],

      [navy],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("navy").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("navy"))],

      [oldlace],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("oldlace").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("oldlace"))],

      [olive],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("olive").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("olive"))],

      [olivedrab],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("olivedrab").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("olivedrab"))],

      [orange],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("orange").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("orange"))],

      [orangered],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("orangered").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("orangered"))],

      [orchid],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("orchid").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("orchid"))],

      [palegoldenrod],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("palegoldenrod").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("palegoldenrod"))],

      [palegreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("palegreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("palegreen"))],

      [paleturquoise],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("paleturquoise").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("paleturquoise"))],

      [palevioletred],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("palevioletred").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("palevioletred"))],

      [papayawhip],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("papayawhip").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("papayawhip"))],

      [peachpuff],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("peachpuff").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("peachpuff"))],

      [peru],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("peru").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("peru"))],

      [pink],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("pink").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("pink"))],

      [plum],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("plum").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("plum"))],

      [powderblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("powderblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("powderblue"))],

      [purple],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("purple").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("purple"))],

      [red],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("red").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("red"))],

      [rosybrown],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("rosybrown").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("rosybrown"))],

      [royalblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("royalblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("royalblue"))],

      [saddlebrown],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("saddlebrown").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("saddlebrown"))],

      [salmon],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("salmon").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("salmon"))],

      [sandybrown],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("sandybrown").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("sandybrown"))],

      [seagreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("seagreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("seagreen"))],

      [seashell],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("seashell").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("seashell"))],

      [sienna],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("sienna").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("sienna"))],

      [silver],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("silver").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("silver"))],

      [skyblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("skyblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("skyblue"))],

      [slateblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("slateblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("slateblue"))],

      [slategray],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("slategray").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("slategray"))],

      [slategrey],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("slategrey").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("slategrey"))],

      [snow],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("snow").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("snow"))],

      [springgreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("springgreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("springgreen"))],

      [steelblue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("steelblue").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("steelblue"))],

      [tan],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("tan").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("tan"))],

      [teal],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("teal").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("teal"))],

      [thistle],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("thistle").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("thistle"))],

      [tomato],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("tomato").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("tomato"))],

      [turquoise],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("turquoise").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("turquoise"))],

      [violet],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("violet").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("violet"))],

      [wheat],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("wheat").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("wheat"))],

      [white],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("white").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("white"))],

      [whitesmoke],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("whitesmoke").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("whitesmoke"))],

      [yellow],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("yellow").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("yellow"))],

      [yellowgreen],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#css("yellowgreen").to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("yellowgreen"))],
    )
  ],
  caption: [All 147 CSS named colors with their hex values and swatches.],
) <available-css-colors>

#pagebreak()

== CSS Color Aliases

#figure(
  align(center)[
    #table(
      columns: 3,
      inset: 10pt,
      stroke: none,
      align: (center + horizon, center + horizon, center + horizon),
      table.header([Color Names], [Hex Value], [Swatch]),
      [aqua \ cyan], [`#00ffff`], [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#00ffff"))],
      [darkgray \ darkgrey], [`#a9a9a9`], [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#a9a9a9"))],
      [darkslategray \ darkslategrey],
      [`#2f4f4f`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#2f4f4f"))],

      [dimgray \ dimgrey], [`#696969`], [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#696969"))],
      [fuchsia \ magenta], [`#ff00ff`], [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ff00ff"))],
      [gray \ grey], [`#808080`], [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#808080"))],
      [lightgray \ lightgrey], [`#d3d3d3`], [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#d3d3d3"))],
      [lightslategray \ lightslategrey],
      [`#778899`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#778899"))],

      [slategray \ slategrey], [`#708090`], [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#708090"))],
    )
  ],
  caption: [CSS colors sharing the same hex value.],
) <css-colors-sharing-hex-value>

#pagebreak()

== Typst vs. CSS Color Values

#figure(
  align(center)[
    #table(
      table.header([Color Name], [Typst Hex Value], [Swatch], [CSS Hex Value], [Swatch]),
      columns: 5,
      stroke: none,
      align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
      inset: 10pt,
      [aqua],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.aqua.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(aqua))],
      [`#00ffff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#00ffff"))],

      [black],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.black.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(black))],
      [`#000000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#000000"))],

      [blue],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.blue.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(blue))],
      [`#0000ff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#0000ff"))],

      [eastern],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.eastern.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(eastern))],
      [---],
      [---],

      [fuchsia],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.fuchsia.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(fuchsia))],
      [`#ff00ff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ff00ff"))],

      [gray],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.gray.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(gray))],
      [`#808080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#808080"))],

      [green],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.green.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(green))],
      [`#008000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#008000"))],

      [lime],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.lime.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(lime))],
      [`#00ff00`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#00ff00"))],

      [maroon],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.maroon.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(maroon))],
      [`#800000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#800000"))],

      [navy],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.navy.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(navy))],
      [`#000080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#000080"))],

      [olive],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.olive.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(olive))],
      [`#808000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#808000"))],

      [orange],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.orange.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(orange))],
      [`#ffa500`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ffa500"))],

      [purple],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.purple.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(purple))],
      [`#800080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#800080"))],

      [red],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.red.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(red))],
      [`#ff0000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ff0000"))],

      [silver],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.silver.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(silver))],
      [`#c0c0c0`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#c0c0c0"))],

      [teal],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.teal.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(teal))],
      [`#008080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#008080"))],

      [white],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.white.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(white))],
      [`#ffffff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ffffff"))],

      [yellow],
      [#text(font: "Dejavu Sans Mono", size: 11pt)[#color.yellow.to-hex()]],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(yellow))],
      [`#ffff00`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ffff00"))],
    )
  ],
  caption: [Hex value differences between Typst's predefined colors and their CSS equivalents.],
) <comparison-typst-css-colors>

#pagebreak()

== X11 Gray Equivalents

#figure(
  align(center)[
    #table(
      columns: 4,
      inset: 10pt,
      stroke: none,
      align: (center + horizon, center + horizon, center + horizon, center + horizon),
      table.header([X11 Name], [Typst Expression], [Hex Value], [Swatch]),
      ..{
        let cells = ()
        for i in range(101) {
          let c = black.lighten(i * 1%)
          cells += (
            [#text(font: "Dejavu Sans Mono", size: 10pt)[#("gray" + str(i)) \ #("grey" + str(i))]],
            [#text(font: "Dejavu Sans Mono", size: 10pt)[black.lighten(#str(i)%)]],
            [#text(font: "Dejavu Sans Mono", size: 11pt)[#c.to-hex()]],
            [#box(width: 1cm, height: 1cm, stroke: black, fill: c)],
          )
        }
        cells
      },
    )
  ],
  caption: [X11 numbered gray equivalents using `black.lighten(n%)`.],
) <x11-gray-equivalents>

#pagebreak()

#show bibliography: set heading(level: 2)
#bibliography("manual.yml", title: "References", style: "ieee")
