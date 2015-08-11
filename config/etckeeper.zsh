#!/usr/bin/zsh

[ -z "$(command -v etckeeper)" ] && return


if [ -f "$(command -v pacman)" ]; then
	function pacman
	{
		sudo etckeeper pre-install
		sudo pacman "$@"
		sudo etckeeper post-install
	}
fi
