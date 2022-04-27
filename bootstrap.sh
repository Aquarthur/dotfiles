#!/usr/bin/env bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

overwrite_with_check() {
  if [[ -f $1 || -d $1 ]]; then
    read -p "This will overwrite $1. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo "Overwriting $1 with $2..."
      ln -sTf $2 $1
    else
      echo "Moving on..."
    fi
  else
    echo "Could not find existing $1, creating from $2..."
    ln -sTf $2 $1
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