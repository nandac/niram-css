#import "@preview/niram-css:0.2.0": css-colors

#set document(title: "CSS Named Color Reference")

// Typst auto-emits <meta charset>, <meta viewport>, and <title> into <head>.
// The <link> and <style> elements below are valid in <body> per HTML5 and are
// honored by all modern browsers — there is currently no Typst HTML API for
// injecting custom <head> content.
#html.elem("link", attrs: (rel: "preconnect", href: "https://fonts.googleapis.com"))
#html.elem("link", attrs: (
  rel: "preconnect",
  href: "https://fonts.gstatic.com",
  crossorigin: "",
))
#html.elem("link", attrs: (
  rel: "stylesheet",
  href: "https://fonts.googleapis.com/css2?family=Fira+Mono:wght@400;500;700&display=swap",
))
#html.elem("link", attrs: (
  rel: "stylesheet",
  href: "https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap",
))

#html.elem(
  "style",
  "
    body { font-family: 'Noto Serif', serif; font-weight: 400; }
    h1 { text-align: center; font-family: 'Noto Serif', serif; font-weight: 600; }
    table { border-collapse: collapse; width: 60%; margin: 0 auto; }
    th { font-variant: small-caps; }
    th, td { border: 1px solid #ddd; padding: 8px; text-align: center; }
    code { font-family: 'Fira Mono', monospace; }
    .stripe { width: 100%; height: 16px; border: 1px solid #000; }
  ",
)

#html.elem("h1", "CSS Named Color Reference")

#let stripe(hex) = html.elem(
  "div",
  attrs: (class: "stripe", style: "background-color: " + hex + ";"),
  "",
)

#let row(name, color) = {
  let hex = color.to-hex()
  html.elem("tr", {
    html.elem("td", name)
    html.elem("td", html.elem("code", hex))
    html.elem("td", stripe(hex))
  })
}

#html.elem("table", {
  html.elem(
    "thead",
    html.elem("tr", {
      html.elem("th", "Name")
      html.elem("th", "Hex Value")
      html.elem("th", "Color Stripe")
    }),
  )
  html.elem("tbody", {
    for (name, color) in css-colors.pairs() {
      row(name, color)
    }
  })
})
