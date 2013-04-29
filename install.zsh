#!/usr/bin/env zsh

source env.zsh

ln -s "$ZSH_ROOT/zshrc" "$HOME/.zshrc"

mkdir -p "$ZSH_ROOT/data"
mkdir -p "$ZSH_ROOT/cache"
