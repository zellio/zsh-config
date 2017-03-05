#!/usr/bin/env zsh

CLOUDSDK_PYTHON=`which python2`
GCLOUD_ROOT="${HOME}/.gcloud"

[ ! -d "$GCLOUD_ROOT" ] && return

export CLOUDSDK_PYTHON GCLOUD_ROOT

export PATH="$PATH:$GCLOUD_ROOT/bin"
source "$GCLOUD_ROOT/completion.zsh.inc"
