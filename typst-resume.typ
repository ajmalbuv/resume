#let small(content) = text(size: 9pt, content)

#let resumeSubheading(title, location, subtitle, date) = {
  grid(
    columns: (1fr, auto),
    gutter: 5pt,
    [*#title*], [*#small(date)*],
    [_#small(subtitle)_], [_#small(location)_],
  )
  v(-5pt)
}

#let resumeProjectHeading(title, tech, date) = {
  grid(
    columns: (1fr, auto),
    small[#title | _\#tech_], [*#small(date)*],
  )
  v(-5pt)
}

#let resumeItem(content) = {
  list.item(small[#content])
  v(-2pt)
}

#set document(
  author: "Ajmal Basheer",
  title: "Resume",
)

#set page(
  paper: "a4",
  margin: (
    left: 0.5in,
    right: 0.5in,
    top: 0.7in,
    bottom: 0.7in,
  ),
  footer: none,
)

#set text(
  font: "Montserrat",
  size: 11pt,
  hyphenate: false,
)

#set par(
  justify: false,
)

#set list(
  indent: 0.15in,
  body-indent: 0pt,
  spacing: 0pt,
)

#show heading.where(level: 1): it => [
  #set text(size: 14pt, weight: "bold")
  #smallcaps(it.body)
  #line(length: 100%, stroke: 0.5pt)
  #v(-7pt)
]

#align(center)[
  #text(size: 24pt, weight: "bold", font: "Montserrat")[
    #smallcaps[#link("https://ajmalbuv.github.io")[Ajmal Basheer]]
  ]
  #v(1pt)
  #small[
    [Phone] #link("tel:+919496444520")[+91 9496444520] |
    [Email] #link("mailto:ajmalbuv@gmail.com")[ajmalbuv\@gmail.com] |
    [LinkedIn] #link("https://linkedin.com/in/ajmalbuv")[linkedin.com/in/ajmalbuv] |
    [GitHub] #link("https://github.com/ajmalbuv")[github.com/ajmalbuv]
  ]
]

== Summary
#list[
  Full-stack developer with expertise in Python, Django, PostgreSQL, and Flutter. Experienced in designing and deploying scalable applications with optimized performance and security. Proven ability to enhance system efficiency, streamline development workflows, and contribute to high-availability cloud deployments. Passionate about delivering high-quality software solutions in dynamic IT environments.
]

== Education
#resumeSubheading(
  "Krupanidhi Degree College",
  "Bengaluru, Karnataka",
  "Bachelor of Computer Applications",
  "Aug. 2021 -- July 2024",
)
#resumeSubheading(
  "MIC Higher Secondary School",
  "Malappuram, Kerala",
  "Commerce",
  "June 2017 -- March 2019",
)

== Experience
#resumeSubheading(
  "WIMD Technologies Pvt Ltd",
  "Bengaluru, Karnataka",
  "Software Engineer Intern",
  "May 2024 -- June 2024",
)
#list[
  #resumeItem[Completed a ten-day internship at *WIMD Technologies Pvt Ltd*, gaining hands-on experience with industry-standard tools and real-world development workflows.]
  #resumeItem[*API Development:* Designed and implemented RESTful APIs using Node.js with JWT authentication and role-based access control to ensure secure data exchange.]
  #resumeItem[*Database Optimization:* Assisted in designing and indexing MongoDB databases, improving query performance and data retrieval efficiency.]
  #resumeItem[*API Testing & Debugging:* Automated and executed API tests using Postman, identifying and resolving issues across CRUD operations.]
  #resumeItem[*Collaborative Development:* Engaged in code reviews and debugging, enhancing system stability and API/database integration.]
]

#resumeSubheading(
  "ETAYA INNOVATIONS Pvt Ltd",
  "Bengaluru, Karnataka",
  "Flutter Developer",
  "Nov 2024 -- Present",
)
#list[
  #resumeItem[Working as a full-time Flutter developer at *ETAYA INNOVATIONS Pvt Ltd*, developing and maintaining cross-platform mobile applications for Android and iOS using Flutter and Dart.]
  #resumeItem[*Flutter App Development:* Designed and built scalable, high-performance mobile applications, implementing clean architecture, provider-based state management, and custom UI components.]
  #resumeItem[*Backend Integration and API Handling:* Integrated RESTful APIs and Firebase services for real-time data synchronization, authentication, push notifications, and secure cloud storage.]
  #resumeItem[*Performance Optimization:* Improved app efficiency by optimizing widget rebuilds, implementing lazy loading, and reducing API call overhead, resulting in smoother UI interactions and faster load times.]
  #resumeItem[*Testing and Debugging:* Conducted automated and manual testing using Flutter's testing framework and Firebase Crashlytics to identify and resolve UI inconsistencies, crashes, and performance bottlenecks.]
  #resumeItem[*Agile Development and Collaboration:* Worked in an Agile environment, participating in sprint planning, peer code reviews, and cross-functional team collaborations to deliver feature-rich applications on time.]
]

== Projects
#resumeProjectHeading(
  link("https://github.com/ajmalbuv/EduManage")[*EduManage*],
  "Python, Django, PostgreSQL, Docker",
  "July 2024",
)
#list[
  #resumeItem[*Developed and Deployed Scalable Web Application:* Built an end-to-end web application using Django and PostgreSQL, enhancing data management and administrative efficiency for users.]
  #resumeItem[*Cross-Platform Deployment for High Availability:* Implemented on an Ubuntu VPS with Gunicorn and Certbot for SSL, as well as Vercel using serverless functions, ensuring 99%+ uptime.]
  #resumeItem[*Optimized Database and Security:* Designed efficient database schemas and deployed SSL encryption to secure user data, achieving a 30% improvement in query performance.]
  #resumeItem[*Collaborative Version Control:* Leveraged GitHub for collaborative development, enhancing workflow efficiency and documentation for seamless project management.]
]

== Skills & Competencies
#list[
  *Full Stack Development*: Python, Django, JavaScript, React.js, Node.js, REST APIs
  *Mobile & UI Development*: Flutter, Dart, HTML5, CSS3, React, Angular
  *Databases & Cloud*: PostgreSQL, MongoDB, Firebase, Oracle Cloud
  *DevOps & Deployment*: Docker, Git, Vercel, Ubuntu VPS, CI/CD Pipelines
  *Testing & Debugging*: Postman, Crashlytics, Quality Assurance, UI Testing
  *Performance & Optimization*: API Optimization, Query Performance Tuning
]
