#!/usr/bin/env zsh


autoload -U url-quote-magic
zle -N self-insert url-quote-magic

## file rename magick
bindkey "^[m" copy-prev-shell-word


export PAGER=`command -v less`
export LC_CTYPE=$LANG

export EDITOR=`command -v emacs`
export SHELL=`command -v zsh`


