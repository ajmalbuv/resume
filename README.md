<div align="center">

# 📄 Resume

Clean, modular, version-controlled resumes built with **Typst**.

[![Typst](https://img.shields.io/badge/Typst-0.15.1-239DAD?style=for-the-badge&logo=typst&logoColor=white)](https://typst.app/)
[![Typst Compilation](https://github.com/ajmalbuv/resume/actions/workflows/typst-workflow.yml/badge.svg)](https://github.com/ajmalbuv/resume/actions/workflows/typst-workflow.yml)
[![LaTeX](https://img.shields.io/badge/LaTeX-Deprecated-gray?style=for-the-badge&logo=latex&logoColor=white)](https://www.latex-project.org/)

</div>

---

> **Overview**  
> This repository contains the source code and automated build pipeline for my personal resumes. **Typst is the primary typesetting system**, delivering fast compilation and native 300 DPI image rendering. PDF and PNG outputs are automatically compiled and kept in sync via GitHub Actions.
>
> _Note: Legacy LaTeX source files are retained for historical reference, but automated CI compilation for LaTeX has been decommissioned._

## 📥 Resume Versions

_Click on a preview image to view the high-resolution PDF directly._

| Variant                                                   |                                                                             Preview                                                                             |                                                                                                                                                                                                                    Downloads                                                                                                                                                                                                                    |
| :-------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| **Standard Edition**<br/>_(Primary)_      |                   [<img src="resume.png" width="300" alt="Standard Resume" style="border: 1px solid #ddd; border-radius: 4px;"/>](resume.pdf)                   |                     [![PDF](https://img.shields.io/badge/PDF-Download-blue?style=flat-square&logo=adobeacrobatreader)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/main/resume.pdf?download=1)<br/><br/>[![PNG](https://img.shields.io/badge/PNG-Download-green?style=flat-square&logo=image)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/resume.png?download=1)                      |
| **No Image Edition**<br/>_(ATS-Friendly)_ |          [<img src="resume-no-image.png" width="300" alt="No Image Resume" style="border: 1px solid #ddd; border-radius: 4px;"/>](resume-no-image.pdf)          |           [![PDF](https://img.shields.io/badge/PDF-Download-blue?style=flat-square&logo=adobeacrobatreader)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/resume-no-image.pdf?download=1)<br/><br/>[![PNG](https://img.shields.io/badge/PNG-Download-green?style=flat-square&logo=image)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/resume-no-image.png?download=1)            |
| **LaTeX Standard**<br/>_(Legacy / Deprecated)_            |              [<img src="latex-resume.png" width="300" alt="LaTeX Resume" style="border: 1px solid #ddd; border-radius: 4px;"/>](latex-resume.pdf)               |          [![PDF](https://img.shields.io/badge/PDF-Download-lightgrey?style=flat-square&logo=adobeacrobatreader)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/latex-resume.pdf?download=1)<br/><br/>[![PNG](https://img.shields.io/badge/PNG-Download-lightgrey?style=flat-square&logo=image)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/latex-resume.png?download=1)          |
| **LaTeX No Image**<br/>_(Legacy / Deprecated)_            | [<img src="latex-resume-no-image.png" width="300" alt="LaTeX No Image Resume" style="border: 1px solid #ddd; border-radius: 4px;"/>](latex-resume-no-image.pdf) | [![PDF](https://img.shields.io/badge/PDF-Download-lightgrey?style=flat-square&logo=adobeacrobatreader)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/latex-resume-no-image.pdf?download=1)<br/><br/>[![PNG](https://img.shields.io/badge/PNG-Download-lightgrey?style=flat-square&logo=image)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/latex-resume-no-image.png?download=1) |

## 🛠️ Architecture

- **Single Source of Truth:** All resume content (personal info, experience, education, skills, projects) is centrally managed in [`lib/data.typ`](lib/data.typ).
- **Standardized Compiler:** Pinned to **Typst 0.15.1** in GitHub Actions to guarantee immutable visual fidelity and backward compatibility forever.
- **Surgical CI & Non-Destructive Builds:** CI only recompiles modified files when changes are localized, does full rebuilds when shared assets (`lib/**`, `photo.jpeg`) change, and safely preserves existing artifacts without deletion if source files are removed.
- **Race-Condition-Free Automation:** Employs GitHub Actions concurrency groups and PR verification to prevent commit collisions and catch syntax errors prior to merging.

## 💻 Local Development

Use the Typst CLI for local compilation and live preview:

```bash
# Compile vector PDF
typst compile --font-path fonts resume.typ resume.pdf

# Render high-resolution 300 DPI PNG (single-page)
typst compile --font-path fonts --ppi 300 --pages 1 resume.typ resume.png

# Live preview watch mode
typst watch --font-path fonts resume.typ resume.pdf
```

## 📝 Credits & Resources

- **Original LaTeX Inspiration:** Modeled after [sb2nov/resume](https://github.com/sb2nov/resume/).
