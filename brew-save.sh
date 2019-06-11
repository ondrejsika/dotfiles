#!/bin/bash

rm -rf mac/brew/Brewfile && \
cd mac/brew/ && \
brew bundle dump
