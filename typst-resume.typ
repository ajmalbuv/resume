#import "lib/icons.typ": icon
#import "lib/contact.typ": contact-item

#set document(
  title: "Ajmal Basheer's Resume",
  author: "Ajmal Basheer",
)

#set page(
  paper: "a4",
  margin: (x: 1.25cm, top: 0.7cm, bottom: 0.9cm),
)

#set par(
  justify: true,
  leading: 0.54em,
  first-line-indent: 0pt,
  hanging-indent: 0pt,
)

#set text(
  font: ("Helvetica", "Arial", "Roboto"),
  size: 11pt,
  fill: rgb("#222222"),
  hyphenate: false,
  fallback: true,
)

#let commonSize = 9.5pt

#show heading.where(level: 1): it => {
  set text(size: 11pt, weight: "bold")
  v(4pt)
  smallcaps(it.body)
  v(-5pt)
  line(length: 100%, stroke: 0.5pt)
  v(2pt)
}


#let header(photo) = {
  grid(
    columns: (auto, 1fr),
    column-gutter: 3.5pt,
    image(photo, width: 45pt, height: 45pt, fit: "cover"),
    align(center + horizon)[
      #set text(font: "Montserrat")
      #link("https://ajmalbuv.github.io")[
        #text(size: 20pt, weight: "bold")[#smallcaps("Ajmal Basheer")]
      ]
      #set text(size: commonSize, font: ("Helvetica", "Arial", "Roboto"))
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

#let subheading(title, location, subtitle, date) = {
  grid(
    columns: (1fr, auto),
    row-gutter: 1.5pt,
    text(weight: "bold")[#title], align(right, text(weight: "bold", size: commonSize)[#location]),

    text(style: "italic", size: commonSize)[#subtitle], align(right, text(style: "italic", size: commonSize)[#date]),
  )
}

#let project(title, tech, date) = {
  grid(
    columns: (1fr, auto),
    row-gutter: 1.5pt,
    stack(
      dir: ltr,
      spacing: 3pt,
      text(weight: "bold", size: commonSize)[#title],
      [ | ],
      text(style: "italic", size: commonSize)[#tech],
    ),
    align(right, text(weight: "bold", size: commonSize)[#date]),
  )
}

#let items(..bodies) = {
  set list(indent: 0.32cm, marker: [–], spacing: 1.5pt)
  bodies.pos().map(body => list.item(text(size: commonSize)[#body])).join()
}

#header("photo.jpg")

#v(2pt)
#heading("Summary")
#block(inset: (left: 0.32cm))[
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
