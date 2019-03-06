#!/bin/bash

# Make sure that .ssh exists
if [ ! -d "${HOME}/.ssh" ]; then
  mkdir "${HOME}/.ssh"
  chmod 0700 "${HOME}/.ssh"
fi

# If we have an SSH agent link it to the dir configured in TMUX
if [ -S "$SSH_AUTH_SOCK" ] && [[ "$SSH_AUTH_SOCK" != "${HOME}/.ssh/ssh_auth_sock" ]]; then
  ln -sf "$SSH_AUTH_SOCK" "${HOME}/.ssh/ssh_auth_sock"
fi
export SSH_AUTH_SOCK="${HOME}/.ssh/ssh_auth_sock"

if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
  for f in $(find "$HOME/.ssh" -name "id_*" -not -name "*.pub" -type f -depth 1); do
    ssh-add -K $f 2>&1 | grep -v '^Identity added:'
  done
fi
