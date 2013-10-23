#!/usr/bin/env zsh

ZSH_ROOT=${$(realpath $0):h}

source $ZSH_ROOT/zshenv

ln -s "$ZSH_ROOT/zshenv" "$HOME/.zshenv"
ln -s "$ZSH_ROOT/zshrc" "$HOME/.zshrc"

mkdir -p "$ZSH_ROOT/data"
mkdir -p "$ZSH_ROOT/cache"
mkdir -p "$ZSH_ROOT/functions"
mkdir -p "$ZSH_ROOT/completions"
mkdir -p "$ZSH_ROOT/custom"

cd $ZSH_ROOT

git submodule update --init --recursive
