#!/usr/bin/env zsh

case "$TERM" in
	xterm*)
		for term in xterm-256color xterm-color xterm; do
			if infocmp "$term" >/dev/null 2>&1; then
				export TERM="$term"
				break
			fi
		done
		;;
	linux)
		# this hack makes me sad but fbterm isn't playing nicely with my shell
		if [[ "$(tty)" != /dev/tty* ]] && is_installed fbterm; then
			export TERM=fbterm
		fi
		;;
esac
