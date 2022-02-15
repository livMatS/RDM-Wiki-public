#!/bin/bash
# download and unpack template
VERSION="2.0.0"
NAME="Eisvogel-${VERSION}"
TAR_ARCHIVE="${NAME}.tar.gz"
wget "https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v${VERSION}/${TAR_ARCHIVE}"
tar -xf "${TAR_ARCHIVE}"

# apply patch to disable figure captions originally created with
#   diff -u eisvogel.latex.bkp eisvogel.latex > eisvogel.patch
patch eisvogel.latex eisvogel.patch
