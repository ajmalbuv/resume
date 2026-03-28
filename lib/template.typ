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
  body-font: "Arial",
  header-font: "Montserrat",
  accent-color: rgb("#222222"),
  body,
) = {
  // --- Page Setup ---
  set document(title: personal.at("name", default: "Resume"), author: personal.at("name", default: ""))
  set page(
    paper: "a4",
    margin: (x: 1.25cm, top: 0.7cm, bottom: 0.9cm),
  )
  set text(font: body-font, size: 11pt, fill: accent-color, fallback: true)
  set par(justify: true, leading: 0.54em)

  // --- Styles ---
  show heading.where(level: 1): it => {
    set text(size: 11pt, weight: "bold")
    v(4pt)
    smallcaps(it.body)
    v(-8pt)
    line(length: 100%, stroke: 0.5pt)
    v(2pt)
  }

  // --- Helper Functions ---
  let section(title) = heading(level: 1, title)

  let subheading(title, location, subtitle, date) = {
    grid(
      columns: (1fr, auto),
      row-gutter: 4pt,
      text(weight: "bold")[#title], align(right, text(weight: "bold", size: 10pt)[#date]),
      text(style: "italic", size: 10pt)[#subtitle], align(right, text(style: "italic", size: 10pt)[#location]),
    )
  }

  let project_item(title, tech, date, url: none) = {
    grid(
      columns: (1fr, auto),
      row-gutter: 4pt,
      stack(
        dir: ltr,
        spacing: 3pt,
        if url != none and url != "" { link(url)[#underline(text(weight: "bold", size: 10pt)[#title])] } else {
          text(weight: "bold", size: 10pt)[#title]
        },
        if tech != none and tech != "" { [ | ] },
        if tech != none and tech != "" { text(style: "italic", size: 10pt)[#tech] },
      ),
      align(right, text(weight: "bold", size: 10pt)[#date]),
    )
  }

  let list_items(bodies) = {
    if bodies != none and bodies.len() > 0 {
      set list(indent: 0.38cm, marker: [–], spacing: 5pt)
      for body in bodies {
        list.item(text(size: 10pt)[#body])
      }
    }
  }

  // --- Header ---
  let contact_block = {
    let items = ()
    if personal.at("phone", default: none) != none {
      items.push(contact-item("phone", "tel:" + personal.phone, personal.phone))
    }
    if personal.at("email", default: none) != none {
      if items.len() > 0 { items.push([|]) }
      items.push(contact-item("mail", "mailto:" + personal.email, personal.email))
    }
    if personal.at("linkedin", default: none) != none {
      if items.len() > 0 { items.push([|]) }
      items.push(contact-item("linkedin", "https://" + personal.linkedin, personal.linkedin))
    }
    if personal.at("github", default: none) != none {
      if items.len() > 0 { items.push([|]) }
      items.push(contact-item("github", "https://" + personal.github, personal.github))
    }
    stack(dir: ltr, spacing: 5pt, ..items)
  }

  let name_display = {
    let name_text = personal.at("name", default: "YOUR NAME")
    let website = personal.at("website", default: none)
    if website != none and website != "" {
      link(website)[#text(size: 25pt, weight: "bold")[#smallcaps(name_text)]]
    } else {
      text(size: 25pt, weight: "bold")[#smallcaps(name_text)]
    }
  }

  if photo != none {
    grid(
      columns: (auto, 1fr),
      column-gutter: 15pt,
      align: (left + horizon, center + horizon),
      box(
        stroke: white + 0.4pt,
        inset: 3pt,
        photo,
      ),
      [
        #set text(font: header-font)
        #name_display
        #v(-2pt)
        #set text(size: 10pt, font: body-font)
        #contact_block
      ],
    )
  } else {
    align(center)[
      #set text(font: header-font)
      #name_display
      #v(-10pt)
      #set text(size: 10pt, font: body-font)
      #contact_block
    ]
  }

  v(2pt)

  if summary != none and summary != "" {
    section("Summary")
    block(inset: (left: 0.38cm))[
      #set text(size: 10pt)
      #summary
    ]
  }

  if education != none and education.len() > 0 {
    section("Education")
    for edu in education {
      subheading(edu.school, edu.at("location", default: ""), edu.degree, edu.date)
    }
  }

  if experience != none and experience.len() > 0 {
    section("Experience")
    for exp in experience {
      subheading(exp.company, exp.at("location", default: ""), exp.role, exp.date)
      list_items(exp.at("items", default: ()))
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
    block(inset: (left: 0.35cm))[
      #set text(size: 10pt)
      #stack(
        dir: ttb,
        spacing: 4pt,
        ..skills.pairs().map(((cat, val)) => [*#cat*: #val]),
      )]
  }
}
