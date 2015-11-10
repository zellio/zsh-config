#!/usr/bin/env zsh

case "$TERM" in
    xterm*)
        for _term in xterm-256color xterm-color xterm; do
            infocmp "$_term" 2>&1 > /dev/null
            if [ "$?" -eq 0 ]; then
                export TERM="$_term"
                break
            fi
        done
        ;;
    linux)
		# this hack makes me sad
		if [[ "$(tty)" != /dev/tty* ]]; then
			export TERM=fbterm
		fi
        ;;
esac
