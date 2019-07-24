#!/bin/sh
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
git config --global alias.l "log --oneline --graph"
git config --global alias.ls 'log --graph --pretty=format:"%h <%an> %ar %s"'

git config --global user.email "XXX@YYY"
git config --global user.name "XXX YYY"

git config --local user.email "XXX@YYY"
git config --local user.name "XXX YYY"

ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa
