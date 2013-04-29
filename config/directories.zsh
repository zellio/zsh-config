#!/usr/bin/env zsh

### OPTIONS ON ###
setopt auto_cd
setopt auto_pushd
setopt chase_links
setopt pushd_ignore_dups
setopt pushd_to_home
setopt extended_glob

## Dynamicall build $PATH variable ( helps this work across multiple systems )
typeset -U common_paths
common_paths=(
  ${path/%\//} ${=$(command -p getconf PATH)//:/ }  # base system PATH
  /bin /sbin /usr/bin /usr/sbin                     # Standard
  /usr/local/bin /usr/local/sbin                    # FreeBSD
  /usr/X11R6/bin                                    # X11
  /usr/pkg/bin /usr/pkg/sbin                        # NetBSD
  /usr/ucb                                          # Solaris - BSD
  /usr/sfw/bin /usr/sfw/sbin                        # Solaris - sun free-ware
  /usr/xpg4/bin /usr/xpg6/bin                       # Solaris - X/Open Portability Guide
  /opt/local/bin /opt/local/sbin                    # Solaris
  /opt/SUNWspro/bin                                 # Solaris
  /usr/ccs/bin                                      # Solaris - C Compilation System
  /usr/platform/$(uname -i)/sbin                    # Solaris - hardware dependent
  /var/qmail/bin                                    # qmail - uncomment if desired
  /usr/games /usr/local/games /usr/games/bin        # fun stuff
  /sw/bin /sw/sbin /sw/usr/bin /sw/usr/sbin         # Fink 
  "$HOME/bin"                                       # personal stuff
)

if [ -n "`command -v gem`" ]; then
    common_paths=( ${common_paths} "$HOME/.gem/ruby/*/bin" )
fi

unset PATH_tmp
unsetopt NO_MATCH

for node in ${common_paths};do
  test -d "$node" && PATH_tmp="$PATH_tmp$node:"
done

setopt NO_MATCH
export PATH=${PATH_tmp/%:/}

unset common_paths node PATH_tmp
