#!/usr/bin/env zsh

NVM_DIR="${NVM_DIR:-${HOME}/.nvm}"

[ ! -d "$NVM_DIR" ] && return 0

export NVM_DIR

# NVM Takes forever to load so let's lazy load it when it actually gets
# used. Probably want to make this smarter in the future.
function nvm
{
    source "${NVM_DIR}/nvm.sh"
    nvm "$@"
}
