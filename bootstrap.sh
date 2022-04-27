#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

overwrite_with_check () {
  if [[ -f $1 || -d $1 ]]; then
    read -p "This will overwrite $1. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo "Creating symlink from $2 to $1..."
      ln -sfn $2 $1
    else
      echo "Moving on..."
    fi
  else
    echo "Creating symlink from $2 to $1..."
    ln -s $2 $1
  fi
  echo ""
}

bootstrap () {
  # Bootstrap ZSH config files
  overwrite_with_check ${HOME}/.zfunc ${BASEDIR}/zsh/zfunc
  overwrite_with_check ${HOME}/.zaliases ${BASEDIR}/zsh/zaliases
  overwrite_with_check ${HOME}/.zshrc ${BASEDIR}/zsh/zshrc
}

bootstrap

# Unset after bootstrapping
unset -f bootstrap
unset -f overwrite_with_check
unset BASEDIR
