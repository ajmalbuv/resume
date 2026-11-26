// ============================================================================
// Modern Editorial Sidebar Resume (Single-File Edition)
// Reuses shared content from `lib/data.typ` and SVG icons from `lib/icons.typ`.
// Compile:
//   typst compile --font-path fonts resume-sidebar.typ resume-sidebar.pdf
//   typst compile --font-path fonts --ppi 300 --pages 1 resume-sidebar.typ resume-sidebar.png
// ============================================================================

#import "lib/data.typ": details, education, experience, languages, personal, projects, skills, summary
#import "lib/icons.typ": icon

// ----------------------------------------------------------------------------
// 1. CONFIGURATION (Edit colors, layout, fonts, and toggles right here)
// ----------------------------------------------------------------------------
#let config = (
  // Media & Header
  photo-path: "lib/photo.jpeg", // Set to `none` to hide avatar cleanly
  titlecase-name: true, // Convert "AJMAL BASHEER" -> "Ajmal Basheer"
  stack-name: true, // Split multi-word name onto two bold lines

  // Content & Section Controls
  section-order: ("about", "experience", "projects", "education"),
  max-exp-items: none, // `none` = show all bullets; or set integer (e.g. 4)
  max-proj-items: none, // `none` = show all bullets; or set integer (e.g. 3)
  skills-style: "pills", // "pills" (modern tags) or "list" (compact bullet rows)
  show-details: true, // Renders DOB, License, Passport, etc. if present in data.typ

  // Optional inline personal details override (merged with `details` & `personal` in data.typ)
  extra-details: (),

  // Typography (Bundled in `fonts/`)
  header-font: "Montserrat",
  body-font: "Roboto",

  // Color Palette (Warm Architectural Stone + Obsidian Slate + Cognac Terracotta)
  sidebar-bg: rgb("#F3F1ED"),
  page-bg: rgb("#FFFFFF"),
  accent-dark: rgb("#1D262D"),
  accent-warm: rgb("#9E6642"),
  text-primary: rgb("#222830"),
  text-muted: rgb("#5C6670"),
  border-subtle: rgb("#DFDAD0"),
  rail-color: rgb("#C6BFB5"),
  date-pill-bg: rgb("#F4F1EC"),

  // Page Geometry (A4: 210mm x 297mm)
  sidebar-width: 72mm,
  footer-height: 9mm,
  footer-slant: 8mm,
)

// ----------------------------------------------------------------------------
// 2. INTERNAL HELPERS
// ----------------------------------------------------------------------------
#let _space-func = [ ].func()

#let content-to-str(c) = {
  if c == none { return "" }
  if type(c) == str { return c }
  if c.func() == _space-func { return " " }
  if c.has("text") { return c.text }
  if c.has("children") { return c.children.map(content-to-str).join("") }
  if c.has("body") { return content-to-str(c.body) }
  ""
}

#let to-title-case(s) = {
  s
    .split(" ")
    .filter(w => w != "")
    .map(w => {
      let cs = w.clusters()
      if cs.len() == 0 { "" } else { upper(cs.at(0)) + lower(cs.slice(1).join("")) }
    })
    .join(" ")
}

#let format-date(d) = {
  if d == none { "" } else { str(d).replace("--", "–") }
}

#let clean-url-label(u) = {
  str(u).replace("https://", "").replace("http://", "").trim("/", at: end)
}

// Collect optional identity/personal details seamlessly from both `personal` keys and `details`
#let collect-details(personal-dict, data-details, extra-details) = {
  let out = ()
  let seen = ()

  let known-keys = (
    ("dob", "Date of Birth", "calendar"),
    ("date_of_birth", "Date of Birth", "calendar"),
    ("nationality", "Nationality", "globe"),
    ("license", "Driving License", "license"),
    ("driving_license", "Driving License", "license"),
    ("passport", "Passport No.", "passport"),
    ("visa", "Visa Status", "id"),
    ("marital_status", "Marital Status", "user"),
  )

  for (k, lbl, ic) in known-keys {
    let val = personal-dict.at(k, default: none)
    if val != none and str(val).trim() != "" and lbl not in seen {
      out.push((label: lbl, value: str(val).trim(), icon: ic))
      seen.push(lbl)
    }
  }

  let infer-icon(lbl) = {
    let l = lower(str(lbl))
    if "birth" in l or "dob" in l { "calendar" } else if "passport" in l { "passport" } else if (
      "licen" in l or "driving" in l
    ) { "license" } else if "nation" in l or "citizen" in l or "country" in l { "globe" } else { "id" }
  }

  let parse-source(src) = {
    if src == none { return () }
    let parsed = ()
    if type(src) == dictionary {
      for (k, v) in src {
        if v != none and str(v).trim() != "" {
          parsed.push((label: str(k), value: str(v).trim(), icon: infer-icon(k)))
        }
      }
    } else if type(src) == array {
      for item in src {
        if type(item) == dictionary {
          let lbl = item.at("label", default: "")
          let val = item.at("value", default: "")
          let ic = item.at("icon", default: infer-icon(lbl))
          if lbl != "" and val != none and str(val).trim() != "" {
            parsed.push((label: str(lbl), value: str(val).trim(), icon: ic))
          }
        }
      }
    }
    parsed
  }

  for entry in parse-source(data-details) + parse-source(extra-details) {
    if entry.label not in seen {
      out.push(entry)
      seen.push(entry.label)
    }
  }

  out
}

// ----------------------------------------------------------------------------
// 3. PAGE SETUP & FULL-BLEED BACKGROUND
// ----------------------------------------------------------------------------
#let page-w = 210mm
#let page-h = 297mm

#set document(
  title: personal.at("name", default: "Resume"),
  author: personal.at("name", default: ""),
)

#set page(
  paper: "a4",
  margin: (
    top: 10mm,
    bottom: config.footer-height + 4mm,
    left: 0pt,
    right: 0pt,
  ),
  background: {
    // Full-bleed page white base
    place(top + left, rect(width: page-w, height: page-h, fill: config.page-bg))

    // Left warm stone sidebar column
    place(
      top + left,
      rect(
        width: config.sidebar-width,
        height: page-h - config.footer-height,
        fill: config.sidebar-bg,
      ),
    )

    // Subtle vertical divider hairline between sidebar & main canvas
    place(
      top + left,
      dx: config.sidebar-width,
      line(
        start: (0pt, 0pt),
        end: (0pt, page-h - config.footer-height),
        stroke: 0.5pt + config.border-subtle,
      ),
    )

    // Signature Dual-Tone Diagonal Footer Banner
    // Draw terracotta full-width base first, then obsidian polygon on top -> zero subpixel seam
    place(
      bottom + left,
      rect(width: page-w, height: config.footer-height, fill: config.accent-warm),
    )
    place(
      top + left,
      polygon(
        fill: config.accent-dark,
        (0pt, page-h - config.footer-height),
        (config.sidebar-width + config.footer-slant, page-h - config.footer-height),
        (config.sidebar-width, page-h),
        (0pt, page-h),
      ),
    )
  },
)

#set text(
  font: config.body-font,
  size: 8.1pt,
  fill: config.text-primary,
  fallback: true,
)
#set par(justify: false, leading: 0.48em, spacing: 0.45em)
#set block(spacing: 0.45em)

// ----------------------------------------------------------------------------
// 4. UI COMPONENTS
// ----------------------------------------------------------------------------

// Section Header: dark rounded badge + geometric title + optional subtle hairline
#let section-header(icon-name, title, rule: true, in-sidebar: false) = {
  let badge-size = if in-sidebar { 15pt } else { 16.5pt }
  let icon-size = if in-sidebar { 8.5pt } else { 9.5pt }
  let font-size = if in-sidebar { 9.8pt } else { 10.6pt }

  v(if in-sidebar { 6.5pt } else { 7.5pt })
  grid(
    columns: if rule { (auto, 1fr) } else { (auto,) },
    column-gutter: 6.5pt,
    align: (left + horizon, left + horizon),
    stack(
      dir: ltr,
      spacing: 5.5pt,
      align(
        horizon,
        box(
          width: badge-size,
          height: badge-size,
          radius: 3.5pt,
          fill: config.accent-dark,
          align(center + horizon, icon(icon-name, size: icon-size, baseline: 0pt, color: white)),
        ),
      ),
      align(
        horizon,
        text(
          font: config.header-font,
          size: font-size,
          weight: "bold",
          fill: config.accent-dark,
          tracking: 0.2pt,
        )[#title],
      ),
    ),
    if rule {
      line(length: 100%, stroke: 0.6pt + config.border-subtle)
    },
  )
  v(if in-sidebar { 4pt } else { 4.5pt })
}

// Contact Row Item
#let contact-row(icon-name, content-body, url: none) = {
  let inner = grid(
    columns: (12pt, 1fr),
    column-gutter: 4.5pt,
    align: (center + horizon, left + horizon),
    icon(icon-name, size: 8.5pt, baseline: 0pt, color: config.accent-warm),
    text(size: 7.8pt, weight: "regular", fill: config.text-primary)[#content-body],
  )
  if url != none and url != "" {
    link(url)[#inner]
  } else {
    inner
  }
}

// Personal Detail Row Item (Micro-Label + Crisp Value)
#let detail-row(icon-name, label, value) = {
  grid(
    columns: (12pt, 1fr),
    column-gutter: 4.5pt,
    align: (center + horizon, left + horizon),
    icon(icon-name, size: 8.5pt, baseline: 0pt, color: config.accent-warm),
    stack(
      dir: ttb,
      spacing: 1.2pt,
      text(
        size: 6.2pt,
        weight: "bold",
        fill: config.text-muted,
        tracking: 0.45pt,
      )[#upper(label)],
      text(size: 7.9pt, weight: "medium", fill: config.text-primary)[#value],
    ),
  )
}

// Skill Pill Tag
#let skill-pill(label) = {
  box(
    fill: white,
    stroke: 0.45pt + config.border-subtle,
    radius: 2.5pt,
    inset: (x: 4.5pt, y: 2pt),
    text(size: 6.9pt, weight: "medium", fill: config.text-primary)[#label],
  )
}

// Date Pill Badge
#let date-pill(date-str) = {
  box(
    fill: config.date-pill-bg,
    stroke: 0.4pt + config.border-subtle,
    radius: 2.5pt,
    inset: (x: 5pt, y: 1.8pt),
    text(size: 7.2pt, weight: "medium", fill: config.text-muted)[#format-date(date-str)],
  )
}

// Precision Vertical Timeline Component
#let timeline-block(items, highlight-first: true) = {
  let rail-x = 4.5pt
  let rail-col = 13.5pt
  let rail-w = 1.1pt
  let dot-y = 5.6pt

  block(
    width: 100%,
    inset: (left: rail-x),
    block(
      width: 100%,
      stroke: (left: rail-w + config.rail-color),
      inset: (left: rail-col - rail-x, top: 0pt, bottom: 1pt),
      [
        #for (i, itm) in items.enumerate() [
          #let is-last = (i == items.len() - 1)
          #let is-hero-node = (highlight-first and i == 0)
          #let sub = itm.at("subtitle", default: "")
          #let loc = itm.at("location", default: "")
          #let has-sub-row = (sub != none and sub != "") or (loc != none and loc != "")
          #let b-items = itm.at("items", default: ())

          #block(
            width: 100%,
            below: if is-last { 0pt } else { 7.5pt },
            [
              // Cleanly mask the rail stub above the very first dot
              #if i == 0 {
                place(
                  top + left,
                  dx: -(rail-col - rail-x) - 3pt,
                  dy: -0.5pt,
                  rect(width: 6pt, height: dot-y + 0.5pt, fill: config.page-bg),
                )
              }

              // Timeline Node centered identically at `rail-x`
              #if is-hero-node {
                let outer-r = 3.8pt
                let inner-r = 1.9pt
                place(
                  top + left,
                  dx: -(rail-col - rail-x) - outer-r,
                  dy: dot-y - outer-r,
                  circle(radius: outer-r, fill: config.page-bg, stroke: 1.1pt + config.accent-warm),
                )
                place(
                  top + left,
                  dx: -(rail-col - rail-x) - inner-r,
                  dy: dot-y - inner-r,
                  circle(radius: inner-r, fill: config.accent-warm),
                )
              } else {
                let outer-r = 3pt
                let inner-r = 1.9pt
                place(
                  top + left,
                  dx: -(rail-col - rail-x) - outer-r,
                  dy: dot-y - outer-r,
                  circle(radius: outer-r, fill: config.page-bg),
                )
                place(
                  top + left,
                  dx: -(rail-col - rail-x) - inner-r,
                  dy: dot-y - inner-r,
                  circle(radius: inner-r, fill: config.accent-dark),
                )
              }

              // Tightly grouped Title + Role/Location header stack
              #stack(
                dir: ttb,
                spacing: 2pt,
                grid(
                  columns: (1fr, auto),
                  column-gutter: 8pt,
                  align: (left + horizon, right + horizon),
                  [
                    #let title-text = text(
                      font: config.header-font,
                      size: 9pt,
                      weight: "bold",
                      fill: config.accent-dark,
                    )[#itm.title]

                    #if itm.at("url", default: none) != none and itm.url != "" [
                      #link(itm.url)[
                        #stack(
                          dir: ltr,
                          spacing: 3.5pt,
                          align(horizon, title-text),
                          align(horizon, icon("link", size: 7.5pt, baseline: 0pt, color: config.accent-warm)),
                        )
                      ]
                    ] else [
                      #title-text
                    ]
                  ],
                  if itm.at("date", default: "") != "" [
                    #date-pill(itm.date)
                  ],
                ),
                if has-sub-row [
                  #grid(
                    columns: (1fr, auto),
                    column-gutter: 8pt,
                    align: (left + horizon, right + horizon),
                    if sub != none and sub != "" [
                      #text(
                        size: 8pt,
                        weight: "semibold",
                        fill: config.accent-warm,
                      )[#sub]
                    ],
                    if loc != none and loc != "" [
                      #text(size: 7.4pt, style: "italic", fill: config.text-muted)[#loc]
                    ],
                  )
                ],
              )

              // Bullet Items
              #if b-items.len() > 0 [
                #v(3pt)
                #set list(
                  indent: 0pt,
                  body-indent: 5pt,
                  spacing: 2.3pt,
                  marker: box(
                    inset: (top: 2.6pt),
                    circle(radius: 1.25pt, fill: config.accent-warm),
                  ),
                )
                #for bullet in b-items [
                  #list.item(
                    text(size: 7.75pt, fill: config.text-primary)[
                      #set par(leading: 0.42em)
                      #bullet
                    ],
                  )
                ]
              ]
            ],
          )
        ]

        // Crisp Terminal Cap at Bottom of Rail (Signature Suhail Touch)
        #let term-r = 1.9pt
        #place(
          bottom + left,
          dx: -(rail-col - rail-x) - term-r,
          dy: term-r,
          circle(radius: term-r, fill: config.rail-color),
        )
      ],
    ),
  )
}

// ----------------------------------------------------------------------------
// 5. SIDEBAR CONTENT
// ----------------------------------------------------------------------------
#let sidebar-content = block(
  width: 100%,
  inset: (left: 8.5mm, right: 8mm),
  [
    // 1. Studio Avatar Medallion
    #if config.photo-path != none [
      #v(1.5mm)
      #align(center)[
        #box(
          width: 3.45cm,
          height: 3.45cm,
          radius: 50%,
          stroke: 1.8pt + config.accent-dark,
          fill: white,
          inset: 3pt,
          box(
            width: 100%,
            height: 100%,
            radius: 50%,
            stroke: 0.5pt + config.border-subtle,
            clip: true,
            image(config.photo-path, width: 100%, height: 100%, fit: "cover"),
          ),
        )
      ]
      #v(2pt)
    ]

    // 2. Contact Section
    #section-header("contact", "Contact", rule: true, in-sidebar: true)
    #let c-items = ()
    #if personal.at("phone", default: none) != none {
      c-items.push(contact-row("phone", personal.phone, url: "tel:" + personal.phone))
    }
    #if personal.at("email", default: none) != none {
      c-items.push(contact-row("mail", personal.email, url: "mailto:" + personal.email))
    }
    #if personal.at("location", default: none) != none {
      c-items.push(contact-row("location", personal.location))
    }
    #if personal.at("linkedin", default: none) != none {
      c-items.push(contact-row(
        "linkedin",
        clean-url-label(personal.linkedin),
        url: "https://" + clean-url-label(personal.linkedin),
      ))
    }
    #if personal.at("github", default: none) != none {
      c-items.push(contact-row(
        "github",
        clean-url-label(personal.github),
        url: "https://" + clean-url-label(personal.github),
      ))
    }
    #if personal.at("website", default: none) != none {
      c-items.push(contact-row("globe", clean-url-label(personal.website), url: personal.website))
    }
    #stack(dir: ttb, spacing: 5pt, ..c-items)

    // 3. Optional Personal / Identity Details (DOB, License, Passport, Nationality...)
    #let resolved-details = collect-details(personal, details, config.extra-details)
    #if config.show-details and resolved-details.len() > 0 [
      #section-header("id", "Personal Details", rule: true, in-sidebar: true)
      #stack(
        dir: ttb,
        spacing: 5.5pt,
        ..resolved-details.map(d => detail-row(d.icon, d.label, d.value)),
      )
    ]

    // 4. Skills Section (Categorized Pills or Compact List)
    #if skills != none and skills.len() > 0 [
      #section-header("skills", "Skills", rule: true, in-sidebar: true)
      #if config.skills-style == "pills" [
        #if type(skills) == dictionary [
          #for (i, (cat, val)) in skills.pairs().enumerate() [
            #let tags = if type(val) == array {
              val.map(x => content-to-str(x).trim()).filter(t => t != "")
            } else {
              content-to-str(val).split(",").map(t => t.trim()).filter(t => t != "")
            }
            #block(below: if i == skills.len() - 1 { 0pt } else { 7pt })[
              #stack(
                dir: ttb,
                spacing: 3pt,
                text(
                  size: 6.4pt,
                  weight: "bold",
                  fill: config.accent-warm,
                  tracking: 0.35pt,
                )[#upper(cat)],
                par(leading: 0.44em, justify: false)[
                  #for (j, tag) in tags.enumerate() [
                    #skill-pill(tag)#if j < tags.len() - 1 { h(3pt) }
                  ]
                ],
              )
            ]
          ]
        ] else if type(skills) == array [
          #par(leading: 0.44em, justify: false)[
            #for (j, tag) in skills.enumerate() [
              #skill-pill(content-to-str(tag))#if j < skills.len() - 1 { h(3pt) }
            ]
          ]
        ]
      ] else [
        #set list(indent: 0pt, body-indent: 5pt, spacing: 3.5pt, marker: circle(
          radius: 1.3pt,
          fill: config.accent-warm,
        ))
        #if type(skills) == dictionary {
          for (cat, val) in skills {
            list.item(text(size: 7.7pt)[*#cat:* #val])
          }
        } else if type(skills) == array {
          for itm in skills {
            list.item(text(size: 7.8pt)[#itm])
          }
        }
      ]
    ]

    // 5. Languages Section
    #if languages != none and languages.len() > 0 [
      #section-header("language", "Languages", rule: true, in-sidebar: true)
      #if type(languages) == dictionary [
        #stack(
          dir: ttb,
          spacing: 3.5pt,
          ..languages
            .pairs()
            .map(((lang, level)) => grid(
              columns: (1fr, auto),
              text(size: 7.9pt, weight: "medium", fill: config.text-primary)[#lang],
              text(size: 7.3pt, fill: config.text-muted)[#level],
            )),
        )
      ] else [
        #par(leading: 0.62em, justify: false)[
          #for (j, lang) in languages.enumerate() [
            #skill-pill(content-to-str(lang))#if j < languages.len() - 1 { h(3pt) }
          ]
        ]
      ]
    ]
  ],
)

// ----------------------------------------------------------------------------
// 6. MAIN COLUMN CONTENT
// ----------------------------------------------------------------------------
#let render-about = {
  if summary != none and summary != "" [
    #section-header("user", "About Me", rule: true)
    #text(size: 8.1pt, fill: config.text-primary)[
      #set par(justify: true, leading: 0.48em)
      #summary
    ]
  ]
}

#let render-experience = {
  if experience != none and experience.len() > 0 [
    #section-header("briefcase", "Experience", rule: true)
    #timeline-block(
      experience.map(exp => {
        let raw-items = exp.at("items", default: ())
        let items = if config.max-exp-items != none and raw-items.len() > config.max-exp-items {
          raw-items.slice(0, config.max-exp-items)
        } else {
          raw-items
        }
        (
          date: exp.at("date", default: ""),
          title: exp.company,
          subtitle: exp.role,
          location: exp.at("location", default: ""),
          items: items,
        )
      }),
      highlight-first: true,
    )
  ]
}

#let render-projects = {
  if projects != none and projects.len() > 0 [
    #section-header("code", "Projects", rule: true)
    #timeline-block(
      projects.map(proj => {
        let raw-items = proj.at("items", default: ())
        let items = if config.max-proj-items != none and raw-items.len() > config.max-proj-items {
          raw-items.slice(0, config.max-proj-items)
        } else {
          raw-items
        }
        (
          date: proj.at("date", default: ""),
          title: proj.title,
          subtitle: proj.at("tech", default: none),
          url: proj.at("url", default: none),
          location: "",
          items: items,
        )
      }),
      highlight-first: false,
    )
  ]
}

#let render-education = {
  if education != none and education.len() > 0 [
    #section-header("education", "Education", rule: true)
    #timeline-block(
      education.map(edu => (
        date: edu.at("date", default: ""),
        title: edu.school,
        subtitle: edu.degree,
        location: edu.at("location", default: ""),
        items: (),
      )),
      highlight-first: false,
    )
  ]
}

#let main-content = block(
  width: 100%,
  inset: (left: 9.5mm, right: 11mm),
  [
    // 1. Editorial Hero Name & Title
    #v(0.5mm)
    #let raw-name = personal.at("name", default: "YOUR NAME")
    #let disp-name = if config.titlecase-name { to-title-case(raw-name) } else { raw-name }
    #let name-parts = disp-name.split(" ").filter(p => p != "")

    #block(width: 100%, below: 2pt)[
      #stack(
        dir: ttb,
        spacing: 6.5pt,
        block[
          #set text(font: config.header-font, weight: "bold", fill: config.accent-dark)
          #set par(leading: 0.38em)
          #if config.stack-name and name-parts.len() > 1 [
            #text(size: 26pt, tracking: -0.4pt)[
              #name-parts.at(0) \
              #name-parts.slice(1).join(" ")
            ]
          ] else [
            #text(size: 24pt, tracking: -0.3pt)[#disp-name]
          ]
        ],
        if personal.at("title", default: none) != none [
          #text(
            font: config.header-font,
            size: 10pt,
            weight: "semibold",
            fill: config.accent-warm,
            tracking: 0.4pt,
          )[#personal.title]
        ],
        // Accent signature rule (warm bronze anchor bar + subtle full hairline)
        block(inset: (top: 1pt))[
          #grid(
            columns: (28pt, 1fr),
            align: (left + horizon, left + horizon),
            line(length: 100%, stroke: 2pt + config.accent-warm),
            line(length: 100%, stroke: 0.6pt + config.border-subtle),
          )
        ],
      )
    ]

    // 2. Configurable Main Sections
    #for sec in config.section-order {
      if sec == "about" { render-about } else if sec == "experience" { render-experience } else if sec == "projects" {
        render-projects
      } else if sec == "education" { render-education }
    }
  ],
)

// ----------------------------------------------------------------------------
// 7. DOCUMENT RENDER
// ----------------------------------------------------------------------------
#grid(
  columns: (config.sidebar-width, 1fr),
  sidebar-content, main-content,
)
