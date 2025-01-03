#!/usr/bin/env bash

[ "$(uname)" != "Darwin" ] && exit

# Change hammerspoon config file location
# https://github.com/Hammerspoon/hammerspoon/issues/579
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
