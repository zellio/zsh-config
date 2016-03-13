#!/usr/bin/env zsh

setopt append_history
setopt bang_hist
setopt extended_history
setopt NO_hist_allow_clobber
setopt NO_hist_beep
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt NO_hist_lex_words
setopt hist_no_functions
setopt hist_no_store
setopt HIST_REDUCE_BLANKS
setopt hist_save_by_copy
setopt hist_save_no_dups
setopt hist_verify
setopt inc_append_history
setopt NO_inc_append_history_time
setopt share_history

HISTFILE="$ZSH_ROOT/data/history"
HISTSIZE=10000
SAVEHIST=10000
