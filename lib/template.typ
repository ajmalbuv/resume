#import "icons.typ": icon
#import "contact.typ": contact-item

#let resume(
  personal: (),
  summary: none,
  education: (),
  experience: (),
  projects: (),
  skills: (),
  photo: none,
  body-font: "Roboto",
  header-font: "Montserrat",
  accent-color: rgb("#222222"),
  body,
) = {
  // --- Theme Configuration ---
  let size-margin = (x: 1.15cm, top: 0.9cm, bottom: 0.85cm)
  let size-indent = 0.35cm
  let stroke-width = 0.5pt

  // Typography
  let font-body = 10.5pt
  let font-item = 9.9pt
  let font-heading = 11pt
  let font-name = if photo == none { 30pt } else { 25pt }
  let font-contact = if photo == none { 10.2pt } else { 9.2pt }

  // Spacing
  let space-leading = 0.52em
  let space-row-gutter = 3.5pt
  let space-list = 4.6pt
  let space-contact-stack = 2.5pt
  let space-project-stack = 3pt
  let space-skills-stack = 4.2pt

  // --- Helpers ---
  let format-date(d) = if d == none { "" } else { str(d).replace("--", "–") }
  let ensure-https(u) = {
    let s = str(u)
    if s.starts-with("http://") or s.starts-with("https://") { s } else { "https://" + s }
  }
  let clean-url(u) = str(u).replace("https://", "").replace("http://", "").trim("/", at: end)

  // --- Page Setup ---
  set document(title: personal.at("name", default: "Resume"), author: personal.at("name", default: ""))
  set page(
    paper: "a4",
    margin: size-margin,
  )
  set text(font: body-font, size: font-body, fill: accent-color, hyphenate: false, fallback: true)
  set par(justify: true, leading: space-leading, spacing: 0.55em)
  set block(spacing: 0.55em)

  // --- Styles ---
  show heading.where(level: 1): it => block(
    width: 100%,
    sticky: true,
    above: 9pt,
    below: 4.5pt,
    [
      #set text(size: font-heading, weight: "bold")
      #stack(
        dir: ttb,
        spacing: 2.5pt,
        smallcaps(it.body),
        line(length: 100%, stroke: stroke-width + accent-color),
      )
    ],
  )

  // --- Helper Functions ---
  let section(title) = heading(level: 1, title)

  let subheading(title, location, subtitle, date) = block(
    width: 100%,
    sticky: true,
    above: 6pt,
    below: 3pt,
    grid(
      columns: (1fr, auto),
      row-gutter: space-row-gutter,
      text(weight: "bold", size: font-item)[#title],
      align(right, text(weight: "bold", size: font-item)[#format-date(date)]),

      text(style: "italic", size: font-item)[#subtitle],
      align(right, text(style: "italic", size: font-item)[#location]),
    ),
  )

  let project_item(title, tech, date, url: none) = block(
    width: 100%,
    sticky: true,
    above: 6pt,
    below: 3pt,
    grid(
      columns: (1fr, auto),
      row-gutter: space-row-gutter,
      stack(
        dir: ltr,
        spacing: space-project-stack,
        if url != none and url != "" {
          link(ensure-https(url))[#underline(offset: 1.6pt, stroke: 0.45pt + rgb("#666666"))[#text(
            weight: "bold",
            size: font-item,
          )[#title]]]
        } else {
          text(weight: "bold", size: font-item)[#title]
        },
        if tech != none and tech != "" { [ | ] },
        if tech != none and tech != "" { text(style: "italic", size: font-item)[#tech] },
      ),
      align(right, text(weight: "bold", size: font-item)[#format-date(date)]),
    ),
  )

  let list_items(bodies) = {
    if bodies != none and bodies.len() > 0 {
      set list(indent: size-indent, marker: [–], spacing: space-list)
      for body in bodies {
        list.item(text(size: font-item)[#body])
      }
    }
  }

  // --- Header ---
  let contact_items = ()
  if personal.at("phone", default: none) != none {
    let tel-uri = "tel:" + str(personal.phone).replace(" ", "")
    contact_items.push(contact-item("phone", tel-uri, personal.phone, icon-size: 9pt))
  }
  if personal.at("email", default: none) != none {
    contact_items.push(contact-item("mail", "mailto:" + personal.email, personal.email, icon-size: 9pt))
  }
  if personal.at("linkedin", default: none) != none {
    contact_items.push(contact-item(
      "linkedin",
      ensure-https(personal.linkedin),
      clean-url(personal.linkedin),
      icon-size: 9pt,
    ))
  }
  if personal.at("github", default: none) != none {
    contact_items.push(contact-item(
      "github",
      ensure-https(personal.github),
      clean-url(personal.github),
      icon-size: 9pt,
    ))
  }

  let contact_block = {
    let spaced = ()
    for (i, item) in contact_items.enumerate() {
      if i > 0 { spaced.push([|]) }
      spaced.push(item)
    }
    stack(dir: ltr, spacing: space-contact-stack, ..spaced)
  }

  let name_display = {
    let name_text = personal.at("name", default: "YOUR NAME")
    let website = personal.at("website", default: none)
    if website != none and website != "" {
      link(ensure-https(website))[#text(size: font-name, weight: "bold")[#smallcaps(name_text)]]
    } else {
      text(size: font-name, weight: "bold")[#smallcaps(name_text)]
    }
  }

  if photo != none {
    grid(
      columns: (auto, 1fr),
      column-gutter: 12pt,
      align: (left + horizon, center + horizon),
      box(
        stroke: 0.6pt + rgb("#D6D6D6"),
        radius: 3pt,
        clip: true,
        photo,
      ),
      stack(
        dir: ttb,
        spacing: 5pt,
        align(center)[
          #set text(font: header-font)
          #name_display
        ],
        align(center)[
          #set text(size: font-contact, font: body-font)
          #contact_block
        ],
      ),
    )
  } else {
    align(center)[
      #stack(
        dir: ttb,
        spacing: 5pt,
        align(center)[
          #set text(font: header-font)
          #name_display
        ],
        align(center)[
          #set text(size: font-contact, font: body-font)
          #contact_block
        ],
      )
    ]
  }

  v(2pt)

  if summary != none and summary != "" {
    section("Summary")
    block(inset: (left: size-indent))[
      #set text(size: font-item)
      #summary
    ]
  }

  if experience != none and experience.len() > 0 {
    section("Experience")
    for exp in experience {
      subheading(exp.company, exp.at("location", default: ""), exp.role, exp.date)
      list_items(exp.at("items", default: ()))
    }
  }

  if education != none and education.len() > 0 {
    section("Education")
    for edu in education {
      subheading(edu.school, edu.at("location", default: ""), edu.degree, edu.date)
    }
  }

  if projects != none and projects.len() > 0 {
    section("Projects")
    for proj in projects {
      project_item(proj.title, proj.at("tech", default: none), proj.date, url: proj.at("url", default: none))
      list_items(proj.at("items", default: ()))
    }
  }

  if skills != none and skills.pairs().len() > 0 {
    section("Skills & Competencies")
    block(inset: (left: size-indent))[
      #set text(size: font-item)
      #stack(
        dir: ttb,
        spacing: space-skills-stack,
        ..skills.pairs().map(((cat, val)) => [*#cat*: #val]),
      )
    ]
  }
}
