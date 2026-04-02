// --- Internal icon paths (all normalized to 24x24, fill-based) ---
#let _icons = (
  phone: "<path d='M6.6 10.8a15.05 15.05 0 006.6 6.6l2.2-2.2c.3-.3.7-.4 1.1-.3 1.2.4 2.5.6 3.9.6.6 0 1 .4 1 1V21c0 .6-.4 1-1 1C10.3 22 2 13.7 2 3c0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.4.2 2.7.6 3.9.1.4 0 .8-.3 1.1z'/>",

  linkedin: "<path d='M20.47 2H3.53a1.45 1.45 0 0 0-1.47 1.43v17.14A1.45 1.45 0 0 0 3.53 22h16.94a1.45 1.45 0 0 0 1.47-1.43V3.43A1.45 1.45 0 0 0 20.47 2M8.09 18.74h-3v-9h3ZM6.59 8.48a1.56 1.56 0 1 1 0-3.12 1.57 1.57 0 1 1 0 3.12m12.32 10.26h-3v-4.83c0-1.21-.43-2-1.52-2A1.65 1.65 0 0 0 12.85 13a2 2 0 0 0-.1.73v5h-3v-9h3V11a3 3 0 0 1 2.71-1.5c2 0 3.45 1.29 3.45 4.06Z'/>",

  github: "<path d='M12 2.247a10 10 0 0 0-3.162 19.487c.5.088.687-.212.687-.475 0-.237-.012-1.025-.012-1.862-2.513.462-3.163-.613-3.363-1.175a3.64 3.64 0 0 0-1.025-1.413c-.35-.187-.85-.65-.013-.662a2 2 0 0 1 1.538 1.025 2.137 2.137 0 0 0 2.912.825 2.1 2.1 0 0 1 .638-1.338c-2.225-.25-4.55-1.112-4.55-4.937a3.9 3.9 0 0 1 1.025-2.688 3.6 3.6 0 0 1 .1-2.65s.837-.262 2.75 1.025a9.43 9.43 0 0 1 5 0c1.912-1.3 2.75-1.025 2.75-1.025a3.6 3.6 0 0 1 .1 2.65 3.87 3.87 0 0 1 1.025 2.688c0 3.837-2.338 4.687-4.562 4.937a2.37 2.37 0 0 1 .674 1.85c0 1.338-.012 2.413-.012 2.75 0 .263.187.575.687.475A10.005 10.005 0 0 0 12 2.247'/>",

  mail: "<path d='M1.5 8.67v8.58a3 3 0 0 0 3 3h15a3 3 0 0 0 3-3V8.67l-8.928 5.493a3 3 0 0 1-3.144 0L1.5 8.67Z' /><path d='M22.5 6.908V6.75a3 3 0 0 0-3-3h-15a3 3 0 0 0-3 3v.158l9.714 5.978a1.5 1.5 0 0 0 1.572 0L22.5 6.908Z' />",

  location: "<path d='M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7Zm0 9.5A2.5 2.5 0 1 1 12 6a2.5 2.5 0 0 1 0 5.5Z'/>",
)

// --- Renderer (single source of truth) ---
#let icon(name, size: 10pt, baseline: 1.5pt) = {
  let path = _icons.at(name)

  box(
    image(
      bytes(
        "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='currentColor'>" + path + "</svg>",
      ),
      width: size,
    ),
    baseline: baseline,
  )
}


#let contact-item(name, url, label) = {
  stack(
    dir: ltr,
    spacing: 3pt,
    icon(name),
    link(url)[#underline(label)],
  )
}



// --- Configuration ---
#let font-body = "Roboto"
#let font-header = "Roboto"
#let size-name = 25pt
#let size-section = 14pt
#let size-body = 11pt
#let size-small = 11pt
#let margin-x = 1.3cm
#let margin-top = 1.3cm
#let margin-bottom = 0.9cm
#let spacing-item = 8pt
#let spacing-gutter = 6pt
#let indent = 0.32cm

#set document(
  title: "Fatima Sifna's Resume",
  author: "Fathima Sifna",
)

#set page(
  paper: "a4",
  margin: (x: margin-x, top: margin-top, bottom: margin-bottom),
)

#set par(
  justify: true,
  leading: 0.54em,
  first-line-indent: 0pt,
  hanging-indent: 0pt,
)

#set text(
  font: font-body,
  size: size-body,
  fill: rgb("#222222"),
  hyphenate: false,
  fallback: true,
)

#show heading.where(level: 1): it => {
  set text(size: size-section, weight: "bold")
  v(4pt)
  smallcaps(it.body)
  v(-8pt)
  line(length: 100%, stroke: 0.5pt)
  v(2pt)
}


#let header(photo) = {
  grid(
    columns: (15%, 1fr),
    column-gutter: 0pt,
    align: (left + horizon, center + horizon),
    box(
      stroke: white + 0.4pt,
      inset: 3pt,
      image(photo, width: 84%),
    ),
    [
      #set text(font: font-header)

      #text(size: size-name, weight: "bold")[#smallcaps("Fathima Sifna")]

      #v(-10pt)
      #set text(size: size-small, font: font-body)
      #stack(
        dir: ltr,
        spacing: 5pt,
        contact-item(
          "location",
          " ",
          "Malappuram, Kerala",
        ),[|],
        contact-item("phone", "tel:+919746049746", "+91 9746049746"),
        [|],
        contact-item("mail", "mailto:shifnashamsi@gmail.com", "shifnashamsi@gmail.com"),        
      )
    ],
  )
}
#let heading(title) = {
  std.heading(level: 1)[#title]
}

#let subheading(title, location, subtitle, date) = {
  grid(
    columns: (1fr, auto),
    row-gutter: spacing-gutter,
    text(weight: "bold")[#title], align(right, text(weight: "bold", size: size-small)[#location]),
    text(style: "italic", size: size-small)[#subtitle], align(right, text(style: "italic", size: size-small)[#date]),
  )
}

#let project(title, tech, date) = {
  grid(
    columns: (1fr, auto),
    row-gutter: spacing-gutter,
    stack(
      dir: ltr,
      spacing: 3pt,
      text(weight: "bold", size: size-small)[#title],
      [ | ],
      text(style: "italic", size: size-small)[#tech],
    ),
    align(right, text(weight: "bold", size: size-small)[#date]),
  )
}

#let items(..bodies) = {
  set list(indent: indent, marker: [–], spacing: spacing-item)
  bodies.pos().map(body => list.item(text(size: size-small)[#body])).join()
}

#header("photo.jpg")

#v(2pt)
#heading("Summary")
#block(inset: (left: indent))[
  #set text(size: 10pt)
  Motivated and detail-oriented fresher seeking a Customer Service or Office Staff role. Strong communication skills with a friendly and professional attitude. Capable of handling customer interactions, managing basic office tasks, and supporting daily operations efficiently. Quick learner with a commitment to teamwork, organization, and delivering positive customer experiences.
]

#heading("Education")
#subheading(
  "Bachelor’s Degree",
  "Kerala, India",
  "Undergraduate (Completed / Pursuing)",
  "",
)
#subheading(
  "Higher Secondary (Plus Two)",
  "Kerala, India",
  "",
  "",
)
#subheading(
  "SSLC (10th Standard)",
  "Kerala, India",
  "",
  "",
)

#heading("Skills & Competencies")
#block(inset: (left: 0.35cm))[
  #set text(size: 10pt)
  #stack(
    dir: ttb,
    spacing: 4pt,
    [*Customer Service*: Handling customer queries politely and efficiently, maintaining a positive interaction experience],
    [*Communication*: Clear verbal and basic written communication in English and Malayalam],
    [*Office Administration*: Basic office coordination, documentation, and record handling],
    [*Computer Skills*: Familiar with MS Office, basic typing, and digital tools],
    [*Time Management*: Ability to prioritize tasks and meet deadlines in a structured manner],
    [*Teamwork*: Works well in collaborative environments and supports team goals],
    [*Adaptability*: Quick learner with the ability to adapt to new tools and workflows],
  )
]

#heading("Languages")
#block(inset: (left: indent))[
  #set text(size: 10pt)
  • Malayalam (Fluent)
  • English (Basic to Intermediate)
]

#heading("Additional Information")
#items(
  [Strong interpersonal skills with a friendly and approachable personality suitable for front-office and customer-facing roles.],
  [Willing to learn and take on responsibilities in administrative and support functions.],
  [Able to handle routine office tasks such as data entry, file management, and customer follow-ups.],
)

#heading("Declaration")
#block(inset: (left: indent))[
  #set text(size: 10pt)
  I hereby declare that the information provided above is true and correct to the best of my knowledge and belief.
]

#v(6pt)
#align(right)[
  #set text(size: size-small)
  Signature: Fatima Sifna
]
