#!/bin/bash

function bashrc_install {

  # Backing up the old stuff
  mv $HOME/.bashrc    $HOME/.bashrc.old    &>/dev/null
  mv $HOME/.profile   $HOME/.profile.old   &>/dev/null
  mv $HOME/.vimrc     $HOME/.vimrc.old     &>/dev/null
  mv $HOME/.vim       $HOME/.vim.old       &>/dev/null
  mv $HOME/.tmux.conf $HOME/.tmux.conf.old &>/dev/null

  # Linking the new stuff
  ln -s $HOME/.bashrc.d/assets/bashrc        $HOME/.bashrc
  ln -s $HOME/.bashrc.d/assets/profile       $HOME/.profile
  ln -s $HOME/.bashrc.d/assets/vim/vimrc.vim $HOME/.vimrc
  ln -s $HOME/.bashrc.d/assets/vim           $HOME/.vim
  ln -s $HOME/.bashrc.d/assets/tmux.conf     $HOME/.tmux.conf
}
