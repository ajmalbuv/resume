# AGENTS.md - Project Context

## Project Overview

This repository contains the source files for Ajmal Basheer's personal resume. It is an engineering-focused document project that has standardized on **Typst as the authoritative typesetting engine**, backed by a hardened, high-performance GitHub Actions pipeline.

### Core Technologies

- **Typst (Primary)**: Pinned to `0.15.1`. All resume variants and content are managed modularly in Typst.
- **LaTeX (Deprecated / Legacy)**: Source files (`resume.tex`, `resume-no-image.tex`) are preserved for historical reference; automated CI compilation is retired.
- **GitHub Actions**: Automated CI/CD for compiling Typst sources and generating native 300 DPI PNG previews without external poppler dependencies.
- **Git LFS**: Used to manage binary build artifacts (PDFs and PNGs) without bloating the repository history.

## Directory Overview

- `.github/workflows/typst-workflow.yml`: Hardened workflow for automated builds, PR verification, and artifact management.
- `lib/`: Contains shared Typst libraries:
  - `data.typ`: **Single source of truth** for resume data (experience, education, projects, skills).
  - `template.typ`: Resume layout template and typesetting rules.
  - `contact.typ`: Header and contact item formatting.
  - `icons.typ`: Self-contained 24x24 SVG icons.
  - `photo.jpeg`: Profile image used in resumes (tracked via Git LFS).
- `fonts/`: Bundled Roboto and Montserrat variable fonts.
- `resume.typ` / `resume-no-image.typ`: Active resume variants.
- `latex-resume.tex` / `latex-resume-no-image.tex`: Archived legacy LaTeX source files.

## Building and Usage

### Local Compilation

- **Direct Typst CLI**:
  ```bash
  typst compile --font-path fonts resume.typ resume.pdf
  typst compile --font-path fonts --ppi 300 --pages 1 resume.typ resume.png
  ```
- **Live Preview / Watch Mode**:
  ```bash
  typst watch --font-path fonts resume.typ resume.pdf
  ```

### CI/CD Pipeline Logic

The GitHub Actions workflow (`typst-workflow.yml`) is optimized for **Surgical Accuracy**, **Security**, and **Concurrency Safety**:

1. **Standardized Engine**: Pins `typst-community/setup-typst` to `0.15.1` for permanent reproducibility.
2. **Native Rendering**: Generates 300 DPI PNG previews directly via `typst compile --ppi 300 --pages 1`, eliminating external C-library dependencies (`poppler-utils`).
3. **Incremental Builds**: By default, only the specific `.typ` files modified in a commit are recompiled.
4. **Global Dependencies**: Changes to shared assets (`photo.jpeg` or `lib/**`) trigger a full rebuild of all root resumes.
5. **Deletion Safety**: If a source file is removed, compilation gracefully skips it while keeping existing `.pdf` and `.png` artifacts preserved.
6. **Concurrency Protection**: Uses concurrency groups (`typst-build-${{ github.ref }}`) to prevent racing commits and git push rejections.
7. **PR Verification**: Compiles documents on pull requests to catch syntax errors without committing artifacts.
8. **Binary Management**: Automatically commits generated `.pdf` and `.png` files back to `main` as Git LFS pointers with `[skip ci]`.

## Development Conventions

- **Single Source of Truth**: All content updates MUST be made in `lib/data.typ`.
- **Modular Typst**: Use the `contact-item` helper in `lib/contact.typ` and icons in `lib/icons.typ`.
- **Self-Contained Icons**: Favor embedded SVG paths in `lib/icons.typ` over external icon packages to ensure builds remain environment-agnostic.
- **Git LFS**: Always ensure Git LFS is installed and initialized (`git lfs install`) on your local machine before committing changes to binary files or the `.gitattributes` file.
