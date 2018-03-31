#!/usr/bin/env zsh

GAM_HOME="$HOME/.gam.d"

[ -d "$GAM_HOME" ] || return

alias gam="$(which python2) $GAM_HOME/gam.py"
export GAM_HOME
