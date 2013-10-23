#!/usr/bin/env zsh

### OPTIONS ON ###
setopt c_bases
setopt c_precedences
setopt octal_zeroes


### OPTIONS OFF ###



cds() {
  scratch_dir=`date "+/tmp/scd:$USER:%s"`
  mkdir "$scratch_dir"
  cd "$scratch_dir"
}

