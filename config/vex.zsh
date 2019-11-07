#!/usr/bin/env zsh

is_installed virtualenv || return

WORKON_HOME="$HOME/.venv"
VEX_HOME="$WORKON_HOME/vex"

if [ ! -d "$VEX_HOME" ]; then
    virtualenv "$VEX_HOME"
    "$VEX_HOME"/bin/pip install -U vex
fi

_commands=(
    "$vex_commands[@]"
    vex
    ansible
    ansible-vault
)

typeset -U _commands

for command in "${_commands[@]}"; do
    [ -z "$command" ] && continue
    [ -d "$WORKON_HOME/$command" ] &&
        alias $command="$VEX_HOME/bin/vex $command $command"
done

function vex_update
{
    for command in "${_commands[@]}"; do
        [ -z "$command" ] && continue

        echo "vex: Updating $command ..."
        if [ ! -d "$WORKON_HOME/$command/bin" ]; then
            virtualenv "$WORKON_HOME/$command"
        fi

        vex "$command" pip install -U "$command"

        echo
    done
}


export WORKON_HOME
export VEX_HOME
