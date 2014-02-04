#!/usr/bin/env zsh

ZSH_ROOT=${$(realpath $0):h}

source $ZSH_ROOT/dotfiles/zshenv

ZDOTFILES="${ZSH_ROOT}/dotfiles"

for config ($ZSH_ROOT/dotfiles/*); do
    ln -s "${config}" "${HOME}/.${config:t}"
done

for dir (data cache functions completions custom); do
    mkdir -p "${ZSH_ROOT}/${dir}"
done

cd $ZSH_ROOT

git submodule update --init --recursive
