#set document(
  title: "Ajmal Basheer's Resume",
  author: "Ajmal Basheer",
)

#set page(
  paper: "a4",
  margin: (x: 0.5in, y: 0.5in),
)

#set text(
  font: "Arial",
  size: 11pt,
  fill: rgb("#000000"),
  hyphenate: false,
)

#let icons(path) = box(
  image(
    bytes(
      "<svg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='currentColor' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'>"
        + path
        + "</svg>",
    ),
    width: 10pt,
  ),
)

#let icon-phone = icons(
  "<path d='M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l2.28-2.28a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z'></path>",
)
#let icon-mail = icons(
  "<rect width='20' height='16' x='2' y='4' rx='2'></rect><path d='m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7'></path>",
)
#let icon-linkedin = icons(
  "<path d='M16 8a6 6 0 0 1 6 6v7h-4v-7a2 2 0 0 0-2-2 2 2 0 0 0-2 2v7h-4v-7a6 6 0 0 1 6-6z'></path><rect width='4' height='12' x='2' y='9'></rect><circle cx='4' cy='4' r='2'></circle>",
)
#let icon-github = icons(
  "<path d='M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4'></path><path d='M9 18c-4.51 2-5-2-7-2'></path>",
)

// Section formatting
#show heading.where(level: 1): it => {
  set text(size: 11pt, weight: "bold")
  upper(it.body)
  line(length: 100%, stroke: 0.5pt)
}

#let header() = {
  align(center)[
    #block(text(size: 24pt, weight: "bold")[AJMAL BASHEER])
    #set text(size: 9pt)
    #icon-phone #h(1pt) #link("tel:+919496444520")[#underline[+91 9496444520]]
    #h(5pt) | #h(5pt)
    #icon-mail #h(1pt) #link("mailto:ajmalbuv\@gmail.com")[#underline[ajmalbuv\@gmail.com]]
    #h(5pt) | #h(5pt)
    #icon-linkedin #h(1pt) #link("https://linkedin.com/in/ajmalbuv")[#underline[linkedin.com/in/ajmalbuv]]
    #h(5pt) | #h(5pt)
    #icon-github #h(1pt) #link("https://github.com/ajmalbuv")[#underline[github.com/ajmalbuv]]
  ]
}

#let heading(title) = {
  std.heading(level: 1)[#title]
}

#let subheading(title, location, subtitle, date) = {
  grid(
    columns: (1fr, auto),
    row-gutter: 3.5pt,
    text(weight: "bold")[#title], text(weight: "bold", size: 10pt)[#location],
    text(style: "italic", size: 10pt)[#subtitle], text(style: "italic", size: 10pt)[#date],
  )
}

#let project(title, tech, date) = {
  grid(
    columns: (1fr, auto),
    row-gutter: 3.5pt,
    stack(dir: ltr, text(weight: "bold", size: 10pt)[#title], [ | ], text(style: "italic", size: 10pt)[#tech]),
    text(weight: "bold", size: 10pt)[#date],
  )
}

#let items(..bodies) = {
  set list(indent: 0.15in, marker: [-])
  for body in bodies.pos() {
    list.item(text(size: 10pt)[#body])
  }
}

#header()

#v(10pt)
#heading("Summary")
#block(inset: (left: 0.15in))[
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
#block(inset: (left: 0.15in))[
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
