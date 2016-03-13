#!/usr/bin/env zsh

setopt NO_auto_continue
setopt NO_auto_resume
setopt bg_nice
setopt check_jobs
setopt hup
setopt long_list_jobs
# setopt monitor
setopt notify
setopt NO_posix_jobs

alias jobs='jobs -l'
