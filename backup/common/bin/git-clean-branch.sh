#!/bin/bash

git remote -v | grep 'origin    git@github.com:XXXX'

git checkout master
git fetch --prune
sleep 1
git branch --merged | egrep -v 'master|\*' | xargs git branch -d

git fetch upstream && git merge upstream/master
git push origin master
