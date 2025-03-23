# zsh
# set ignore duplicates
typeset -gU PATH path
typeset -gU FPATH fpath

# system path
path=(
    '/usr/local/bin'(N-/)
    '/usr/bin'(N-/)
    '/bin'(N-/)
    '/usr/sbin'(N-/)
    '/sbin'(N-/)
)

# user defined path
path=(
    "$GOPATH/bin"(N-/)
    "$CARGO_HOME/bin"(N-/)
    "$ASDF_DATA_DIR/shims"(N-/)
    "$path[@]"
)

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt NO_BEEP
setopt IGNOREEOF
setopt SHARE_HISTORY
setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

zshaddhistory() {
    local line="${1%%$'\n'}"
    [[ ! "$line" =~ "^(cd|ll|ls|rm|rmdir|git commit)($| )" ]]
}

# homebrew M1 build
if type /opt/homebrew/bin/brew &> /dev/null
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
if type brew &>/dev/null
then
    # https://docs.brew.sh/Shell-Completion
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

# nodejs global module
if type asdf &> /dev/null
then
    PATH=$PATH:`npm prefix --location=global`/bin
fi

# sheldon zsh plugin manager
if type sheldon &>/dev/null
then
    eval "$(sheldon source)"
else
    source $ZDOTDIR/fzf.zsh
    source $ZDOTDIR/prompt.zsh
fi

# gpg
export GPG_TTY=$(tty)

# remove less history file
export LESSHISTFILE=-

alias ls='eza'
alias ll='eza -lha'
alias tree='eza --tree'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
