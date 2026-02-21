# CV Generation (Typst)

This folder isolates CV generation from the rest of the repository.

## Layout

```text
cv/
  cv.typ
  metadata.typ
  justfile
  brilliant-CV/
    template.typ
  modules/
    *.typ
  src/
    avatar.png
    fonts/
    logos/
  scripts/
  output/
```

## Why this is minimal

- Only files required by CV compilation are included.
- Cover letter files, single-page variants, demo metadata, and unused resources are intentionally excluded.
- `src/`, `scripts/`, and `output/` are kept inside `cv/` for clean isolation.

## Build

From `cv/`:

```bash
just compile-cv-en
just compile-cv-zh
just compile-cv-all
```

Or directly:

```bash
typst compile ./cv.typ ./output/CV-en.pdf --font-path ./src/fonts/ --input lang=en
```

You can also run VS Code tasks from this repository:

- `Compile-cv-en`
- `Compile-cv-zh`

## Fonts (macOS)

If you see warnings like `unknown font family: noto sans cjk sc`, run:

```bash
./scripts/install_fonts_macos.sh
```

## Fonts (Ubuntu)

Ubuntu installer skips installation when required fonts already exist:

```bash
./scripts/install_fonts_ubuntu.sh
```

## CI / Release

- Workflow: `.github/workflows/cv-build-release.yml`
- Build trigger: daily schedule (UTC) or manual dispatch
- Release tag: auto-generated as `yy.mm.dd` (example: `26.06.01`)
- Artifact naming: `cv-<full-git-sha>`
- Release job reuses uploaded artifact (no second compile)
- `latest` always points to the newest CV release

## Operation Guide

### 1) Local build

```bash
cd cv
just compile-cv-all
```

### 2) Trigger CI build only (no release)

- Run workflow manually from GitHub Actions (`workflow_dispatch`)

### 3) Create a release

No manual tag push is required.
The workflow creates/updates the daily release tag automatically in `yy.mm.dd` format.

The workflow will:

- build once,
- upload artifact as `cv-<git-sha>`,
- download the same artifact in release job,
- publish PDFs to GitHub Release without recompiling.
