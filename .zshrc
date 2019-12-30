export LANG=ja_JP.UTF-8

# http://zsh.sourceforge.net/Guide/zshguide02.html#init
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt NO_BEEP
setopt IGNOREEOF

# https://qiita.com/mollifier/items/40d57e1da1b325903659
autoload -Uz colors
colors

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
PROMPT='[%n@%m]%{${fg[yellow]}%} %~ %{${reset_color}%}${vcs_info_msg_0_}
%# '
RPROMPT=''


alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias g='git'

# for anyenv
eval "$(anyenv init -)"

# for fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export GOPATH="$HOME/go"
export PATH=$PATH:$(go env GOPATH)/bin

