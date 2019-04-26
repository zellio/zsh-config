#!/usr/bin/env zsh

is_installed rlwrap || return

export RLWRAP_HOME="${RLWRAP_HOME:-$HOME/.rlwrap.d}"

[ ! -d "${RLWRAP_HOME}" ] && mkdir "${RLWRAP_HOME}"

function rlwrap_wrapper
{
	local command="$1"

	rlwrap \
		--history-no-dupes 1 \
		--histsize 100000 \
		--history-filename "${RLWRAP_HOME}/${command}_history" \
		-- "$@"
}

_cmds=(
	"$rlwrap_commands[@]"
	clj guile js racket sbcl scala sqlite sqlite3 sqlplus v8
)

typeset -U _cmds

for cmd in "${_cmds[@]}"; do
	is_installed "$cmd" &&
		alias $cmd="rlwrap_wrapper '$cmd'"
done
