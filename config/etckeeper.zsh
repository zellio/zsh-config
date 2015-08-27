#!/usr/bin/zsh

[ -z "$(command -v etckeeper)" ] && return


if [ -f "$(command -v pacman)" ]; then
	function pacman
	{
		sudo etckeeper pre-install
		sudo /usr/bin/pacman "$@"
		sudo etckeeper post-install
	}
fi

if [ -f "$(command -v yaourt)" ]; then
	function yaourt
        {
                sudo etckeeper pre-install
                /usr/bin/yaourt "$@"
                sudo etckeeper post-install
        }
fi
