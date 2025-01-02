# zsh
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

export CLICOLOR=1

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

eval "$(sheldon source)"

# http://zsh.sourceforge.net/Guide/zshguide06.html#l144
autoload -Uz compinit
compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump"

# starship
if type starship &> /dev/null
then
  export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/config.toml
  eval "$(starship init zsh)"
elif
then
  autoload -Uz vcs_info
  setopt prompt_subst
  zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
  zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
  precmd() { vcs_info }
  PROMPT='%{${fg[yellow]}%}%~ %{${reset_color}%}${vcs_info_msg_0_}
  %# '
  RPROMPT=''
fi

# fzf
if type fzf &> /dev/null
then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    if type fd &> /dev/null
    then
        export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    fi
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
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
    . $(brew --prefix asdf)/libexec/asdf.sh
fi

# gpg
export GPG_TTY=$(tty)

export PATH=$PATH:$HOME/.cargo/bin

alias l='exa -lha'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

