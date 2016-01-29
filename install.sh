#!/bin/bash

dirs=( "~/.vim/undo" "~/.vim/swap" "~/.vim/backup" )

function error_exit
{
  printf '[failed]\n'
  exit 1
}

printf '   vim_config by Roel0                \n'
printf '   version 1.0                       \n'

printf 'Updating vim configuration ... '
if !(/usr/bin/git pull > /dev/null;) then
  error_exit
fi
printf '[OK]\n'

printf 'Installing vim configuration ... '
if !(cp -r ./.vim* ~/) then
  error_exit
fi
printf '[OK]\n'

printf 'Creating configured directories ... '
for i in $dirs
do
  if !(mkdir -p $i) then
    error_exit
  fi
done
printf '[OK]\n'
