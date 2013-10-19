#!/usr/bin/env zsh

[ -z "`command -v rlwrap`" ] && return;

export RLWRAP_HOME="$HOME/.rlwrap.d"
export RLWRAP="`command -v rlwrap` --history-no-dupes 1 --histsize 5000 --history-filename"


typeset -U cmds 
cmds=( v8 clj guile scala sbcl js sqlite sqlite3 sqlplus )

for cmd in ${cmds}; do
    [ -n "`command -v $cmd`" ] && alias $cmd="$RLWRAP $RLWRAP_HOME/${cmd}_history `command -v $cmd`"
done

unset cmds
