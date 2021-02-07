#!/usr/bin/env zsh

setopt auto_cd
setopt auto_pushd
setopt cdable_vars
setopt chase_dots
setopt chase_links
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent
setopt pushd_to_home

comman_paths=(
	"${HOME}/bin" "${HOME}/.bin"
    /usr/local/opt/coreutils/libexec/gnubin
	/usr/local/bin /usr/local/sbin
	/usr/bin /usr/sbin
	/bin /sbin
	${path/%\//} ${=$(command -p getconf PATH)//:/ }
)

PATH=
for dir in "${comman_paths[@]}"; do
	if [ -d "$dir" ]; then
        PATH="$PATH:$dir"
	fi
done
typeset -U PATH

export PATH="${PATH:1}"
