#!/usr/bin/env zsh

is_installed python || return

export PYTHONPATH='.'
export PYTHONUTF8=1
export PYTHONPYCACHEPREFIX="${PYTHONPYCACHEPREFIX:-$HOME/.pycache}"

[ ! -d "$PYTHONPYCACHEPREFIX" ] && mkdir -p "${PYTHONPYCACHEPREFIX}"
