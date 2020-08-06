#!/usr/bin/env zsh

fpath=(
	"/usr/local/share/zsh/site-functions"/***/(-/)
	$fpath
)

for func ( "/usr/local/share/zsh/site-functions"/***/*(.N) ); do
	autoload "$func:t"
done

alias ls='LC_COLLATE=C \ls -F -G'
