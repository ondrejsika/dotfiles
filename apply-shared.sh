#!/bin/bash

# Bash
ONDREJSIKA_BASHRC=~/.ondrejsika.bashrc
echo "# Created by ondrejsika/dotfiles" >$ONDREJSIKA_BASHRC
echo ". $(pwd)/core/3rdparty/git-prompt.sh" >>$ONDREJSIKA_BASHRC
echo ". $(pwd)/core/3rdparty/git-completion.sh" >>$ONDREJSIKA_BASHRC
echo ". $(pwd)/core/3rdparty/complete_alias" >>$ONDREJSIKA_BASHRC
echo ". $(pwd)/core/bashrc" >>$ONDREJSIKA_BASHRC
