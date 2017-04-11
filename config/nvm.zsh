#!/usr/bin/env zsh

NVM_DIR="${HOME}/.nvm"

[ ! -d "$NVM_DIR" ] && return 0

export NVM_DIR

source "${NVM_DIR}/nvm.sh"
