#!/bin/sh
# cleanup
rm .syntastic_c_config 2> /dev/null
find -name '*.h' -printf '%h\n' | sort -u \
|  while read line ; do echo "-I${line}" >> .syntastic_c_config ; done

