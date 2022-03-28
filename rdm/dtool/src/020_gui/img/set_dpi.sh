#!/bin/bash
cp $1 .
file_name=$(basename $1)
# pandoc/latex use dpi information for determining graphics width and
# height on page, set to reasonable value
mogrify -units pixelsperinch -density 180 ${file_name}
