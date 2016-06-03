#!/bin/sh
find $PWD -name '*.py' \
-o -iname '*.[CH]' \
> cscope.files

# -b: just build
# -q: create inverted index
# -c: uncompressed
cscope -b -q -c
# cleanup
rm cscope.files
