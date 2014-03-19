#!/bin/bash
# For test
# echo 'if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi' >> ~/test.profile

# 0. Define enviorment variables
profiles='.bash_profile
.bashrc
.gitconfig
.inputrc
.minttyrc
.profile'
homebakdir=${HOME}/.cygprofile/bak/home/`date +%Y%m%d_%H%M%S`
homesrcdir=${HOME}/.cygprofile/home
binsrcdir=${HOME}/.cygprofile/bin

# 1. Copy bin dir to home directory
cp -r ${binsrcdir} ${HOME}

# 2. Backup old profiles
mkdir ${homebakdir}
for profile in ${profiles}
do
  cp ${HOME}/${profile} ${homebakdir}
done

# 3. Replace old profiles using new profiles
for profile in ${profiles}
do
  cp ${homesrcdir}/${profile} ${HOME}
done
