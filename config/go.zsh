#!/usr/bin/env zsh

[ -z "`command -v go`" ] && return;

export GOARCH=amd64
export GOOS=linux
# export GOROOT="${HOME}/.go"
export GOPATH="${HOME}/.go"
export GOBIN="${GOPATH}/bin"
export PATH="${PATH}:${GOBIN}"
