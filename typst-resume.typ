// The font families used in this resume.
#let primary-font = "Arial"
#let secondary-font = "Arial"

// The primary color used in this resume.
#let primary-color = rgb("#222222")

// Set the document's basic properties.
#set document(
  title: "Ajmal Basheer's Resume",
  author: "Ajmal Basheer",
)

// Set the page properties.
#set page(
  paper: "a4",
  margin: (x: 1.2cm, y: 1cm),
)

// Configure paragraph properties.
#set par(
  justify: true,
  leading: 0.65em,
  first-line-indent: 0pt,
  hanging-indent: 0pt,
)

// Configure text properties.
#set text(
  fill: primary-color,
  font: secondary-font,
  size: 10pt,
  hyphenate: false,
  fallback: true,
)

// Configure heading properties.
#show heading: set text(
  font: primary-font,
  weight: "bold",
)

// Define a custom section heading.
#let section(body) = {
  // Add vertical spacing before the section.
  v(1.2em, weak: true)

  // Set the text properties for the section heading.
  text(
    size: 1.2em,
    weight: "bold",
    body,
  )

  // Add a line below the section heading.
  line(
    length: 100%,
    stroke: 0.5pt,
  )

  // Add vertical spacing after the section heading.
  v(0.8em, weak: true)
}

// Define a custom function for the resume header.
#let header(name, phone, email, linkedin, github, photo) = {
  // Create a grid with two columns.
  grid(
    columns: (auto, 1fr),
    gutter: 1cm,
    // The first column contains the photo.
    image(
      photo,
      width: 1.5cm,
      height: 1.5cm,
      fit: "cover",
    ),
    // The second column contains the contact information.
    align(
      center,
      stack(
        dir: ttb,
        spacing: 0.5em,
        // The name is a link to the personal website.
        link(
          "https://ajmalbuv.github.io",
          text(
            font: primary-font,
            weight: "bold",
            size: 2em,
            name,
          ),
        ),
        // The contact information is a set of links.
        stack(
          dir: ltr,
          spacing: 0.5em,
          link("tel:" + phone, phone),
          "|",
          link("mailto:" + email, email),
          "|",
          link("https://linkedin.com/in/" + linkedin, "linkedin.com/in/" + linkedin),
          "|",
          link("https://github.com/" + github, "github.com/" + github),
        ),
      ),
    ),
  )
}

// Define a custom function for a resume subheading.
#let subheading(title, subtitle, location, date) = {
  // Create a grid with two columns.
  grid(
    columns: (1fr, auto),
    // The first column contains the title and subtitle.
    stack(
      dir: ttb,
      text(weight: "bold", title),
      text(style: "italic", subtitle),
    ),
    // The second column contains the location and date.
    align(
      right,
      stack(
        dir: ttb,
        text(weight: "bold", location),
        text(style: "italic", date),
      ),
    ),
  )
}

// Define a custom function for a project heading.
#let project-heading(title, url, languages, date) = {
  // Create a grid with two columns.
  grid(
    columns: (1fr, auto),
    // The first column contains the title, link, and languages.
    stack(
      dir: ltr,
      spacing: 0.5em,
      text(weight: "bold", link(url, title)),
      "|",
      text(style: "italic", languages),
    ),
    // The second column contains the date.
    align(
      right,
      text(weight: "bold", date),
    ),
  )
}

// Define a custom function for a list of items.
#let item-list(..items) = {
  // Create a list with the given items.
  list(
    ..items.pos().map(item => {
      // Add vertical spacing between items.
      v(0.5em, weak: true)
      item
    }),
  )
}

// Create the header.
#header(
  "AJMAL BASHEER",
  "+91 9496444520",
  "ajmalbuv@gmail.com",
  "ajmalbuv",
  "ajmalbuv",
  "photo.jpg",
)

// Create the summary section.
#section("Summary")
Full-stack developer with expertise in Python, Django, PostgreSQL, and Flutter. Experienced in designing and deploying scalable applications with optimized performance and security. Proven ability to enhance system efficiency, streamline development workflows, and contribute to high-availability cloud deployments. Passionate about delivering high-quality software solutions in dynamic IT environments.

// Create the education section.
#section("Education")
#subheading(
  "Krupanidhi Degree College",
  "Bachelor of Computer Applications",
  "Bengaluru, Karnataka",
  "Aug. 2021 -- July 2024",
)
#subheading(
  "MIC Higher Secondary School",
  "Commerce",
  "Malappuram, Kerala",
  "June 2017 -- March 2019",
)

// Create the experience section.
#section("Experience")
#subheading(
  "WIMD Technologies Pvt Ltd",
  "Software Engineer Intern",
  "Bengaluru, Karnataka",
  "May 2024 -- June 2024",
)
#item-list(
  [Completed a ten-day internship at *WIMD Technologies Pvt Ltd*, gaining hands-on experience with industry-standard tools and real-world development workflows.],
  [*API Development:* Designed and implemented RESTful APIs using Node.js with JWT authentication and role-based access control to ensure secure data exchange.],
  [*Database Optimization:* Assisted in designing and indexing MongoDB databases, improving query performance and data retrieval efficiency.],
  [*API Testing & Debugging:* Automated and executed API tests using Postman, identifying and resolving issues across CRUD operations.],
  [*Collaborative Development:* Engaged in code reviews and debugging, enhancing system stability and API/database integration.],
)
#subheading(
  "ETAYA INNOVATIONS Pvt Ltd",
  "Flutter Developer",
  "Bengaluru, Karnataka",
  "Nov 2024 -- Present",
)
#item-list(
  [Working as a full-time Flutter developer at *ETAYA INNOVATIONS Pvt Ltd*, developing and maintaining cross-platform mobile applications for Android and iOS using Flutter and Dart.],
  [*Flutter App Development:* Designed and built scalable, high-performance mobile applications, implementing clean architecture, provider-based state management, and custom UI components.],
  [*Backend Integration and API Handling:* Integrated RESTful APIs and Firebase services for real-time data synchronization, authentication, push notifications, and secure cloud storage.],
  [*Performance Optimization:* Improved app efficiency by optimizing widget rebuilds, implementing lazy loading, and reducing API call overhead, resulting in smoother UI interactions and faster load times.],
  [*Testing and Debugging:* Conducted automated and manual testing using Flutter’s testing framework and Firebase Crashlytics to identify and resolve UI inconsistencies, crashes, and performance bottlenecks.],
  [*Agile Development and Collaboration:* Worked in an Agile environment, participating in sprint planning, peer code reviews, and cross-functional team collaborations to deliver feature-rich applications on time.],
)

// Create the projects section.
#section("Projects")
#project-heading(
  "EduManage",
  "https://github.com/ajmalbuv/EduManage",
  "Python, Django, PostgreSQL, Docker",
  "July 2024",
)
#item-list(
  [*Developed and Deployed Scalable Web Application:* Built an end-to-end web application using Django and PostgreSQL, enhancing data management and administrative efficiency for users.],
  [*Cross-Platform Deployment for High Availability:* Implemented on an Ubuntu VPS with Gunicorn and Certbot for SSL, as well as Vercel using serverless functions, ensuring 99%+ uptime.],
  [*Optimized Database and Security:* Designed efficient database schemas and deployed SSL encryption to secure user data, achieving a 30% improvement in query performance.],
  [*Collaborative Version Control:* Leveraged GitHub for collaborative development, enhancing workflow efficiency and documentation for seamless project management.],
)

// Create the skills and competencies section.
#section("Skills & Competencies")
#item-list(
  [*Full Stack Development*: Python, Django, JavaScript, React.js, Node.js, REST APIs],
  [*Mobile & UI Development*: Flutter, Dart, HTML5, NextJs, React, Angular],
  [*Databases & Cloud*: PostgreSQL, MongoDB, Firebase, Oracle Cloud],
  [*DevOps & Deployment*: Docker, Git, Vercel, Ubuntu VPS, CI/CD Pipelines],
  [*Testing & Debugging*: Postman, Quality Assurance, UI Testing],
  [*Performance & Optimization*: API Optimization, Query Performance Tuning],
)