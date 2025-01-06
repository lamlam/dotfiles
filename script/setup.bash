#!/usr/bin/env bash

# XDG Base Directory
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_STATE_HOME"
mkdir -p "$XDG_CACHE_HOME"
mkdir -p "$XDG_DATA_HOME"

export SCRIPT_DIR=""$(cd "$(dirname "$0")" || exit 1; pwd)""
export REPO_DIR="$(cd "$(dirname "$0")/.." || exit 1; pwd)"

ln -sfv "$REPO_DIR/config/"* "$XDG_CONFIG_HOME"

# zsh
ln -sfv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"
mkdir -p "$XDG_STATE_HOME/zsh" 
mkdir -p "$XDG_CACHE_HOME/zsh"
mkdir -p "$XDG_DATA_HOME/zsh"

# other
/bin/bash "$SCRIPT_DIR/setup-mac.bash"
# /bin/bash "$SCRIPT_DIR/setup-homebrew.bash"
