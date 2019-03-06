#!/bin/bash

# Where to get the hostname from?
export ps1_hostname='\h'

# Username
export ps1_username='\u'

# TTY
export ps1_tty="$(tty|awk -F/ '{print $3"/"$4}' | sed -e 's#/$##g' )"

# Combining the host and username part
ps1_userhost="[\e[38;5;49m${ps1_username}@${ps1_hostname}:\${ps1_tty}\e[39m\e[49m]"

# Working directory
ps1_dir='[\e[38;5;51m\w\e[39m\e[49m]'

function ps1_get_ip {
  if which ifconfig &>/dev/null; then
    ps1_ips=''
    ps1_ips=$(ifconfig \
      | sed -E -e '/^.*inet/!d; s/^.*inet(6)?(.*addr:)?( )?//g; s#(/|%| --|.( Bcast|netmask|prefixlen)).*$##g; /^((127\.0\.0\.|fe80:).*|::1)$/d' \
      | tr '\n' ',' \
      | sed -E 's/,$//g')
    if [[ "${ps1_ips}" != "" ]]; then
      echo "━[\e[94m$ps1_ips\e[39m]"
    fi
  fi
}

# show git or not
function ps1_git {
  ps1_gitout="$(__git_ps1 | cut -d '(' -f2 | cut -d ')' -f1)"
  if [[ $ps1_gitout == 'production' || $ps1_gitout == 'master' ]] && [[ $TERM_PROGRAM != 'Apple_Terminal' && ! -d '/Library' ]]; then
    ps1_gitout="\e[1m${ps1_gitout}\e[0m"
  fi
  if [[ $ps1_gitout != '' ]]; then
      echo -e "GIT:${ps1_gitout}"
  fi
}
function ps1_git_pre {
  ps1_gitout="$(__git_ps1 | cut -d '(' -f2 | cut -d ')' -f1)"
  if [[ $ps1_gitout != '' ]]; then
      echo -e "━["
  fi
}
function ps1_git_past {
  ps1_gitout="$(__git_ps1 | cut -d '(' -f2 | cut -d ')' -f1)"
  if [[ $ps1_gitout != '' ]]; then
      echo -e "]"
  fi
}

PS1_top_simple="${ps1_userhost}━${ps1_dir}"

if [[ $HOSTNAME == "mntcz42" || $HOSTNAME == "mntcz41" || $HOSTNAME == "mntes34" || $HOSTNAME == *mgmt-01* ]]; then
    ps1_userhost="[\e[38;5;49m${ps1_username}@\e[7m${ps1_hostname}\e[0m\e[38;5;49m:\${ps1_tty}\e[39m\e[49m]\$(tmux-refresh)"
fi

PS1_top="${ps1_userhost}━${ps1_dir}\$(ps1_git_pre)\e[38;5;9m\$(ps1_git)\e[39m\e[49m\$(ps1_git_past)$(ps1_get_ip)"
PS1_bottom="\$ "

export PS1="\e[0m\n\n┏━${PS1_top}\n┗━${PS1_bottom}"
export PS1_SIMPLE="\n\n┏━${PS1_top_simple}\n┗━${PS1_bottom}"
