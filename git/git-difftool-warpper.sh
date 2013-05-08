#!/bin/sh
REMOTE="$(cygpath -w "${1}")";
LOCAL=${2};
echo Launching BComp.exe $REMOTE $LOCAL
"C:/Software/BeyondCompare3/BComp.exe" $REMOTE $LOCAL

