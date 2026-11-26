#import "icons.typ": icon

// --- Helper for contact items (icon + link) ---
#let contact-item(name, url, label, icon-size: 9pt) = {
  stack(
    dir: ltr,
    spacing: 3pt,
    align(horizon, icon(name, size: icon-size, baseline: 0pt)),
    align(horizon, if url != none and url != "" {
      link(url)[#underline(offset: 1.6pt, stroke: 0.45pt + rgb("#777777"), label)]
    } else {
      label
    }),
  )
}
