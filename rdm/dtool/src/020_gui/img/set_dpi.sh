#!/bin/bash
cp orig/*.png .
# pandoc/latex use dpi information for determining graphics width and
# height on page, set to reasonable value
mogrify -units pixelsperinch -density 180 *.png
