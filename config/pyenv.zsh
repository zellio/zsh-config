#!/usr/bin/env zsh

is_installed pyenv || return

export WORKON_HOME="${WORKON_HOME:-$HOME/.venv}"

function __autoload_pyenv
{
    unset -f pyenv pipenv
    eval "$(pyenv init -)"
}

function pyenv
{
    __autoload_pyenv
    pyenv "$@"
}

function pipenv
{
    __autoload_pyenv
    pipenv "$@"
}
