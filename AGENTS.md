# AGENTS.md - Project Context

## Project Overview

This repository contains the source files for Ajmal Basheer's personal resume. It is an engineering-focused document project that maintains visual parity between two different markup languages while utilizing a sophisticated automation pipeline.

### Core Technologies

- **LaTeX**: The established industry standard for document typesetting, used for the primary resume versions.
- **Typst**: A modern, high-performance typesetting system used for experimental but pixel-perfect alternatives.
- **GitHub Actions**: Automated CI/CD for compiling sources and generating high-quality PNG previews.
- **Git LFS**: Used to manage binary build artifacts (PDFs and PNGs) without bloating the repository history.

## Directory Overview

- `.github/workflows/`: Contains `tex-workflow.yml` and `typst-workflow.yml` for automated builds.
- `.github/actions/pdf-to-png/`: A custom composite action that handles the conversion of PDF artifacts to PNG previews using `poppler-utils`.
- `lib/`: Contains shared Typst libraries, such as `icons.typ` for SVG icon management.
- `photo.jpg`: Profile image used in the resumes (tracked via Git LFS).
- `*.tex` / `*.typ`: Source files for various resume versions (with/without images).
- `*.pdf` / `*.png`: Automated build artifacts (tracked via Git LFS).

## Building and Usage

### Local Compilation

- **Typst**:
  ```powershell
  typst compile typst-resume.typ
  ```
- **LaTeX**:
  ```powershell
  # Requires a TeX Live installation (e.g., xu-cheng/texlive-full)
  latexmk -pdf resume.tex
  ```

### CI/CD Pipeline Logic

The GitHub Actions are optimized for **Surgical Accuracy** and **Performance**:

1. **Incremental Builds**: By default, only the specific `.tex` or `.typ` files modified in a commit are recompiled.
2. **Global Dependencies**: Changes to shared assets (like `photo.jpg` or the `lib/` directory) trigger a full rebuild of all relevant resumes.
3. **Manual Rebuild**: The `workflow_dispatch` trigger allows for manual full rebuilds via the GitHub Actions UI using the `rebuild_all` flag.
4. **Binary Management**: The pipeline automatically commits generated `.pdf` and `.png` files back to the repository as Git LFS pointers.

## Development Conventions

- **Modular Typst**: Use the `contact-item` helper in `lib/icons.typ` for consistent header layout and icon rendering.
- **Self-Contained Icons**: Favor embedded SVG paths in `lib/icons.typ` over external icon packages to ensure builds remain environment-agnostic.
- **Surgical CI**: When updating the build logic, ensure that the `Determine files to compile` steps in the workflows maintain their surgical precision.
- **Git LFS**: Always ensure Git LFS is installed and initialized (`git lfs install`) on your local machine before committing changes to binary files or the `.gitattributes` file.
