#!/bin/sh
## Script to install a vim configuration
## Copyright (C) 2016 Roel Postelmans - All Rights Reserved
## Permission to copy and modify is granted under the foo license
## Last revised 12/02/2016
##
## Usage: sh ./install.sh [options] ARG1
##
## Options:
##   -h, --help       Display this message.
##   -n               Dry-run; only show what would be done.
##   -d, --dest ARG   Installation directory
##

INSTALL_TO=~
DRYRUN=0
plugin_name=(
   "NerdTree"
   "Gundo"
   "Neocomplcache"
   "Pathogen"
   "CtrlP"
   "CCtree"
   "Cscope_maps"
   "Taglist"
   )
plugin_loc=(
   "https://github.com/scrooloose/nerdtree"
   "https://github.com/sjl/gundo.vim"
   "https://github.com/Shougo/neocomplcache.vim"
   "https://github.com/tpope/vim-pathogen"
   "https://github.com/ctrlpvim/ctrlp.vim"
   "https://github.com/hari-rangarajan/CCTree"
   "https://github.com/chazy/cscope_maps"
   "https://github.com/vim-scripts/taglist.vim"
   )
color_name=(
  "peaksea"
  )
color_loc=(
  "https://github.com/vim-scripts/peaksea"
  )
dir=(
  "swap"
  "undo"
  "backup"
  )
print_help() {
  echo "Options:"
  echo "   -h, --help       Display this message."
  echo "   -n               Dry-run; only show what would be done."
  echo "   -d, --dest ARG   Installation directory"
}

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

ok() {
    echo -e '\E[32m'"\033[1m[ OK ]\033[0m"
}

failed() {
    echo -e '\E[31m'"\033[1m[ FAILED ]\033[0m"
}

function _assert_fail () {
    if [ $DRYRUN -eq 0 ]; then
      "$@" > /dev/null 2>/tmp/roel0_err
    fi
}
function assert_fail () {
    if [ $DRYRUN -eq 1 ]; then
        ok
    else
      if "$@" > /dev/null 2>/tmp/roel0_err; then
         ok
      else
          failed
          ERR_OUTPUT=$(</tmp/roel0_err)
          echo ${ERR_OUTPUT}
          rm -rf .roel0
          exit
      fi
    fi
}
install_vimrc () {
    if [ $DRYRUN -eq 0 ] && [  -e "$INSTALL_TO/.vimrc" ]; then
        warn "WARNING $INSTALL_TO/vimrc already exists!"
        read -p "Do you wish to overwrite this configuration? [yes/no] " yn
        case $yn in
            [Yy]* ) 
            break
            ;;
            [Nn]* ) 
            exit
            ;;
            * ) 
            echo "Please answer yes or no."
            install_vimrc
            exit
            ;;
        esac
        echo -n "Removing old configuration..."
        assert_fail rm -rf $INSTALL_TO/.vim
    fi
    if [ ! -e "$INSTALL_TO/.vim" ]; then
      echo -n "Creating .vim dir in ${INSTALL_TO} ..."
      assert_fail mkdir $INSTALL_TO/.vim
    fi
    echo -n "Updating vimrc..."
    assert_fail git pull
    echo -n "Copying vimrc to install dir..."
    assert_fail cp ./vimrc $INSTALL_TO/.vimrc
    echo -n "Creating tempory directory..."
    assert_fail mkdir ./.roel0
    _assert_fail cd .roel0

    count=0
    while [ "x${plugin_name[count]}" != "x" ]
    do
        echo -n "Downloading ${plugin_name[count]} plugin..."
        assert_fail git clone ${plugin_loc[count]}
        _assert_fail rm -rf */.git*
        _assert_fail rm -rf */.hg*
        _assert_fail cd *
        echo -n "Installing ${plugin_name[count]} plugin..."
        assert_fail cp -r ./* $INSTALL_TO/.vim
        _assert_fail cd ..
        echo -n "Removing tempory files..."
        assert_fail rm -rf ./*
        count=$(( $count + 1 ))
      done

    count=0
    while [ "x${color_name[count]}" != "x" ]
    do
        echo -n "Downloading ${color_name[count]} colorscheme..."
        assert_fail git clone ${color_loc[count]}
        _assert_fail rm -rf */.git*
        _assert_fail rm -rf */.hg*
        _assert_fail cd *
        echo -n "Installing ${color_name[count]} color..."
        assert_fail cp -r ./* $INSTALL_TO/.vim
        _assert_fail cd ..
        echo -n "Removing tempory files..."
        assert_fail rm -rf ./*
        count=$(( $count + 1 ))
      done

    count=0
    while [ "x${dir[count]}" != "x" ]
    do
        echo -n "Creating directory for ${dir[count]}s..."
        assert_fail mkdir $INSTALL_TO/.vim/${dir[count]}
        count=$(( $count + 1 ))
    done

    echo -n "Removing temp dir..."
    _assert_fail cd ..
    assert_fail rm -rf ./.roel0
    echo -n "Installing colorsheme..."
    assert_fail cp -r ./vim/colors $INSTALL_TO/.vim
    echo -e "\nInstallation finished, have fun!"
}

# Argument Parsing
while [[ $# > 0 ]]
do
    key="$1"
    case $key in
        -h|--help)
        print_help
        exit
        ;;
        -n)
        DRYRUN=1
        ;;
        -d|--dest)
        if [ $2 ] && [ -e $2 ]; then
          INSTALL_TO="$2"
        else
          echo "Please specify a destination"
          echo " "
          print_help
          exit
        fi
        shift
        ;;
        *)
        echo 'Unknown option ${1}'
        print_help
        exit
        ;;
      esac
    shift
done

install_vimrc
