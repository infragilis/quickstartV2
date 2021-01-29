#!/bin/bash
# simple git update helper
# run git config --global credential.helper store
# to keep your user/pass cached
echo "What comment for the update?"
read msg
git add .
git commit -m "$msg"
git push origin master
