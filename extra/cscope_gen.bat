dir *.c *.h *.py *.groovy /s /b > cscope.files
: -b: just build
: -q: create inverted index
: -c: uncompressed
cscope -b -q -c
: cleanup
del cscope.files
del cscope.out
