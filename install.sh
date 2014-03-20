#!/bin/bash
# For test
# echo 'if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi' >> ~/test.profile

# 0. Define enviorment variables
profiles='.bash_env
.bash_profile
.bashrc
.gitconfig
.minttyrc'
homebakdir=${HOME}/.cyghome/bak/`date +%Y%m%d_%H%M%S`/home
homesrcdir=${HOME}/.cyghome/home

# 1. Backup old profiles
mkdir -p ${homebakdir}
for profile in ${profiles}
do
  cp ${HOME}/${profile} ${homebakdir}
done

# 2. Replace old profiles using new profiles
for profile in ${profiles}
do
  cp ${homesrcdir}/${profile} ${HOME}
done

# 3. Add some link
# for driver in /cygdrive/*
# do
#   ln -s $driver `basename $driver`
# done