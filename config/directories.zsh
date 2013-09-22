#!/usr/bin/env zsh


### OPTIONS ON ###
setopt auto_cd
setopt auto_pushd
setopt chase_links
setopt pushd_ignore_dups
setopt pushd_to_home
setopt extended_glob


unset common_paths
typeset -U common_paths
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
    "$HOME/bin" "$HOME/.rvn/bin"                      # Personal Executables
)


# if [ -n "`command -v gem`" ]; then
#     typeset -U gem_paths
#     gem_paths=( ${=$(command -p gem environment gempath)//://bin }/bin )
#     common_paths=( ${common_paths} ${gem_paths} )
#     unset gem_paths
# fi


unset PATH node
for node in ${common_paths}; do
    if [ -d "$node" ]; then
        [ -n "$PATH" ] && PATH="$PATH:$node" || PATH="$node"
    fi
done
unset common_paths node


export PATH
