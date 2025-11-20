# Systems Programming (2014–2015)

This repository contains teaching materials for the **Systems Programming** course (academic year 2014–2015) by [Raphael Poss](https://raphaelposs.com).

The materials are written in reStructuredText (reST) and can be rendered to HTML, PDF, and plain text. The course covers systems programming in C and related tooling from both a **process** and **system** perspective (Unix process model, system calls, virtual memory, IPC, signals, file systems, networking, build tools, debugging, etc.).

---

## Contents

- **Course overview** (`src/overview.rst`)
  - High‑level description of the course
  - Lecture topics
  - Assignment list and deadlines
  - Grading scheme (including bonus assignments and participation)
  - Work‑organization guidance and the “P‑factor” explanation
- **C coding standard** (`src/cstd.rst`)
  - Coding style and conventions required for the assignments
- **Quick start assessment** (`src/test1.rst`)
  - Introductory / diagnostic assignment
- **Programming assignments** (11 documents in `src/`)
  - `minic.rst` – Get to know C / libraries
  - `mystr.rst` – Strings, pointers
  - `myconv.rst` – Arithmetic
  - `mystream.rst` – Buffering, syscalls
  - `myprintf.rst` – `va_args`
  - `myheap.rst` – Virtual memory (bonus)
  - `myls.rst` – File system, `stat`, options
  - `sigcopy.rst` – Signals and side channels
  - `mytftpd.rst` – Network sockets, time
  - `cryptserv.rst` – Unix domain sockets, `select`
  - `minishell.rst` – Process control (bonus)

The `work/` directory contains assorted support files such as grading scripts, example code, and archived student submissions; these are not part of the rendered course handouts but are useful for course administration and demos.

---

## Directory layout

- `src/`
  - Source `.rst` files for the course overview, coding standard, quick start, and all assignments.
- `build/`
  - Generated outputs: `.html`, `.pdf`, and `.txt` for each document.
  - A `Makefile` to build all rendered variants from the sources in `src/`.
- `aux/`
  - LaTeX and CSS support files used when rendering PDF and HTML (e.g., `base.sty`, syntax‑highlighting styles, LaTeX template).
- `work/`
  - Internal course material: example code, tests, grading scripts, and archived submissions.

---

## Building the documentation

You need the following tools installed:

- `latexmk` with a LaTeX distribution (for PDFs)
- `rst2html` and `rst2latex` from Docutils (for HTML and LaTeX generation)
- A POSIX shell and `make`

From the `build/` directory:

```bash
cd build
make
```

This will regenerate, for each document listed in the `Makefile`:

- `*.txt` – a plain‑text copy of the source `.rst`
- `*.html` – HTML with syntax highlighting and course CSS
- `*.pdf` – typeset PDF via LaTeX

The `index.html` and `index.txt` files provide an automatically generated index of all course documents with links to HTML, PDF, and plain‑text versions.

To clean generated files:

```bash
cd build
make clean
```

---

## License

Unless otherwise noted in subdirectories, the written course materials are:

> Copyright © 2014, [Raphael Poss](https://raphaelposs.com).
>
> Permission is granted to distribute, reuse and modify this document and other documents for the Systems Programming course by the same author according to the terms of the **Creative Commons Attribution‑ShareAlike 4.0 International License (CC BY‑SA 4.0)**.

For details, see the license text at:

- `http://creativecommons.org/licenses/by-sa/4.0/`
