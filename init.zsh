#!/usr/bin/env zsh

safe_source "$ZSH_CUSTOM/pre_init.zsh"

fpath=( $ZSH_ROOT/functions/***/(-/) $ZSH_ROOT/completions/***/(-/) $fpath )

for config ($ZSH_ROOT/config/**/*\.zsh); source $config

for fn ($ZSH_ROOT/functions/***/*(.)); autoload $fn:t

for comp ($ZSH_ROOT/completions/***/*(.)); autoload $comp:t

for conf ($ZSH_ROOT/custom/*\.zsh); source $conf

autoload -U compinit
compinit -i -d "$ZSH_ROOT/data/zcompdump"

source "$ZSH_ROOT/theme/theme"

safe_source "$ZSH_CUSTOM/post_init.zsh"
