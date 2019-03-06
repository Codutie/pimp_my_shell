#!/bin/bash

# Don't check KnownHostsFile
alias nssh='ssh -o StrictHostKeyChecking=false -o UserKnownHostsFile=/dev/null'

# Make ls use some colors
if [[ $TERM_PROGRAM != 'Apple_Terminal' && ! -d '/Library' ]]; then
  alias ls='ls --color=auto'
else
  alias ls='ls -G'
fi

# List and group directories at the beginning
alias ll='ls -l'

# List all and that human readable
alias la='ll -a -h'

# Go back
alias back="cd ~-"

# Always use mkdir -p
alias mkdir='mkdir -p'

# SSH-Agent
alias sshagent='eval $(ssh-agent); ssh-add'

# If vim is installed use it instead of vi
if [[ $(which vim) != '' ]]; then
  alias vi='vim'
fi

# GIT
alias gpush='git push'
alias gpull='git pull'
alias gcommit='git commit -am'

# Ansible
export ANSIBLE_INVENTORY='./hosts'
