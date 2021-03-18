#!/usr/bin/env zsh

fpath=(
	"/usr/local/share/zsh/site-functions"/***/(-/)
	$fpath
)

for func ( "/usr/local/share/zsh/site-functions"/***/*(.N) ); do
	autoload "$func:t"
done

alias kill='/usr/local/opt/coreutils/libexec/gnubin/kill'
