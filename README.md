# Personal Dotfiles

## Installation

Set up symbolic link by script.

```
$ ./install.sh
```

## XDG_CONFIG

[XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)

### ZSH

ZSH loads config from `ZDOTDIR` env.
I set `XDG_*` and `ZDOTDIR` to specify xdg config for zsh in `~/.zshenv` file.

```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export ZDOTDIR=$XDG_CONFIG_HOME/zsh
```

## How to update config

### brew

Update Brewfile and commit it

```
$ brew bundle --force
```
