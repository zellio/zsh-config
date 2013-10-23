#!/usr/bin/env zsh

ORACLE_HOME=$HOME/.oracle.d

if [ -d "$ORACLE_HOME" ]; then
    export ORACLE_HOME
    export TNS_ADMIN="$ORACLE_HOME/sqlplus"
fi
