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

The `niram-css` package lets you use standard CSS color names directly within your Typst documents. The word _niram_ (நிறம்) means "color" in #link("https://en.wikipedia.org/wiki/Tamil_language")[Tamil], reflecting the package's singular focus on color.

While Typst includes a curated set of predefined colors, accessing the full spectrum of familiar CSS keywords often requires hunting down exact hex or RGB values. `niram-css` eliminates this friction by bringing all 147 standardized CSS colors natively into your workflow. Instead of pausing to look up a value like `#6495ed`, you can simply type `cornflowerblue` and let the package do the rest.

*Key features include:*

- *Complete CSS Color Support:* Access all 147 standard color keywords from the CSS3 specification (see @css-color-reference, or #link("https://htmlpreview.github.io/?https://github.com/nandac/niram-css/blob/main/docs/css-colors-table.html")[view them in a browser]).

- *Flexible Naming Conventions:* Write color names in the format most natural to you. The package automatically normalizes inputs, meaning `cornflowerblue`, `cornflower blue`, `cornflower-blue`, `cornflower_blue`, and `CornflowerBlue` all resolve to the exact same color.

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

The `css` function returns an RGB color. Because the returned value is a standard Typst color type, you can seamlessly modify it using any of Typst's built-in #link("https://typst.app/docs/reference/visualize/color/#definitions-space")[color functions], such as #link("https://typst.app/docs/reference/visualize/color/#definitions-lighten")[`lighten`] or #link("https://typst.app/docs/reference/visualize/color/#definitions-darken")[`darken`].

=== Examples

The examples below assume that `#import "@preview/niram-css:0.2.0": *` is at the top of the document.

+ Filling a rectangle with a CSS color.

  ```typ
  #rect(width: 100%, height: auto, fill: css("darkorchid"))
  ```

  #rect(width: 100%, height: auto, fill: css("darkorchid"))

+ CSS color names can be written in any supported format. Lowercase and CamelCase are shown here.

  ```typ
  #grid(
    columns: 2,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [(a) saddlebrown],
    [#box(width: 30mm, height: 1em, fill: css("saddlebrown"))],
    [(b) SaddleBrown],
    [#box(width: 30mm, height: 1em, fill: css("SaddleBrown"))],
  )
  ```

  #grid(
    columns: 2,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [(a) saddlebrown],
    [#box(width: 30mm, height: 1em, fill: css("saddlebrown"))],
    [(b) SaddleBrown],
    [#box(width: 30mm, height: 1em, fill: css("SaddleBrown"))],
  )

+ Typst's built-in `maroon` has a different hex value than the standard CSS `maroon`. To highlight this distinction, the CSS version in the example below uses an initial uppercase letter (`Maroon`).

  ```typ
  #grid(
    columns: 3,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [Typst maroon],
    [#color.maroon.to-hex()],
    [#box(width: 30mm, height: 1em, fill: maroon)],
    [CSS maroon],
    [#css("Maroon").to-hex()],
    [#box(width: 30mm, height: 1em, fill: css("Maroon"))],
  )
  ```

  #grid(
    columns: 3,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [Typst maroon],
    [#color.maroon.to-hex()],
    [#box(width: 30mm, height: 1em, fill: maroon)],
    [CSS maroon],
    [#css("Maroon").to-hex()],
    [#box(width: 30mm, height: 1em, fill: css("Maroon"))],
  )

+ Using CSS colors to underline and double-underline text.

  ```typ
  Thin #underline(stroke: css("darkblue"), offset: 2pt)[underline.]

  Double #underline(
    stroke: (paint: css("darkblue"), thickness: 0.5pt),
    offset: 2pt,
  )[
    #underline(
      stroke: (paint: css("darkblue"), thickness: 0.5pt),
      offset: 5pt,
    )[underline.]
  ]

  Thick #underline(stroke: (paint: css("darkblue"), thickness: 2pt), offset: 2pt)[underline.]
  ```

  Thin #underline(stroke: css("darkblue"), offset: 2pt)[underline.]

  Double #underline(
    stroke: (paint: css("darkblue"), thickness: 0.5pt),
    offset: 2pt,
  )[
    #underline(
      stroke: (paint: css("darkblue"), thickness: 0.5pt),
      offset: 5pt,
    )[underline.]
  ]

  Thick #underline(stroke: (paint: css("darkblue"), thickness: 2pt), offset: 2pt)[underline.]

+ Using CSS colors in drawing and data visualization.

  ```typ
  #align(center)[
    #block[
      #polygon.regular(
        fill: css("darkgoldenrod").lighten(60%),
        stroke: (paint: css("darkgoldenrod"), thickness: 4pt),
        size: 60mm,
        vertices: 6,
      )
      #place(center + horizon)[
        #circle(
          radius: 5mm,
          stroke: (paint: css("midnightblue"), thickness: 2pt),
          fill: css("cornflowerblue").transparentize(60%),
        )
      ]
    ]
  ]
  ```

  #align(center)[
    #block[
      #polygon.regular(
        fill: css("darkgoldenrod").lighten(60%),
        stroke: (paint: css("darkgoldenrod"), thickness: 4pt),
        size: 60mm,
        vertices: 6,
      )
      #place(center + horizon)[
        #circle(
          radius: 5mm,
          stroke: (paint: css("midnightblue"), thickness: 2pt),
          fill: css("cornflowerblue").transparentize(60%),
        )
      ]
    ]
  ]

== The History of the CSS Color Standard

=== X11 Colors

The #link("https://en.wikipedia.org/wiki/X11_color_names")[X11 color names] #cite(<X11colors>), developed in the 1980s, included a file named `rgb.txt` that was shipped with every #link("https://en.wikipedia.org/wiki/X_Window_System")[X11] installation. It mapped over 400 color names to specific RGB values. This list was used in Unix-based systems to standardize color representation, but was never formally standardized across web formats, leading to variations between distributions.

=== Sixteen Named Colors

The #link("https://www.w3.org/MarkUp/Wilbur/features.html")[HTML 3.2 specification] #cite(<HTML32>) of 1996 introduced sixteen color names, derived from the standard sixteen colors supported by the Windows VGA palette. These colors, called the sixteen named colors, are:

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

The CSS Level 1 colors introduced in 1996 specified these same sixteen colors, while the CSS Level 2 colors, introduced in 1998, expanded to seventeen colors with the addition of `orange`.

== CSS/SVG Colors

Finally, the #link("https://www.w3.org/TR/SVG11/types.html#ColorKeywords")[SVG 1.1 Specification] of 2011 #cite(<SVG11>) and the #link("https://www.w3.org/TR/css-color-3/#svg-color")[CSS Color Module Level 3] #cite(<CSS3>) of 2022 standardized on a list of 147 color names, known as the "recognized color keyword names." They comprise the original HTML/VGA named colors, `orange`, and additional colors drawn from the X11 set.

This standardized list provides a consistent color naming scheme across the Web and has remained stable since its adoption. This set of color names forms the basis of this package. How the CSS colors were given their rather idiosyncratic names is explained in a factual but lighthearted fashion by Alex Sexton in #link("https://www.youtube.com/watch?v=HmStJQzclHc")[this YouTube video] #cite(<CSShistory>).

While all 147 CSS color names are distinct, only 138 have unique hex values. The nine pairs of color names that share identical hex values are detailed in @css-color-aliases.

=== Typst's Predefined Colors versus CSS Colors

Typst ships with #link("https://typst.app/docs/reference/visualize/color/#predefined-colors")[eighteen predefined colors], including the sixteen HTML named colors, `orange`, and one additional color, `eastern`, which has no CSS equivalent.

The remaining seventeen Typst colors share names with their CSS counterparts, but---with the exception of `white` and `black`---they have different hex values, as shown in @comparison-typst-css-colors.

=== X11 Gray Equivalents

X11 color coverage is intentionally out of scope for this package. The X11 database includes numbered color families (e.g. `red1`--`red4`, `blue1`--`blue4`, `gray0`--`gray100`) that are rarely used today.

However, any X11 numbered gray shade can be reproduced exactly with #link("https://typst.app/docs/reference/visualize/color/#definitions-lighten")[Typst's `lighten` function] as demonstrated in @x11-gray-equivalents.

#pagebreak()

== CSS Named Color Reference

#figure(
  align(center)[
    #table(
      inset: 10pt,
      columns: 3,
      stroke: none,
      align: (center + horizon, center + horizon, center + horizon),
      table.header([Color Name], [Hex Value], [Swatch]),
      ..css-colors.pairs().map(((name, color)) => (
        raw(name),
        raw(color.to-hex()),
        box(width: 1cm, height: 1cm, stroke: black, fill: color),
      )).flatten(),
    )
  ],
  caption: [All 147 CSS named colors with their hex values and swatches.],
) <css-color-reference>

#pagebreak()

== CSS Colors Sharing the Same Hex Values

#figure(
  align(center)[
    #table(
      columns: 3,
      inset: 10pt,
      stroke: none,
      align: (center + horizon, center + horizon, center + horizon),
      table.header([Color Names], [Hex Value], [Swatch]),
      [aqua \ cyan],
      [`#00ffff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#00ffff"))],
      [darkgray \ darkgrey],
      [`#a9a9a9`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#a9a9a9"))],
      [darkslategray \ darkslategrey],
      [`#2f4f4f`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#2f4f4f"))],

      [dimgray \ dimgrey],
      [`#696969`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#696969"))],
      [fuchsia \ magenta],
      [`#ff00ff`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#ff00ff"))],
      [gray \ grey],
      [`#808080`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#808080"))],
      [lightgray \ lightgrey],
      [`#d3d3d3`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#d3d3d3"))],
      [lightslategray \ lightslategrey],
      [`#778899`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#778899"))],

      [slategray \ slategrey],
      [`#708090`],
      [#box(width: 1cm, height: 1cm, stroke: black, fill: rgb("#708090"))],
    )
  ],
  caption: [CSS colors sharing the same hex value.],
) <css-color-aliases>

#pagebreak()

== Typst's Predefined Colors versus CSS Colors

#figure(
  align(center)[
    #table(
      table.header([Color Name], [Typst Hex Value], [Swatch], [CSS Hex Value], [Swatch]),
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
  caption: [Typst's predefined colors and their CSS counterparts, with hex values and swatches.],
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
        for i in range(11) {
          let n = i * 10
          let c = black.lighten(n * 1%)
          cells += (
            [#raw("gray" + str(n)) \ #raw("grey" + str(n))],
            [#raw("black.lighten(" + str(n) + "%)")],
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
