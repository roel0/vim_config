printf '   vim_config by Roel0                \n'
printf '   version 1.0                       \n'

printf 'Updating vim configuration ... '
git pull > /dev/null
printf '[OK]\n'
printf 'Installing vim configuration ... '
cp -r ./.vim* ~/
printf '[OK]\n'
