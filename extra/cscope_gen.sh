#!/bin/bash
# Author: Roel Postelmans
cscope_db="cscope.out"
db_path=""
cwd=$(pwd)

# Search for existing database
IFS='/' read -ra dirs <<< "$(pwd)"
path=
for dir in "${dirs[@]}"
do
    path+=$dir/
    if [[ -f $cscope_db && -r $cscope_db ]]; then
        db_path=$path
    fi
done

#if no datase is found, try to find the root of the project
#git?
if [[ -z $db_path ]]; then
    IFS='/' read -ra dirs <<< "$(pwd)"
    path=
    for dir in "${dirs[@]}"
    do
        path+=$dir/
        [ -d $path/.git ] && db_path=$path && break
    done
fi

#svn?
if [[ ! -d $db_path && -z $db_path ]]; then
    db_path=$(svn info . 2> /dev/null | grep -F "Working Copy Root Path:" | awk '{print $5}')
fi

#unknown kind of scm
if [[ ! -d $db_path || -z $db_path ]]; then
    echo "No project root found"
    exit
fi

echo "Creating cscope database at $db_path"
cd $db_path

find $PWD -iname '*.py' \
       -o -iname '*.[CH]' \
       -o -iname '*.js' \
       -o -iname '*.rs' \
       -o -iname '*.cs' \
       -o -iname '*.groovy' \
       -o -iname '*.java' \
       -o -iname '*.mk' \
       -o -iname 'Makefile' \
       | xargs -I {} echo '"{}" ' \
> cscope.files

# -b: just build
# -q: create inverted index
# -c: uncompressed
cscope -b -q -c
# cleanup
#rm cscope.files
cd $cwd
