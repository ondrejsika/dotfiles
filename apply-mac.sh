#!/bin/bash

# Bash
echo ". $(pwd)/core/3rdparty/git-prompt.sh" >> ~/.profile
echo ". $(pwd)/core/3rdparty/git-completion.sh" >> ~/.profile
echo ". $(pwd)/core/bashrc" >> ~/.profile

echo "" >> ~/.bashrc
echo ". ~/.bashrc" >> ~/.profile

echo "" >> ~/.bash_aliases
echo ". ~/.bash_aliases" >> ~/.profile

# VIM
rm -rf ~/.vimrc
ln -s $(pwd)/core/vimrc ~/.vimrc

# Hammer Spoon
rm -rf ~/.hammerspoon
ln -s $(pwd)/mac/hammerspoon ~/.hammerspoon

# Tor
ln -s $(pwd)/mac/torrc $(brew --prefix)/etc/tor/torrc
