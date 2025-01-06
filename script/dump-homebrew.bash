#!/usr/bin/env bash

if ! type brew &>/dev/null; then
  echo "Homebrew is not installed"
  exit
fi

export REPO_DIR="$(cd "$(dirname "$0")/.." || exit 1; pwd)"

echo "Dumping Homebrew packages"
echo "brew bundle dump --file=\"$REPO_DIR/config/homebrew/Brewfile\" --no-vscode --force"
brew bundle dump --file="$REPO_DIR/config/homebrew/Brewfile" --no-vscode --force
