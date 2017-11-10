#!/bin/bash
# Author: Roel Postelmans

path="$(readlink -f ./)"
db_path=""
cwd=$(pwd)
# Search for existing database
while [[ $path != / ]];
do
    if [[ -f "cscope.out" ]]; then
        db_path=$(readlink -f .)
        break
    fi
    cd ..
    path=$(readlink -f ./)
done

#if no datase is found, try to find the root of the project
#git?
if [[ -z $db_path ]]; then
    cd $cwd
    db_path=$(git rev-parse --show-toplevel 2> /dev/null)
    parent_path=$db_path
    # Be sure we are not in a submodule
    while [[ -d $parent_path && ! -z $parent_path ]]; do
        db_path=$parent_path
        cd ..
        parent_path=$(git rev-parse --show-toplevel 2>  /dev/null)
    done
fi
#svn?
if [[ ! -d $db_path && -z $db_path ]]; then
    db_path=$(svn info . 2> /dev/null | grep -F "Working Copy Root Path:" | awk '{print $5}')
fi

#unknown kind of scm
if [[ ! -d $db_path || -z $db_path ]]; then
    return
fi


echo "Creating cscope database at $db_path"
cd $db_path

find $PWD -name '*.py' \
-o -iname '*.[CH]' \
-o -iname '*.groovy' \
> cscope.files

# -b: just build
# -q: create inverted index
# -c: uncompressed
cscope -b -q -c
# cleanup
rm cscope.files
