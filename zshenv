#!/usr/bin/env zsh

[ -z "$TERM" ] && export TERM=xterm-color
[ -z "$USER" ] && export USER=`id -un`
[ -z "$HOME" ] && export HOME=`grep $USER /etc/passwd | cut -d : -f 6`
[ -z "$HOSTNAME" ] && export HOSTNAME=`uname -n`

export IFS=" \t\n"

_stty=`command -v stty`

"$_stty" intr   '^C' 
"$_stty" quit   '^\' 
"$_stty" erase  '^?'
"$_stty" kill   '^U' 
"$_stty" eof    '^D' 
"$_stty" start  '^Q'
"$_stty" stop   '^S' 
"$_stty" susp   '^Z'
"$_stty" rprnt  '^R'
"$_stty" werase '^W'
"$_stty" lnext  '^V'
"$_stty" flush  '^O'

unset _stty

export ZSH_ROOT=~/.zsh.d
