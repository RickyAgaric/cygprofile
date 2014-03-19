#! /bin/bash

# user info
git config --global user.name "ricky"
git config --global user.email liyixa@cn.ibm.com

# color
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto

# alias
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.df diff
git config --global alias.co checkout
git config --global alias.br branch

# credential
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

# editor
git config --global core.editor ~/bin/git-core-editor.sh

# diff tool
## didn't work
git config --global diff.tool bc3
git config --global difftool.bc3.cmd "~/bin/git-difftool-wrapper.sh \"\$LOCAL\" \"\$REMOTE\""
git config --global difftool.prompt false
