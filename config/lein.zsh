#!/usr/bin/zsh

LEININGEN_HOME=$HOME/.lein

if [ -d "$LEININGEN_HOME" ]; then
    alias lein="$LEININGEN_HOME/bin/lein"
fi
