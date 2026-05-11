#import "@preview/niram-css:0.2.0": *

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
#show ref: set text(fill: blue)
#show footnote: set text(fill: blue)
#set footnote.entry(gap: 0.7em)

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

// Table configuration
#show table.cell.where(y: 0): set text(weight: "bold")
#show table.cell.where(y: 0): smallcaps

// Figure configuration
#show figure: set block(breakable: true)
#show figure: set figure.caption(position: top)

#let stripe(c) = box(width: 3cm, height: 0.5cm, stroke: black, fill: c)
// End of setup

= `niram-css v0.2.0`

`niram-css`#footnote[In #link("https://en.wikipedia.org/wiki/Tamil_language")[Tamil], _niram_ (நிறம், /n̪ɪrɐm/) means "color"---a fitting name for a coloring package.] brings standard CSS color names#footnote[While the official W3C specification refers to these as "color keywords," they are almost universally known among web developers as "color names." This documentation uses the common vernacular for readability.] to Typst.

While Typst natively ships with #link("https://typst.app/docs/reference/visualize/color/#predefined-colors")[eighteen predefined colors], using anything outside that set usually means hunting down a hex code. `niram-css` eliminates this friction by giving you access to the standard CSS color names. Instead of writing `#c71585`, you can just write `mediumvioletred`.

*Key features:*

- *Complete CSS Color Support:* Access all 147 standard CSS color names (see @css-color-names).#footnote[You may also view these #link("https://htmlpreview.github.io/?https://github.com/nandac/niram-css/blob/v0.2.0/docs/css-colors-table.html")[colors] in a web browser.]

- *Flexible Naming Convention:* Write color names in whatever form feels most natural to you. Inputs are automatically normalized, meaning `mediumvioletred`, `medium violet red`, `Medium Violet Red`, `medium-violet-red`, `medium_violet_red`, `mediumVioletRed`, `MediumVioletRed`, `MEDIUM_VIOLET_RED`, and `MEDIUMVIOLETRED` will all resolve to the same color.

== Requirements

This package requires Typst 0.13.0 or higher.

== Getting Started

Import the package at the top of your Typst document:

```typ
#import "@preview/niram-css:0.2.0": *
```

Then, use the `css` function anywhere a color value is expected:

```typ
This is #text(fill: css("mediumvioletred"))[mediumvioletred] text.
```

This is #text(fill: css("mediumvioletred"))[mediumvioletred] text.

That is all it takes to start using CSS color names in your document.

== Usage

=== Function Reference

#include "api-reference.typ"

=== Examples

Since `niram-css` produces native Typst colors, they work anywhere Typst accepts one---in fills, strokes, underlines, shapes, and color functions like `lighten` or `darken`. The examples below illustrate this in practice.

+ Filling a rectangle with a CSS color.

  ```typ
  #import "@preview/niram-css:0.2.0": *

  #rect(width: 100%, height: 1em, fill: css("darkorchid"))
  ```

  #rect(width: 100%, height: 1em, fill: css("darkorchid"))

+ CSS colors written in lowercase and PascalCase.

  ```typ
  #import "@preview/niram-css:0.2.0": *

  #grid(
    columns: 2,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [saddlebrown], [#box(width: 30mm, height: 1em, fill: css("saddlebrown"))],
    [SaddleBrown], [#box(width: 30mm, height: 1em, fill: css("SaddleBrown"))],
  )
  ```

  #grid(
    columns: 2,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [saddlebrown], [#box(width: 30mm, height: 1em, fill: css("saddlebrown"))],
    [SaddleBrown], [#box(width: 30mm, height: 1em, fill: css("SaddleBrown"))],
  )

+ Lightening and darkening a CSS color with Typst's `lighten` and `darken` functions.

  ```typ
  #import "@preview/niram-css:0.2.0": *

  #grid(
    columns: 2,
    rows: 3,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [crimson], [#box(width: 30mm, height: 1em, fill: css("crimson"))],
    [crimson lightened 40%], [#box(width: 30mm, height: 1em, fill: css("crimson").lighten(40%))],
    [crimson darkened 40%], [#box(width: 30mm, height: 1em, fill: css("crimson").darken(40%))],
  )
  ```

  #grid(
    columns: 2,
    rows: 3,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [crimson], [#box(width: 30mm, height: 1em, fill: css("crimson"))],
    [crimson lightened 40%], [#box(width: 30mm, height: 1em, fill: css("crimson").lighten(40%))],
    [crimson darkened 40%], [#box(width: 30mm, height: 1em, fill: css("crimson").darken(40%))],
  )

+ Typst's built-in `green` differs from the standard CSS `green`. Access the CSS version with `css("green")`.#footnote[See #link(<same-name-different-hex>)[Same Name, Different Hex Value] for why they differ.]

  ```typ
  #import "@preview/niram-css:0.2.0": *

  #grid(
    columns: 3,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [Typst green], [#color.green.to-hex()], [#box(width: 30mm, height: 1em, fill: green)],
    [CSS green], [#css("green").to-hex()], [#box(width: 30mm, height: 1em, fill: css("green"))],
  )
  ```

  #grid(
    columns: 3,
    rows: 2,
    row-gutter: 10pt,
    column-gutter: 10pt,
    [Typst green], [#color.green.to-hex()], [#box(width: 30mm, height: 1em, fill: green)],
    [CSS green], [#css("green").to-hex()], [#box(width: 30mm, height: 1em, fill: css("green"))],
  )

+ Using CSS colors to underline text.

  ```typ
  #import "@preview/niram-css:0.2.0": *

  Thin #underline(stroke: css("darkblue"), offset: 2pt)[underline.]

  Double #underline(stroke: (paint: css("darkblue"), thickness: 0.5pt), offset: 2pt)[
    #underline(stroke: (paint: css("darkblue"), thickness: 0.5pt), offset: 5pt)[underline.]
  ]

  Thick #underline(stroke: (paint: css("darkblue"), thickness: 2pt), offset: 2pt)[underline.]
  ```

  Thin #underline(stroke: css("darkblue"), offset: 2pt)[underline.]

  Double #underline(stroke: (paint: css("darkblue"), thickness: 0.5pt), offset: 2pt)[
    #underline(stroke: (paint: css("darkblue"), thickness: 0.5pt), offset: 5pt)[underline.]
  ]

  Thick #underline(stroke: (paint: css("darkblue"), thickness: 2pt), offset: 2pt)[underline.]

+ Using CSS colors to draw shapes.

  ```typ
  #import "@preview/niram-css:0.2.0": *

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

== Caveats

=== Same Name, Different Hex Value <same-name-different-hex>

Typst provides a set of #link("https://typst.app/docs/reference/visualize/color/#predefined-colors")[eighteen predefined colors]. One of these, `eastern`, is a proprietary addition representing Typst's brand color. The remaining seventeen borrow their _names_ directly from the #link("https://www.w3.org/TR/CSS2/")[CSS Level 2] specification.

However, sharing a _name_ does not mean sharing a _hex value_. According to Typst's source, its default palette is adapted from the #link("https://clrs.cc/")[colors.css] project by designer #link("https://mrmrs.github.io/")[Adam Morse]. Rather than using standard web hex codes, Morse mapped familiar CSS color names to softer, perceptually balanced values for improved design aesthetics.

Because Typst adopted this custom palette, its built-in colors are noticeably different from the standard CSS colors you might expect, as illustrated in @comparison-typst-css-colors.

=== X11 Gray Equivalents in Typst

`niram-css` covers the CSS standard, which omits #link("https://en.wikipedia.org/wiki/X11_color_names")[X11]'s numbered color families (e.g., `red1`--`red4`, `blue1`--`blue4`). These are rarely used today.

Numbered grays (`gray0`--`gray100`) are an exception: X11 defines `grayN` as N% brightness, so they can be reproduced exactly with #link("https://typst.app/docs/reference/visualize/color/#definitions-lighten")[Typst's `lighten` function]. For example, `gray42` is `black.lighten(42%)`.

== The History of the CSS Color Standard

=== X11 Colors

The #link("https://en.wikipedia.org/wiki/X11_color_names")[X11 color names], developed in the 1980s, were defined in a file named `rgb.txt` shipped with every #link("https://en.wikipedia.org/wiki/X_Window_System")[X11] installation. The file mapped over 400 color names to specific RGB values. This list became the de facto color naming convention on Unix-based systems, but was never formally specified by #link("https://en.wikipedia.org/wiki/Xlib")[Xlib] or the X11 protocol. Because `rgb.txt` was vendor-editable, different X server implementations shipped variations of the list.

=== The Seventeen Foundational Color Names of the Early Web

The #link("https://www.w3.org/MarkUp/Wilbur/features.html")[HTML 3.2 specification] of 1996 introduced sixteen color names drawn from the Windows VGA palette, commonly known as the _sixteen named colors_.

Thanks to this standard, these sixteen color names could be used consistently in documents across the web without needing to specify hex values.

#link("https://www.w3.org/TR/CSS1/#color-units")[CSS Level 1], introduced in 1996, adopted these same sixteen colors, while #link("https://www.w3.org/TR/CSS2/syndata.html#color-units")[CSS Level 2] (1998) expanded the list to seventeen with the addition of `orange`. These colors, along with their hex values, are listed in @seventeen-named-colors.

=== The 147 Standardized CSS Colors

The #link("https://www.w3.org/TR/SVG11/types.html#ColorKeywords")[SVG 1.1 specification] in 2011 and the #link("https://www.w3.org/TR/css-color-3/#svg-color")[CSS Color Module Level 3] in 2022 formally standardized 147 colors, officially known as the "recognized color keyword names." This comprehensive set comprises the seventeen basic colors and an additional 130 names drawn directly from the X11 palette.

Serving as the foundation for this package, this standardized list provides a consistent and unified color naming scheme that has remained perfectly stable across the web since its adoption.#footnote[If you are curious about how these specific colors earned their occasionally idiosyncratic names, Alex Sexton gives an excellent breakdown in an informative and lighthearted #link("https://www.youtube.com/watch?v=HmStJQzclHc")[video on YouTube].]

While all 147 CSS color names are distinct, only 138 resolve to unique hex values. Nine of these names function as aliases, sharing an identical hex value with another color on the list. These nine pairs of aliases are detailed in @css-colors-sharing-hex.

#pagebreak()

== CSS Color Names Reference

#figure(
  align(center)[
    #table(
      inset: 10pt,
      columns: 3,
      stroke: none,
      align: (center + horizon,) * 3,
      table.header([Color Name], [Hex Value], [Stripe]),
      ..css-colors
        .pairs()
        .map(((name, color)) => (
          raw(name),
          raw(color.to-hex()),
          stripe(color),
        ))
        .flatten(),
    )
  ],
  caption: [The complete set of 147 CSS color names and their standard hex values, sorted alphabetically.],
) <css-color-names>

#pagebreak()

== The Seventeen Basic Color Names

#figure(
  align(center)[
    #table(
      inset: 10pt,
      columns: 3,
      stroke: none,
      align: (center + horizon,) * 3,
      table.header([Color Name], [Hex Value], [Stripe]),
      ..(
        "aqua",
        "black",
        "blue",
        "fuchsia",
        "gray",
        "green",
        "lime",
        "maroon",
        "navy",
        "olive",
        "orange",
        "purple",
        "red",
        "silver",
        "teal",
        "white",
        "yellow",
      )
        .map(name => {
          let c = css(name)
          (raw(name), raw(c.to-hex()), stripe(c))
        })
        .flatten(),
    )
  ],
  caption: [The seventeen basic color names and their standard CSS hex values.],
) <seventeen-named-colors>

#pagebreak()

== Nine Pairs of Color Aliases

#figure(
  align(center)[
    #table(
      columns: 3,
      inset: 10pt,
      stroke: none,
      align: (center + horizon,) * 3,
      table.header([Color Names], [Hex Value], [Stripe]),
      ..(
        ("aqua", "cyan"),
        ("darkgray", "darkgrey"),
        ("darkslategray", "darkslategrey"),
        ("dimgray", "dimgrey"),
        ("fuchsia", "magenta"),
        ("gray", "grey"),
        ("lightgray", "lightgrey"),
        ("lightslategray", "lightslategrey"),
        ("slategray", "slategrey"),
      )
        .map(((a, b)) => {
          let c = css(a)
          ([#raw(a) \ #raw(b)], raw(c.to-hex()), stripe(c))
        })
        .flatten(),
    )
  ],
  caption: [The nine pairs of CSS color aliases that map to identical hex values.],
) <css-colors-sharing-hex>

#pagebreak()

== Comparing Typst and CSS Color Values

#figure(
  align(center)[
    #table(
      table.header(
        [Color Name],
        [Typst~Hex~Value],
        [CSS~Hex~Value],
        [Typst~Stripe],
        [CSS~Stripe],
      ),
      columns: 5,
      stroke: none,
      align: (center + horizon,) * 5,
      inset: 10pt,
      ..(
        ("aqua", color.aqua),
        ("black", color.black),
        ("blue", color.blue),
        ("eastern", color.eastern),
        ("fuchsia", color.fuchsia),
        ("gray", color.gray),
        ("green", color.green),
        ("lime", color.lime),
        ("maroon", color.maroon),
        ("navy", color.navy),
        ("olive", color.olive),
        ("orange", color.orange),
        ("purple", color.purple),
        ("red", color.red),
        ("silver", color.silver),
        ("teal", color.teal),
        ("white", color.white),
        ("yellow", color.yellow),
      )
        .map(((name, typst-c)) => {
          let (css-hex, css-stripe) = if name in css-colors {
            let css-c = css(name)
            (raw(css-c.to-hex()), stripe(css-c))
          } else {
            ([---], [---])
          }
          (raw(name), raw(typst-c.to-hex()), css-hex, stripe(typst-c), css-stripe)
        })
        .flatten(),
    )
  ],
  caption: [A comparison highlighting the hex value differences between Typst's predefined colors and standard CSS colors of the same name.],
) <comparison-typst-css-colors>
