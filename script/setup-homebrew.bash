#!/usr/bin/env bash

[ "$(uname)" != "Darwin" ] && exit

if type brew &>/dev/null; then
  echo "Homebrew already installed"
else
  echo "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

export REPO_DIR="$(cd "$(dirname "$0")/.." || exit 1; pwd)"
brew bundle install --file="$REPO_DIR/config/Brewfile"
