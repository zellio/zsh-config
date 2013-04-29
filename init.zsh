#!/usr/bin/env zsh

#fpath=($ZSH_ROOT/functions $ZSH_ROOT/completions $fpath)
for config ($ZSH_ROOT/config/*.zsh) source "$config"

autoload -U compinit
compinit -i

source "$ZSH_ROOT/theme/master.zsh-theme"
