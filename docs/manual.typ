#import "@preview/niram-css:0.2.0": *
#import "highlight-type.typ": highlight-type

// Global Styles
#set page(margin: 25mm)
#set text(size: 11pt, font: "Libertinus Serif")
#set par(spacing: 1.5em)
#set strong(delta: 200)

// Customize appearance
#show raw: set text(font: "DejaVu Sans Mono") // Inherits font size from surrounding text
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
  table.header([Style], [`Example`], [Common in]),
  [No separator], [`cornflowerblue`], [CSS/SVG],
  [`Spaces`], [`cornflower blue`], [X11/GIMP/Matplotlib],
  [`Hyphens`], [`cornflower-blue`], [CSS tooling/LaTeX xcolor],
  [`Underscores`], [`cornflower_blue`], [X11 alternate/Python/R],
  [`CamelCase`], [`CornflowerBlue`], [X11/.NET/Java],
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

This standardized list provides a consistent color naming scheme across the Web and has remained stable since its adoption. It is this set of color names that forms the basis for this package. How the CSS colors were given their rather idiosyncratic names is explained in a factual but lighthearted fashion by Alex Sexton in #link("https://www.youtube.com/watch?v=HmStJQzclHc")[this YouTube video] #cite(<CSShistory>).

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
      [`aliceblue`],
      [#raw(css("aliceblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("aliceblue"))],

      [`antiquewhite`],
      [#raw(css("antiquewhite").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("antiquewhite"))],

      [`aqua`],
      [#raw(css("aqua").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("aqua"))],

      [`aquamarine`],
      [#raw(css("aquamarine").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("aquamarine"))],

      [`azure`],
      [#raw(css("azure").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("azure"))],

      [`beige`],
      [#raw(css("beige").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("beige"))],

      [`bisque`],
      [#raw(css("bisque").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("bisque"))],

      [`black`],
      [#raw(css("black").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("black"))],

      [`blanchedalmond`],
      [#raw(css("blanchedalmond").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("blanchedalmond"))],

      [`blue`],
      [#raw(css("blue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("blue"))],

      [`blueviolet`],
      [#raw(css("blueviolet").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("blueviolet"))],

      [`brown`],
      [#raw(css("brown").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("brown"))],

      [`burlywood`],
      [#raw(css("burlywood").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("burlywood"))],

      [`cadetblue`],
      [#raw(css("cadetblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("cadetblue"))],

      [`chartreuse`],
      [#raw(css("chartreuse").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("chartreuse"))],

      [`chocolate`],
      [#raw(css("chocolate").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("chocolate"))],

      [`coral`],
      [#raw(css("coral").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("coral"))],

      [`cornflowerblue`],
      [#raw(css("cornflowerblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("cornflowerblue"))],

      [`cornsilk`],
      [#raw(css("cornsilk").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("cornsilk"))],

      [`crimson`],
      [#raw(css("crimson").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("crimson"))],

      [`cyan`],
      [#raw(css("cyan").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("cyan"))],

      [`darkblue`],
      [#raw(css("darkblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkblue"))],

      [`darkcyan`],
      [#raw(css("darkcyan").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkcyan"))],

      [`darkgoldenrod`],
      [#raw(css("darkgoldenrod").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkgoldenrod"))],

      [`darkgray`],
      [#raw(css("darkgray").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkgray"))],

      [`darkgreen`],
      [#raw(css("darkgreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkgreen"))],

      [`darkgrey`],
      [#raw(css("darkgrey").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkgrey"))],

      [`darkkhaki`],
      [#raw(css("darkkhaki").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkkhaki"))],

      [`darkmagenta`],
      [#raw(css("darkmagenta").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkmagenta"))],

      [`darkolivegreen`],
      [#raw(css("darkolivegreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkolivegreen"))],

      [`darkorange`],
      [#raw(css("darkorange").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkorange"))],

      [`darkorchid`],
      [#raw(css("darkorchid").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkorchid"))],

      [`darkred`],
      [#raw(css("darkred").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkred"))],

      [`darksalmon`],
      [#raw(css("darksalmon").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darksalmon"))],

      [`darkseagreen`],
      [#raw(css("darkseagreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkseagreen"))],

      [`darkslateblue`],
      [#raw(css("darkslateblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkslateblue"))],

      [`darkslategray`],
      [#raw(css("darkslategray").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkslategray"))],

      [`darkslategrey`],
      [#raw(css("darkslategrey").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkslategrey"))],

      [`darkturquoise`],
      [#raw(css("darkturquoise").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkturquoise"))],

      [`darkviolet`],
      [#raw(css("darkviolet").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("darkviolet"))],

      [`deeppink`],
      [#raw(css("deeppink").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("deeppink"))],

      [`deepskyblue`],
      [#raw(css("deepskyblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("deepskyblue"))],

      [`dimgray`],
      [#raw(css("dimgray").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("dimgray"))],

      [`dimgrey`],
      [#raw(css("dimgrey").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("dimgrey"))],

      [`dodgerblue`],
      [#raw(css("dodgerblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("dodgerblue"))],

      [`firebrick`],
      [#raw(css("firebrick").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("firebrick"))],

      [`floralwhite`],
      [#raw(css("floralwhite").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("floralwhite"))],

      [`forestgreen`],
      [#raw(css("forestgreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("forestgreen"))],

      [`fuchsia`],
      [#raw(css("fuchsia").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("fuchsia"))],

      [`gainsboro`],
      [#raw(css("gainsboro").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("gainsboro"))],

      [`ghostwhite`],
      [#raw(css("ghostwhite").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("ghostwhite"))],

      [`gold`],
      [#raw(css("gold").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("gold"))],

      [`goldenrod`],
      [#raw(css("goldenrod").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("goldenrod"))],

      [`gray`],
      [#raw(css("gray").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("gray"))],

      [`green`],
      [#raw(css("green").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("green"))],

      [`greenyellow`],
      [#raw(css("greenyellow").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("greenyellow"))],

      [`grey`],
      [#raw(css("grey").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("grey"))],

      [`honeydew`],
      [#raw(css("honeydew").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("honeydew"))],

      [`hotpink`],
      [#raw(css("hotpink").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("hotpink"))],

      [`indianred`],
      [#raw(css("indianred").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("indianred"))],

      [`indigo`],
      [#raw(css("indigo").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("indigo"))],

      [`ivory`],
      [#raw(css("ivory").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("ivory"))],

      [`khaki`],
      [#raw(css("khaki").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("khaki"))],

      [`lavender`],
      [#raw(css("lavender").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lavender"))],

      [`lavenderblush`],
      [#raw(css("lavenderblush").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lavenderblush"))],

      [`lawngreen`],
      [#raw(css("lawngreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lawngreen"))],

      [`lemonchiffon`],
      [#raw(css("lemonchiffon").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lemonchiffon"))],

      [`lightblue`],
      [#raw(css("lightblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightblue"))],

      [`lightcoral`],
      [#raw(css("lightcoral").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightcoral"))],

      [`lightcyan`],
      [#raw(css("lightcyan").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightcyan"))],

      [`lightgoldenrodyellow`],
      [#raw(css("lightgoldenrodyellow").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightgoldenrodyellow"))],

      [`lightgray`],
      [#raw(css("lightgray").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightgray"))],

      [`lightgreen`],
      [#raw(css("lightgreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightgreen"))],

      [`lightgrey`],
      [#raw(css("lightgrey").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightgrey"))],

      [`lightpink`],
      [#raw(css("lightpink").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightpink"))],

      [`lightsalmon`],
      [#raw(css("lightsalmon").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightsalmon"))],

      [`lightseagreen`],
      [#raw(css("lightseagreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightseagreen"))],

      [`lightskyblue`],
      [#raw(css("lightskyblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightskyblue"))],

      [`lightslategray`],
      [#raw(css("lightslategray").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightslategray"))],

      [`lightslategrey`],
      [#raw(css("lightslategrey").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightslategrey"))],

      [`lightsteelblue`],
      [#raw(css("lightsteelblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightsteelblue"))],

      [`lightyellow`],
      [#raw(css("lightyellow").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lightyellow"))],

      [`lime`],
      [#raw(css("lime").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("lime"))],

      [`limegreen`],
      [#raw(css("limegreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("limegreen"))],

      [`linen`],
      [#raw(css("linen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("linen"))],

      [`magenta`],
      [#raw(css("magenta").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("magenta"))],

      [`maroon`],
      [#raw(css("maroon").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("maroon"))],

      [`mediumaquamarine`],
      [#raw(css("mediumaquamarine").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumaquamarine"))],

      [`mediumblue`],
      [#raw(css("mediumblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumblue"))],

      [`mediumorchid`],
      [#raw(css("mediumorchid").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumorchid"))],

      [`mediumpurple`],
      [#raw(css("mediumpurple").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumpurple"))],

      [`mediumseagreen`],
      [#raw(css("mediumseagreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumseagreen"))],

      [`mediumslateblue`],
      [#raw(css("mediumslateblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumslateblue"))],

      [`mediumspringgreen`],
      [#raw(css("mediumspringgreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumspringgreen"))],

      [`mediumturquoise`],
      [#raw(css("mediumturquoise").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumturquoise"))],

      [`mediumvioletred`],
      [#raw(css("mediumvioletred").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mediumvioletred"))],

      [`midnightblue`],
      [#raw(css("midnightblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("midnightblue"))],

      [`mintcream`],
      [#raw(css("mintcream").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mintcream"))],

      [`mistyrose`],
      [#raw(css("mistyrose").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("mistyrose"))],

      [`moccasin`],
      [#raw(css("moccasin").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("moccasin"))],

      [`navajowhite`],
      [#raw(css("navajowhite").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("navajowhite"))],

      [`navy`],
      [#raw(css("navy").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("navy"))],

      [`oldlace`],
      [#raw(css("oldlace").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("oldlace"))],

      [`olive`],
      [#raw(css("olive").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("olive"))],

      [`olivedrab`],
      [#raw(css("olivedrab").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("olivedrab"))],

      [`orange`],
      [#raw(css("orange").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("orange"))],

      [`orangered`],
      [#raw(css("orangered").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("orangered"))],

      [`orchid`],
      [#raw(css("orchid").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("orchid"))],

      [`palegoldenrod`],
      [#raw(css("palegoldenrod").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("palegoldenrod"))],

      [`palegreen`],
      [#raw(css("palegreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("palegreen"))],

      [`paleturquoise`],
      [#raw(css("paleturquoise").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("paleturquoise"))],

      [`palevioletred`],
      [#raw(css("palevioletred").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("palevioletred"))],

      [`papayawhip`],
      [#raw(css("papayawhip").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("papayawhip"))],

      [`peachpuff`],
      [#raw(css("peachpuff").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("peachpuff"))],

      [`peru`],
      [#raw(css("peru").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("peru"))],

      [`pink`],
      [#raw(css("pink").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("pink"))],

      [`plum`],
      [#raw(css("plum").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("plum"))],

      [`powderblue`],
      [#raw(css("powderblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("powderblue"))],

      [`purple`],
      [#raw(css("purple").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("purple"))],

      [`red`],
      [#raw(css("red").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("red"))],

      [`rosybrown`],
      [#raw(css("rosybrown").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("rosybrown"))],

      [`royalblue`],
      [#raw(css("royalblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("royalblue"))],

      [`saddlebrown`],
      [#raw(css("saddlebrown").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("saddlebrown"))],

      [`salmon`],
      [#raw(css("salmon").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("salmon"))],

      [`sandybrown`],
      [#raw(css("sandybrown").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("sandybrown"))],

      [`seagreen`],
      [#raw(css("seagreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("seagreen"))],

      [`seashell`],
      [#raw(css("seashell").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("seashell"))],

      [`sienna`],
      [#raw(css("sienna").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("sienna"))],

      [`silver`],
      [#raw(css("silver").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("silver"))],

      [`skyblue`],
      [#raw(css("skyblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("skyblue"))],

      [`slateblue`],
      [#raw(css("slateblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("slateblue"))],

      [`slategray`],
      [#raw(css("slategray").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("slategray"))],

      [`slategrey`],
      [#raw(css("slategrey").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("slategrey"))],

      [`snow`],
      [#raw(css("snow").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("snow"))],

      [`springgreen`],
      [#raw(css("springgreen").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("springgreen"))],

      [`steelblue`],
      [#raw(css("steelblue").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("steelblue"))],

      [`tan`],
      [#raw(css("tan").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("tan"))],

      [`teal`],
      [#raw(css("teal").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("teal"))],

      [`thistle`],
      [#raw(css("thistle").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("thistle"))],

      [`tomato`],
      [#raw(css("tomato").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("tomato"))],

      [`turquoise`],
      [#raw(css("turquoise").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("turquoise"))],

      [`violet`],
      [#raw(css("violet").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("violet"))],

      [`wheat`],
      [#raw(css("wheat").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("wheat"))],

      [`white`],
      [#raw(css("white").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("white"))],

      [`whitesmoke`],
      [#raw(css("whitesmoke").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("whitesmoke"))],

      [`yellow`],
      [#raw(css("yellow").to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: css("yellow"))],

      [`yellowgreen`],
      [#raw(css("yellowgreen").to-hex())],
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
      table.header([Color Name], [Typst Hex Value], [`Swatch`], [CSS Hex Value], [Swatch]),
      columns: 5,
      stroke: none,
      align: (center + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
      inset: 10pt,
      [`aqua`],
      [#raw(color.aqua.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(aqua))],
      [`#00ffff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#00ffff"))],

      [`black`],
      [#raw(color.black.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(black))],
      [`#000000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#000000"))],

      [`blue`],
      [#raw(color.blue.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(blue))],
      [`#0000ff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#0000ff"))],

      [`eastern`],
      [#raw(color.eastern.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(eastern))],
      [---],
      [---],

      [`fuchsia`],
      [#raw(color.fuchsia.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(fuchsia))],
      [`#ff00ff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ff00ff"))],

      [`gray`],
      [#raw(color.gray.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(gray))],
      [`#808080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#808080"))],

      [`green`],
      [#raw(color.green.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(green))],
      [`#008000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#008000"))],

      [`lime`],
      [#raw(color.lime.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(lime))],
      [`#00ff00`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#00ff00"))],

      [`maroon`],
      [#raw(color.maroon.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(maroon))],
      [`#800000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#800000"))],

      [`navy`],
      [#raw(color.navy.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(navy))],
      [`#000080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#000080"))],

      [`olive`],
      [#raw(color.olive.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(olive))],
      [`#808000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#808000"))],

      [`orange`],
      [#raw(color.orange.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(orange))],
      [`#ffa500`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ffa500"))],

      [`purple`],
      [#raw(color.purple.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(purple))],
      [`#800080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#800080"))],

      [`red`],
      [#raw(color.red.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(red))],
      [`#ff0000`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ff0000"))],

      [`silver`],
      [#raw(color.silver.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(silver))],
      [`#c0c0c0`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#c0c0c0"))],

      [`teal`],
      [#raw(color.teal.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(teal))],
      [`#008080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#008080"))],

      [`white`],
      [#raw(color.white.to-hex())],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb(white))],
      [`#ffffff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ffffff"))],

      [`yellow`],
      [#raw(color.yellow.to-hex())],
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
            [#raw("gray" + str(i)) \ #raw("grey" + str(i))],
            [#raw("black.lighten(" + str(i) + "%)")],
            [#raw(c.to-hex())],
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
