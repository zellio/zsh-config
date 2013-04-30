#!/usr/bin/env zsh

source zshenv 

ln -s "$ZSH_ROOT/zshenv" "$HOME/.zshenv"
ln -s "$ZSH_ROOT/zshrc" "$HOME/.zshrc"

mkdir -p "$ZSH_ROOT/data"
mkdir -p "$ZSH_ROOT/cache"
