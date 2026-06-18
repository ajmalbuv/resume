#import "lib/template.typ": resume
#import "lib/data.typ": education, experience, personal, projects, skills, summary

#show: resume.with(
  personal: personal,
  summary: summary,
  education: education,
  experience: experience,
  projects: projects,
  skills: skills,
  body-font: "Roboto",
  header-font: "Montserrat",
)
