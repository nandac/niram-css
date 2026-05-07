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
#show ref: set text(fill: blue)
#show cite: set text(fill: blue)
#show footnote: set text(fill: blue)

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

The `niram-css` package lets you use standard CSS color names directly in your Typst documents. The word _niram_ (நிறம்), pronounced /n̪ɪrɐm/, means "color" in #link("https://en.wikipedia.org/wiki/Tamil_language")[Tamil].

Typst ships with eighteen predefined colors, which may be referenced by name. Using any other color entails tracking down its exact hex or RGB value. `niram-css` addresses this by making all 147 standardized CSS color names available within Typst. Instead of searching for `#6495ed`, just write `cornflowerblue`.

*Key features:*

- *Complete CSS Color Support:* Access all 147 standard color names from the CSS3 specification (see @all-css-named-colors, or #link("https://htmlpreview.github.io/?https://github.com/nandac/niram-css/blob/main/docs/css-colors-table.html")[view them in a browser]).

- *Flexible Naming Convention:* Write color names in the format most natural to you. Inputs are automatically normalized, meaning `cornflowerblue`, `cornflower blue`, `Cornflower Blue`, `cornflower-blue`, `cornflower_blue`, `cornflowerBlue`, `CornflowerBlue`, `CORNFLOWER_BLUE`, and `CORNFLOWERBLUE` will all resolve to the same color.

== Requirements

This package requires Typst 0.13.0 or higher.

== Getting Started

Import the package at the top of your Typst document:

```typ
#import "@preview/niram-css:0.2.0": *
```

Then, use the `css` function anywhere a color value is expected:

```typ
This is #text(fill: css("crimson"))[crimson] text.
```

This is #text(fill: css("crimson"))[crimson] text.

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
  inset: (x: 16pt, y: 6pt),
  table.header([Naming Convention], [Example], [Common in]),
  [lowercase], [cornflowerblue], [CSS / SVG],
  [Spaces], [cornflower blue], [X11 / GIMP],
  [Title Case], [Cornflower Blue], [UI Labels / Figma],
  [kebab-case], [cornflower-blue], [SASS / Less / Tailwind],
  [snake_case], [cornflower_blue], [Python / R],
  [camelCase], [cornflowerBlue], [JavaScript / JSON / Swift],
  [PascalCase], [CornflowerBlue], [X11 / .NET / LaTeX xcolor],
  [SCREAMING_SNAKE_CASE], [CORNFLOWER_BLUE], [Bash / C constants],
  [UPPERCASE], [CORNFLOWERBLUE], [JavaFX],
)

#h(3pt) #highlight-type.color

The `css` function returns a native Typst color type, allowing you to apply built-in #link("https://typst.app/docs/reference/visualize/color/#definitions-space")[color functions] like #link("https://typst.app/docs/reference/visualize/color/#definitions-lighten")[`lighten`] or #link("https://typst.app/docs/reference/visualize/color/#definitions-darken")[`darken`].

=== Examples

The examples below assume that `#import "@preview/niram-css:0.2.0": *` is at the top of the document.

+ Filling a rectangle with a CSS color.

  ```typ
  #rect(width: 100%, height: auto, fill: css("darkorchid"))
  ```

  #rect(width: 100%, height: auto, fill: css("darkorchid"))

+ CSS colors can be written in any supported format. Lowercase and PascalCase are shown here.

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

+ Typst's built-in `maroon` has a different hex value from the standard CSS `maroon`.#footnote[See @comparison-typst-css-colors for a full comparison of Typst's predefined colors and their CSS counterparts.] The CSS version of `maroon` is invoked as a quoted string argument to the `css` function. The distinction between the two colors is demonstrated below.

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
    [#css("maroon").to-hex()],
    [#box(width: 30mm, height: 1em, fill: css("maroon"))],
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
    [#css("maroon").to-hex()],
    [#box(width: 30mm, height: 1em, fill: css("maroon"))],
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

+ Using CSS colors for drawing shapes.

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

The #link("https://en.wikipedia.org/wiki/X11_color_names")[X11 color names] #cite(<X11colors>), developed in the 1980s, were defined in a file named `rgb.txt` shipped with every #link("https://en.wikipedia.org/wiki/X_Window_System")[X11] installation. It mapped over 400 color names to specific RGB values. This list became the de facto color naming convention on Unix-based systems, but was never formally specified by #link("https://en.wikipedia.org/wiki/Xlib")[Xlib] or the X11 protocol. Because `rgb.txt` was vendor-editable, different X server implementations shipped variations of the list.

=== Sixteen Names for the Early Web

The #link("https://www.w3.org/MarkUp/Wilbur/features.html")[HTML 3.2 specification] #cite(<HTML32>) of 1996 introduced sixteen color names, drawn from the Windows VGA palette. Known as the sixteen named colors, they are listed with their hex values in @sixteen-named-colors.

Thanks to this standard, these sixteen color names could be used consistently in documents across the Web, without needing to specify hex values.

#link("https://www.w3.org/TR/CSS1/")[CSS Level 1], introduced in 1996, adopted these same sixteen colors, while #link("https://www.w3.org/TR/CSS2/")[CSS Level 2] (1998) expanded to seventeen with the addition of `orange`.

=== CSS/SVG Colors

Finally, the #link("https://www.w3.org/TR/SVG11/types.html#ColorKeywords")[SVG 1.1 specification] of 2011 #cite(<SVG11>) and the #link("https://www.w3.org/TR/css-color-3/#svg-color")[CSS Color Module Level 3] #cite(<CSS3>) of 2022 standardized 147 color names, known as the "recognized color keyword names." They comprise the original sixteen HTML/VGA named colors, `orange`, and an additional 130 color names drawn from the X11 set.

This standardized list — the basis for this package — provides a consistent color naming scheme across the Web and has remained stable since its adoption. Alex Sexton explains how the CSS colors got their idiosyncratic names in a factual but lighthearted #link("https://www.youtube.com/watch?v=HmStJQzclHc")[YouTube talk] #cite(<CSShistory>).

All 147 CSS color names are distinct, but only 138 resolve to unique hex values. The nine alias pairs are listed in @css-color-aliases.

=== Same Name, Different Hex Value

Typst ships with #link("https://typst.app/docs/reference/visualize/color/#predefined-colors")[eighteen predefined colors], including the sixteen HTML named colors, `orange`, and one additional color, `eastern`, which has no CSS color equivalent.

The remaining seventeen Typst colors share names with their CSS counterparts, but---except for `white` and `black`---they have different hex values, as shown in @comparison-typst-css-colors.

=== X11 Gray Equivalents

Full X11 color coverage is intentionally out of scope for this package. The X11 database includes numbered color families (e.g., `red1`--`red4`, `blue1`--`blue4`, `gray0`--`gray100`) that are rarely used today.

However, any X11 numbered gray shade can be reproduced exactly with #link("https://typst.app/docs/reference/visualize/color/#definitions-lighten")[Typst's `lighten` function], as demonstrated in @x11-gray-equivalents.

#pagebreak()

== CSS Named Color Reference

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
  caption: [All 147 CSS named colors and their hex values.],
) <all-css-named-colors>

#pagebreak()

== Sixteen Named Colors

#figure(
  align(center)[
    #table(
      inset: 10pt,
      columns: 3,
      stroke: none,
      align: (center + horizon,) * 3,
      table.header([Color Name], [Hex Value], [Stripe]),
      ..(
        "aqua", "black", "blue", "fuchsia",
        "gray", "green", "lime", "maroon",
        "navy", "olive", "purple", "red",
        "silver", "teal", "white", "yellow",
      )
        .map(name => {
          let c = css(name)
          (raw(name), raw(c.to-hex()), stripe(c))
        })
        .flatten(),
    )
  ],
  caption: [The sixteen HTML 3.2 named colors and their hex values.],
) <sixteen-named-colors>

#pagebreak()

== CSS Color Name Aliases

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
  caption: [CSS color name aliases --- each pair maps to the same hex value.],
) <css-color-aliases>

#pagebreak()

== Typst's Predefined Colors versus CSS Colors

#figure(
  align(center)[
    #table(
      table.header([Color Name], [Typst~Hex~Value], [Stripe], [CSS~Hex~Value], [Stripe]),
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
          let css-cells = if name in css-colors {
            let css-c = css(name)
            (raw(css-c.to-hex()), stripe(css-c))
          } else {
            ([---], [---])
          }
          (raw(name), raw(typst-c.to-hex()), stripe(typst-c), ..css-cells)
        })
        .flatten(),
    )
  ],
  caption: [Typst's predefined colors and their CSS counterparts.],
) <comparison-typst-css-colors>

#pagebreak()

== X11 Grays in Typst

#figure(
  align(center)[
    #table(
      columns: 4,
      inset: 10pt,
      stroke: none,
      align: (center + horizon,) * 4,
      table.header([X11 Name], [Typst Expression], [Hex Value], [Stripe]),
      ..range(11)
        .map(i => {
          let n = i * 10
          let c = black.lighten(n * 1%)
          (
            [#raw("gray" + str(n)) \ #raw("grey" + str(n))],
            raw("black.lighten(" + str(n) + "%)"),
            raw(c.to-hex()),
            stripe(c),
          )
        })
        .flatten(),
    )
  ],
  caption: [X11 numbered gray equivalents at 10% intervals, reproduced with `black.lighten(n%)`.],
) <x11-gray-equivalents>

#pagebreak()

#show bibliography: set heading(level: 2)
#bibliography("manual.yml", title: "References", style: "ieee")
