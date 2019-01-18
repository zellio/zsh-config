#!/usr/bin/env zsh

is_installed rlwrap || return

function rlwrap_wrapper
{
	local command="$1"                                                                                                                                                                      
                                                                                                                                                                                          
	rlwrap \                                                                                                                                                                                
		--history-no-dupes 1 \                                                                                                                                                                
		--histsize 10000 \                                                                                                                                                                    
		--history-filename "${HOME}/.rlwrap.d/${command}_history" \                                                                                                                           
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
