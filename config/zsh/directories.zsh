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

typeset -U common_paths
comman_paths=(
	${path/%\//} ${=$(command -p getconf PATH)//:/ }
	/usr/bin /usr/sbin
	/bin /sbin
	/usr/local/bin /usr/local/sbin
	"${HOME}/bin" "${HOME}/.bin"
)

PATH=
for dir in "${common_paths[@]}"; do {
	[ -d "$dir" ] && PATH+=":$dir"
}; done

PATH="${PATH:1}"

export PATH
