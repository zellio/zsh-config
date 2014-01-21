#!/usr/bin/zsh

GAM_HOME=$HOME/.gam.d

if [ -d "$GAM_HOME" ]; then
    export GAM_HOME
    alias gam="/usr/bin/python2 ${GAM_HOME}/gam.py"
fi
