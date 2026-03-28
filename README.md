<div align="center">

# 📄 Dynamic Resume Framework

An engineering-focused typesetting system maintaining visual parity between traditional LaTeX and modern Typst architectures.

[![LaTeX](https://img.shields.io/badge/LaTeX-47A141?style=for-the-badge&logo=latex&logoColor=white)](https://www.latex-project.org/)
[![Typst](https://img.shields.io/badge/Typst-239DAD?style=for-the-badge&logo=typst&logoColor=white)](https://typst.app/)

</div>

---

> **Overview**
> This repository houses the source code and automated build pipeline for my professional resumes. It utilizes GitHub Actions to ensure fresh, pixel-perfect PDF and PNG outputs are always generated from source, managed efficiently to prevent repository bloat.

## 📥 Artifact Gallery

_Click on a preview image to view the high-resolution PDF directly._

| Variant                                 |                                                                             Preview                                                                             |                                                                                                                                                                                                               Downloads                                                                                                                                                                                                                |
| :-------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------------------------------------------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
| **Standard Edition**<br/>_(LaTeX)_      |                   [<img src="resume.png" width="300" alt="Standard Resume" style="border: 1px solid #ddd; border-radius: 4px;"/>](resume.pdf)                   |                [![PDF](https://img.shields.io/badge/PDF-Download-blue?style=flat-square&logo=adobeacrobatreader)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/resume.pdf?download=1)<br/><br/>[![PNG](https://img.shields.io/badge/PNG-Download-green?style=flat-square&logo=image)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/resume.png?download=1)                |
| **No Image Edition**<br/>_(LaTeX)_      |          [<img src="resume-no-image.png" width="300" alt="No Image Resume" style="border: 1px solid #ddd; border-radius: 4px;"/>](resume-no-image.pdf)          |       [![PDF](https://img.shields.io/badge/PDF-Download-blue?style=flat-square&logo=adobeacrobatreader)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/resume-no-image.pdf?download=1)<br/><br/>[![PNG](https://img.shields.io/badge/PNG-Download-green?style=flat-square&logo=image)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/resume-no-image.png?download=1)       |
| **Typst Edition**<br/>_(Experimental)_  |              [<img src="typst-resume.png" width="300" alt="Typst Resume" style="border: 1px solid #ddd; border-radius: 4px;"/>](typst-resume.pdf)               |          [![PDF](https://img.shields.io/badge/PDF-Download-blue?style=flat-square&logo=adobeacrobatreader)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/typst-resume.pdf?download=1)<br/><br/>[![PNG](https://img.shields.io/badge/PNG-Download-green?style=flat-square&logo=image)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/typst-resume.png?download=1)          |
| **Typst No Image**<br/>_(Experimental)_ | [<img src="typst-resume-no-image.png" width="300" alt="Typst Resume No Image" style="border: 1px solid #ddd; border-radius: 4px;"/>](typst-resume-no-image.pdf) | [![PDF](https://img.shields.io/badge/PDF-Download-blue?style=flat-square&logo=adobeacrobatreader)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/typst-resume-no-image.pdf?download=1)<br/><br/>[![PNG](https://img.shields.io/badge/PNG-Download-green?style=flat-square&logo=image)](https://media.githubusercontent.com/media/ajmalbuv/resume/refs/heads/master/typst-resume-no-image.png?download=1) |

## 🛠️ Architecture

- **Automated CI/CD:** Surgical compilations triggered on `.tex` or `.typ` updates guarantee that outputs are precisely synced with source changes.
- **Artifact Management:** Actively manages binary artifacts (`*.pdf`, `*.png`, fonts, and images) to maintain a lightweight core tree.
- **Shared Libraries:** Centralized assets under `lib/` power the Typst builds for clean, modular code abstraction.

## 💻 Local Development

### Compilation Commands

1. **LaTeX Configuration** _(Requires TeX Live)_:
   ```powershell
   latexmk -pdf resume.tex
   ```
2. **Typst Configuration**:
   ```powershell
   typst compile typst-resume.typ
   ```

### 📥 Accessing Latest Builds

The automated CI/CD pipeline ensures the highest-quality outputs are always available. You can grab the latest compiled formats tracking the master branch:

1. **Direct Download:** Click the `PDF` or `PNG` badges in the Artifact Gallery above to securely pull the artifacts via GitHub's media gateway.
2. **View Online:** Clicking on any preview image will display the full-sized PDF directly in your browser.

## 📝 Credits & Resources

- **Original Inspiration:** LaTeX template modeled after [sb2nov/resume](https://github.com/sb2nov/resume/).
