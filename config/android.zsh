#!/usr/bin/env zsh

ANDROID_HOME="${HOME}/.android"

[ ! -d "$ANDROID_HOME" ] && return 0

PATH+=":${ANDROID_HOME}/tools"
PATH+=":${ANDROID_HOME}/tools/bin"
PATH+=":${ANDROID_HOME}/platform-tools"

export ANDROID_HOME PATH
