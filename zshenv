#!/usr/bin/env zsh

function safe_source {
    [[ -a "$1" ]] && source "$1"
}


export TERM=${TERM:-xterm-color}
export USER=${USER:-$(id -un)}
export HOME=${HOME:-$(grep $USER /etc/passwd | cut -d : -f 6)}
export HOSTNAME=${HOSTNAME:-$(uname -n)}

export IFS=${IFS:-" \t\n\0"}


export ZSH_ROOT=~/.zsh.d
export ZSH_CUSTOM=$ZSH_ROOT/custom
export BOX_RISK_LEVEL=2


#
# This appears to break my window manager, will revisit
#
# _stty=`command -v stty`
#
# "$_stty" intr   '^C'
# "$_stty" quit   '^\'
# "$_stty" erase  '^?'
# "$_stty" kill   '^U'
# "$_stty" eof    '^D'
# "$_stty" start  '^Q'
# "$_stty" stop   '^S'
# "$_stty" susp   '^Z'
# "$_stty" rprnt  '^R'
# "$_stty" werase '^W'
# "$_stty" lnext  '^V'
# "$_stty" flush  '^O'
#
# unset _stty
