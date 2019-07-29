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

git config --global commit.template $HOME/.git-commit-template

# bash git prompt
# https://github.com/magicmonty/bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# github ssh key
# https://help.github.com/en/enterprise/2.16/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa

# install latest git stable builds
# https://askubuntu.com/questions/568591/how-do-i-install-the-latest-version-of-git-with-apt/568596
sudo apt-add-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git

# build vim from source
# https://github.com/ycm-core/YouCompleteMe/wiki/Building-Vim-from-source
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev

git clone https://github.com/vim/vim.git

./configure --with-features=huge \
        --enable-multibyte \
	    --enable-rubyinterp=yes \
	    --enable-pythoninterp=yes \
	    --enable-python3interp=yes \
	    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu/ \
	    --enable-perlinterp=yes \
	    --enable-luainterp=yes \
        --enable-gui=gtk2 \
        --enable-cscope \
	    --prefix=/usr/local

sudo apt remove vim-common vim-tiny

sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
sudo update-alternatives --set editor /usr/local/bin/vim
sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
sudo update-alternatives --set vi /usr/local/bin/vim
