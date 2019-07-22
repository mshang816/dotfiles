#!/bin/sh
# git 
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
git config --global alias.l "log --oneline --graph"
git config --global alias.ls 'log --graph --pretty=format:"%h <%an> %ar %s"'

git config --global user.email "XXX@YYY"
git config --global user.name "XXX YYY"

git config --local user.email "XXX@YYY"
git config --local user.name "XXX YYY"
git config --global core.editor "vim"

# bash git prompt
# https://github.com/magicmonty/bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
