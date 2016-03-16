#!/usr/bin/env zsh

fpath=(
	"${ZSH_HOME}/functions"/***/(-/)
	"${ZSH_HOME}/completions"/***/(-/)
	$fpath
)

for config ( "${ZSH_HOME}/config"/**/*.zsh(N)
			 "${ZSH_HOME}/custom"/**/*.zsh(N) ); do
    source "$config:A"
done

for func ( "${ZSH_HOME}/functions"/***/*(.N)
		   "${ZSH_HOME}/completions"/***/*(.N) ); do
	autoload "$func:t"
done

autoload -U compinit

compinit -i -d "${ZSH_HOME}/data/zcompdump"

source "${ZSH_HOME}/config/theme.zsh"
