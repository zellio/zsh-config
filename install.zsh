#!/usr/bin/env zsh

source "${0:A:h}/dotfiles/zshenv"

for dotfile ( "${ZSH_HOME}/dotfiles"/*(.) ); do {
	ln -s "$dotfile" "${ZDOTDIR:-$HOME}/.${dotfile:t}"
}; done


mkdir -p "$ZSH_HOME"/{data,cache,functions,completions,custom}
