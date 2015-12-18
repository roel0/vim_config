#!/bin/sh
find . -name '*.py' \
-o -iname '*.[CH]' \
> cscope.files

# -b: just build
# -q: create inverted index
cscope -b -q
