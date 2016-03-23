#!/usr/bin/env zsh

NVM_DIR="${HOME}/.nvm"

[ -s "$NVM_DIR" ] || return

export NVM_DIR
source "${NVM_DIR}/nvm.sh"
