#import "@preview/tidy:0.4.3"

// Import the file as a named module object specifically for Tidy
#import "../src/lib.typ" as niram-module

// Read and parse your source code file
#let docs = tidy.parse-module(
  read("../src/lib.typ"),
  scope: (niram-css: niram-module),
  preamble: "#import niram-css: *\n"
)

// Use a block with a custom show rule specifically for Tidy's output
#block[
  // Tidy outputs function names as Level 3 headings by default in this style.
  // We can intercept them and force them to look like your Level 2 headings.
  // #show heading.where(level: 3): it => {
  //   set block(above: 2em, below: 1.5em)
  //   set text(size: 1.2em, weight: "bold") // Adjust this size to match your h2
  //   it
  // }

  #show heading.where(level: 4): set heading(bookmarked: false)
  #show heading.where(level: 5): set heading(bookmarked: false)
  #show heading.where(level: 6): set heading(bookmarked: false)

  // Render the documentation to the page
  #tidy.show-module(
    docs,
    style: tidy.styles.default,
    show-outline: false,
  )
]
