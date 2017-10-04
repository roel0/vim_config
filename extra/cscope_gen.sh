#!/bin/sh
find $PWD -name '*.py' \
-o -iname '*.[CH]' \
-o -iname '*.[groovy]' \
> cscope.files

# -b: just build
# -q: create inverted index
# -c: uncompressed
cscope -b -q -c
# cleanup
rm cscope.files
