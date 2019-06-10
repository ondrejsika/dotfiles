#!/bin/bash

rm -rf ~/.hammerspoon
ln -s $(pwd)/mac/hammerspoon ~/.hammerspoon 

echo ". $(pwd)/core/3rdparty/git-prompt.sh" >> ~/.profile
echo ". $(pwd)/core/3rdparty/git-completion.sh" >> ~/.profile
echo ". $(pwd)/core/bashrc" >> ~/.profile

echo "" >> ~/.bashrc
echo ". ~/.bashrc" >> ~/.profile

echo "" >> ~/.bash_aliases
echo ". ~/.bash_aliases" >> ~/.profile
