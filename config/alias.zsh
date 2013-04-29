#!/usr/bin/env zsh

alias history='fc -l 1'
alias ls="LC_COLLATE=C \ls -F"

alias untar='tar xvf'

alias lgroups="cut -d: -f1 /etc/group | sort"
alias lusers="cut -d: -f1 /etc/passwd | sort"

# alias emacs="emacsclient -c -a \"\""

[ -n "`command -v vim`" ] && alias vi=vim
