#!/bin/bash

# Script to set correct tmux vars
if [[ $TERM_PROGRAM != 'Apple_Terminal' || ! -d '/Library' ]]; then
  ps aux | grep '[t]mux' | grep ${USER:0:5} 2> /dev/null > /dev/null
  if [ $? -eq 0 ]; then
    tmux setenv SSL_CLIENT_KEY_PASSPHRASE $SSL_CLIENT_KEY_PASSPHRASE &> /dev/null
    export INTMUX='yes'
  fi
fi

# refresh tmux
function tmux-refresh {
  if [[ $INTMUX == 'yes' ]]; then
    tmux setenv SSL_CLIENT_KEY_PASSPHRASE $SSL_CLIENT_KEY_PASSPHRASE &> /dev/null
  fi
}

# Attach to session main
alias tm='tmux attach -tmain'

# Create session main
alias tmn='tmux new-session -smain'
