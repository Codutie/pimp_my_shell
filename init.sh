#!/bin/bash

# Only make it causy if there is a human
if shopt -q login_shell || shopt -q checkwinsize; then
  for i in $(ls -1 ${HOME}/.bashrc.d/sh.d/*); do
    source $i;
  done
fi
