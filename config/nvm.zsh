#!/usr/bin/env zsh

NVM_DIR="${HOME}/.nvm"

[ -s "$NVM_DIR" ] || return

function autoload_nvm
{
	unfunction nvm
	unfunction npm
	source "${NVM_DIR}/nvm.sh"
}

function npm
{
	autoload_nvm
	npm "$@"
}

function nvm
{
	autoload_nvm
	nvm "$@"
}
