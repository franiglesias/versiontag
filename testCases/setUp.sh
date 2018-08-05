#!/usr/bin/env bash

printf "\e[90m"
printf '%s\n' ">>> Preparing scenario..."
printf "\e[0m";

rm -rf ../testRepo
mkdir ../testRepo
cd ../testRepo

git init > /dev/null 2>&1
git remote add origin ../testRemote/.git
git commit -m 'init' --allow-empty > /dev/null 2>&1

rm -rf ../testRemote
mkdir ../testRemote

cp -r .git ../testRemote > /dev/null 2>&1
git checkout -B test > /dev/null 2>&1
