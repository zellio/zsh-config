#!/usr/bin/env zsh

ANDROID_HOME="${ANDROID_HOME:-$HOME/.android/sdk}"

[ -d "$ANDROID_HOME" ] || return

for dir ( "$ANDROID_HOME/"***/bin(F^M)
		  "$ANDROID_HOME/"***/*tools*(F^M) ); do
	PATH="$PATH:$dir"
done
typeset -U PATH

export PATH
export ANDROID_HOME
