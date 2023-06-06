#!/bin/bash
rm -rf ~/Library/Containers/com.docker.docker
mkdir -p ~/goinfre/Docker/Data
ln -s ~/goinfre/Docker ~/Library/Containers/com.docker.docker
git clone https://github.com/Homebrew/brew ~/goinfre/homebrew
eval "$(~/goinfre/homebrew/bin/brew shellenv)"
brew update --force --quiet
cd ~ && chmod -R go-w "$(brew --prefix)/share/zsh"
brew install dockle
