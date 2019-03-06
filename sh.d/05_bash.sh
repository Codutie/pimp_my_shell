#!/bin/bash

if [[ $(echo $PATH | grep "${HOME}/bin") == '' ]]; then
  export PATH="/home/${USER}/bin:${PATH}"
fi

# Go home
cd ${HOME}

# We want VIM
export VISUAL=vim
export EDITOR="$VISUAL"

# Write History immediately
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND='history -a; history -c; history -r'

# Set vi mode
set -o vi
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
bind -m vi-insert "\C-w.":backward-kill-word

# Force some usable locales
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

