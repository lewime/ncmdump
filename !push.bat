@echo off
cd /d %~dp0
title GitÍÆËÍ

rd /s /q .git
rd /s /q taglib

git init
git submodule add https://github.com/taglib/taglib taglib
git add .
git commit -m "update"
git branch -M main
git remote add origin git@github.com:lewime/ncmdump.git
git push -f origin main

pause&exit
