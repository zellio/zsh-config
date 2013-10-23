#!/usr/bin/env zsh

safe_source "$ZSH_CUSTOM/pre_init.zsh"

fpath=( $ZSH_ROOT/functions $ZSH_ROOT/completions $fpath )

for conf ($ZSH_ROOT/config/zsh/*.zsh); source "$conf"

for fn in $(\ls $ZSH_ROOT/functions); autoload "$fn"

for comp in $(\ls $ZSH_ROOT/completions); autoload "$comp"

for conf ($ZSH_ROOT/config/*.zsh); source "$conf"

autoload -U compinit
compinit -i

source "$ZSH_ROOT/theme/theme"

safe_source "$ZSH_CUSTOM/post_init.zsh"
