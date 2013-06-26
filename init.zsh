#!/usr/bin/env zsh


safe_source "$ZSH_CUSTOM/pre_init.zsh"


fpath=( $ZSH_ROOT/function $ZSH_ROOT/completion $fpath )


for conf ($ZSH_ROOT/config/*.zsh); source "$conf"

for fun in $(\ls $ZSH_ROOT/function/); autoload "$fun"

for comp in $(\ls $ZSH_ROOT/completion); autoload "$comp"


autoload -U compinit
compinit -i

source "$ZSH_ROOT/theme/master.zsh-theme"


safe_source "$ZSH_CUSTOM/post_init.zsh"
