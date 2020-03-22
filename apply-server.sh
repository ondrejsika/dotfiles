#!/bin/bash

# Bash
SYSTEM_BASHRC=/etc/bash.bashrc
echo "# Created by ondrejsika/dotfiles" > $SYSTEM_BASHRC
echo ". $(pwd)/core/3rdparty/git-prompt.sh" >> $SYSTEM_BASHRC
echo ". $(pwd)/core/3rdparty/git-completion.sh" >> $SYSTEM_BASHRC
echo ". $(pwd)/core/3rdparty/complete_alias" >> $SYSTEM_BASHRC
echo ". $(pwd)/core/bashrc" >> $SYSTEM_BASHRC

# VIM
rm -rf /etc/vim
mkdir -p /etc/vim
ln -s $(pwd)/core/vimrc /etc/vim/vimrc
