#import "@preview/niram-css:0.2.0": css-colors

#set document(title: "CSS Color Names Reference")

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

// We emit <html>, <head>, and <body> manually so we can set the lang attribute
// and place <link>/<style> inside <head> (W3C-valid). When <html> is built via
// html.elem, Typst no longer auto-generates <head>, so charset, viewport, and
// title must be emitted here too.
#html.elem("html", attrs: (lang: "en"), {
  html.elem("head", {
    html.elem("meta", attrs: (charset: "utf-8"))
    html.elem("meta", attrs: (
      name: "viewport",
      content: "width=device-width, initial-scale=1",
    ))
    html.elem("title", "CSS Color Names Reference")
    html.elem("link", attrs: (rel: "preconnect", href: "https://fonts.googleapis.com"))
    html.elem("link", attrs: (
      rel: "preconnect",
      href: "https://fonts.gstatic.com",
      crossorigin: "",
    ))
    html.elem("link", attrs: (
      rel: "stylesheet",
      href: "https://fonts.googleapis.com/css2?family=Fira+Mono:wght@400;500;700&display=swap",
    ))
    html.elem("link", attrs: (
      rel: "stylesheet",
      href: "https://fonts.googleapis.com/css2?family=Noto+Serif:ital,wght@0,100..900;1,100..900&display=swap",
    ))
    html.elem(
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
  })
  html.elem("body", {
    html.elem("h1", "CSS Color Names Reference")
    html.elem("table", {
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
  })
})
