export LANG=ja_JP.UTF-8

# http://zsh.sourceforge.net/Guide/zshguide02.html#init
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt NO_BEEP
setopt IGNOREEOF
setopt SHARE_HISTORY

# https://qiita.com/mollifier/items/40d57e1da1b325903659
autoload -Uz colors
colors

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

# http://zsh.sourceforge.net/Guide/zshguide06.html#l144
autoload -Uz compinit
compinit

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
precmd() { vcs_info }
PROMPT='[%n@%m %D{%H:%M:%S}]%{${fg[yellow]}%} %~ %{${reset_color}%}${vcs_info_msg_0_}
%# '
RPROMPT=''

export CLICOLOR=1


# fzf
if type fzf &> /dev/null
then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# go
if type go &> /dev/null
then
    export GOPATH="$HOME/go"
    export PATH=$PATH:$(go env GOPATH)/bin
fi

if type ghq &> /dev/null
then
    ghcd() {
        local selected
        selected=$(ghq list | fzf)
    
        if [ "x$selected" != "x" ]; then
            if [ -e $(ghq root)/$selected ]; then
              cd $(ghq root)/$selected
            else
              cd $GOPATH/src/$selected
            fi
        fi
    }
fi

# runtime manager https://github.com/asdf-vm/asdf
if type asdf &> /dev/null
then
    . /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

alias g='git'
alias l='exa -lha'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

