# Build dtool best practice guide from Wiki

## Requirements

Follows https://pianomanfrazier.com/post/write-a-book-with-markdown/

Requires

* Haskell Tool Stack, https://docs.haskellstack.org/en/stable/README/#how-to-install
* pandoc
* pandoc-crossref, https://github.com/lierdakil/pandoc-crossref
* xelatex
* Eisvogel pandoc LatTeX template, https://github.com/Wandmalfarbe/pandoc-latex-template

## Setup

on Ubuntu 20.04

```bash
# install system dependencies (ubuntu)
sudo apt install -y librsvg2-bin texlive-xetex texlive-fonts-recommended texlive-fonts-extra

# install stack, requires root
curl -sSL https://get.haskellstack.org/ | sh

# install pandoc
git clone https://github.com/jgm/pandoc
cd pandoc
git checkout 2.16.2
stack setup
stack install

# install pandoc-crossref
git clone https://github.com/lierdakil/pandoc-crossref.git
cd pandoc-crossref
git checkout v0.3.12.1a 
stack install
```

Also, place the LaTeX template within the `template` subfolder. 
Look at `template/get_template.sh` for this purpose.

## Build

Run `make all` or just `make pdf` or `make html`.

Currently, HTML output does not embed images.
