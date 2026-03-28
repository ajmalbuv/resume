#import "lib/icons.typ": icon
#import "lib/contact.typ": contact-item

// --- Configuration ---
#let font-body = "Inter 18pt"
#let font-header = "Montserrat"
#let size-name = 20pt
#let size-section = 11pt
#let size-body = 11pt
#let size-small = 9.5pt
#let margin-x = 1.25cm
#let margin-top = 0.7cm
#let margin-bottom = 0.9cm
#let spacing-item = 5pt
#let spacing-gutter = 4pt
#let indent = 0.32cm

#set document(
  title: "Ajmal Basheer's Resume",
  author: "Ajmal Basheer",
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
      #link("https://ajmalbuv.pages.dev")[
        #text(size: size-name, weight: "bold")[#smallcaps("AJMAL BASHEER")]
      ]
      #v(-10pt)
      #set text(size: size-small, font: font-body)
      #stack(
        dir: ltr,
        spacing: 5pt,
        contact-item("phone", "tel:+919496444520", "+91 9496444520"),
        [|],
        contact-item("mail", "mailto:ajmalbuv@gmail.com", "ajmalbuv@gmail.com"),
        [|],
        contact-item(
          "linkedin",
          "https://linkedin.com/in/ajmalbuv",
          "linkedin.com/in/ajmalbuv",
        ),
        [|],
        contact-item(
          "github",
          "https://github.com/ajmalbuv",
          "github.com/ajmalbuv",
        ),
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
  Full-stack developer with expertise in Python, Django, PostgreSQL, and Flutter. Experienced in designing and deploying scalable applications with optimized performance and security. Proven ability to enhance system efficiency, streamline development workflows, and contribute to high-availability cloud deployments. Passionate about delivering high-quality software solutions in dynamic IT environments.
]

#heading("Education")
#subheading(
  "Krupanidhi Degree College",
  "Bengaluru, Karnataka",
  "Bachelor of Computer Applications",
  "Aug. 2021 -- July 2024",
)
#subheading(
  "MIC Higher Secondary School",
  "Malappuram, Kerala",
  "Commerce",
  "June 2017 -- March 2019",
)

#heading("Experience")
#subheading(
  "WIMD Technologies Pvt Ltd",
  "May 2024 -- June 2024",
  "Software Engineer Intern",
  "Bengaluru, Karnataka",
)
#items(
  [Completed a ten-day internship at *WIMD Technologies Pvt Ltd*, gaining hands-on experience with industry-standard tools and real-world development workflows.],
  [*API Development:* Designed and implemented RESTful APIs using Node.js with JWT authentication and role-based access control to ensure secure data exchange.],
  [*Database Optimization:* Assisted in designing and indexing MongoDB databases, improving query performance and data retrieval efficiency.],
  [*API Testing & Debugging:* Automated and executed API tests using Postman, identifying and resolving issues across CRUD operations.],
  [*Collaborative Development:* Engaged in code reviews and debugging, enhancing system stability and API/database integration.],
)

#subheading(
  "ETAYA INNOVATIONS Pvt Ltd",
  "Nov 2024 -- Present",
  "Flutter Developer",
  "Bengaluru, Karnataka",
)
#items(
  [Working as a full-time Flutter developer at *ETAYA INNOVATIONS Pvt Ltd*, developing and maintaining cross-platform mobile applications for Android and iOS using Flutter and Dart.],
  [*Flutter App Development:* Designed and built scalable, high-performance mobile applications, implementing clean architecture, provider-based state management, and custom UI components.],
  [*Backend Integration and API Handling:* Integrated RESTful APIs and Firebase services for real-time data synchronization, authentication, push notifications, and secure cloud storage.],
  [*Performance Optimization:* Improved app efficiency by optimizing widget rebuilds, implementing lazy loading, and reducing API call overhead, resulting in smoother UI interactions and faster load times.],
  [*Testing and Debugging:* Conducted automated and manual testing using Flutter's testing framework and Firebase Crashlytics to identify and resolve UI inconsistencies, crashes, and performance bottlenecks.],
  [*Agile Development and Collaboration:* Worked in an Agile environment, participating in sprint planning, peer code reviews, and cross-functional team collaborations to deliver feature-rich applications on time.],
)

#heading("Projects")
#project(
  underline[#link("https://github.com/ajmalbuv/EduManage")[EduManage]],
  "Python, Django, PostgreSQL, Docker",
  "July 2024",
)
#items(
  [*Developed and Deployed Scalable Web Application:* Built an end-to-end web application using Django and PostgreSQL, enhancing data management and administrative efficiency for users.],
  [*Cross-Platform Deployment for High Availability:* Implemented on an Ubuntu VPS with Gunicorn and Certbot for SSL, as well as Vercel using serverless functions, ensuring 99%+ uptime.],
  [*Optimized Database and Security:* Designed efficient database schemas and deployed SSL encryption to secure user data, achieving a 30% improvement in query performance.],
  [*Collaborative Version Control:* Leveraged GitHub for collaborative development, enhancing workflow efficiency and documentation for seamless project management.],
)

#heading("Skills & Competencies")
#block(inset: (left: 0.35cm))[
  #set text(size: 10pt)
  #stack(
    dir: ttb,
    spacing: 4pt,
    [*Full Stack Development*: Python, Django, JavaScript, React.js, Node.js, REST APIs],
    [*Mobile & UI Development*: Flutter, Dart, HTML5, CSS3, React, Angular],
    [*Databases & Cloud*: PostgreSQL, MongoDB, Firebase, Oracle Cloud],
    [*DevOps & Deployment*: Docker, Git, Vercel, Ubuntu VPS, CI/CD Pipelines],
    [*Testing & Debugging*: Postman, Crashlytics, Quality Assurance, UI Testing],
    [*Performance & Optimization*: API Optimization, Query Performance Tuning],
  )
]
