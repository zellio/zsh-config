#!/usr/bin/env zsh


### OPTIONS ON ###
setopt auto_cd
setopt auto_pushd
setopt chase_links
setopt pushd_ignore_dups
setopt pushd_to_home
setopt extended_glob


typeset -U comman_paths
common_paths=(
    ${path/%\//} ${=$(command -p getconf PATH)//:/ }
    /usr/bin /bin /usr/sbin /sbin
    /usr/local/bin /usr/local/sbin
    /usr/X11R6/bin                                    # X11
    /usr/pkg/bin /usr/pkg/sbin                        # NetBSD
    /usr/ucb                                          # Solaris - BSD
    /usr/sfw/bin /usr/sfw/sbin                        # Solaris - sun free-ware
    /usr/xpg4/bin /usr/xpg6/bin                       # Solaris - X/Open
    /opt/local/bin /opt/local/sbin                    # Solaris
    /opt/SUNWspro/bin                                 # Solaris
    /usr/ccs/bin                                      # Solaris - C Compilation
    /usr/platform/$(uname -i)/sbin                    # Solaris - hardware deps
    /usr/games /usr/local/games /usr/games/bin        # fun stuff
    /sw/bin /sw/sbin /sw/usr/bin /sw/usr/sbin         # Fink
    /opt/usr/bin /opt/bin /opt/usr/sbin /opt/sbin     # Darwin Ports
    "$HOME/bin" "$HOME/.rvn/bin" "$HOME/.bin"         # Personal Executables
)

PATH=
for dir in "${common_paths[@]}"; do
	if [ -d "$dir" ]; then
		PATH="$PATH:$dir"
	fi
done

PATH="${PATH:1}"

export PATH
