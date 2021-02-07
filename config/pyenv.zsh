#!/usr/bin/env zsh

is_installed pyenv || return

WORKON_HOME="${WORKON_HOME:-$HOME/.venv}"
