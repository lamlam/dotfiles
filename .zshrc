#参考 https://gist.github.com/mollifier/4979906
########################################
# 環境変数
export LANG=ja_JP.UTF-8

# for zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath) 

# 色を使用出来るようにする
autoload -Uz colors
colors

# emacs 風キーバインドにする
bindkey -e
 
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
 
# プロンプト
#PROMPT="%{${fg[blue]}%}[%n@%m]%{${reset_color}%} %~ %# "

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
precmd() { vcs_info }
PROMPT='[%n@%m]%{${fg[yellow]}%} %~ %{${reset_color}%}${vcs_info_msg_0_}  
%# '
RPROMPT=''

# PATH
PATH="/usr/local/bin/:${PATH}"

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit -u
 
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
 
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
 
# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
 
# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
 
########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# '#' 以降をコメントとして扱う
setopt interactive_comments

# beep を無効にする
setopt no_beep

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
 
# 高機能なワイルドカード展開を使用する
setopt extended_glob
 
########################################
# エイリアス
 
alias la='ls -a'
alias ll='ls -l'
 
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
 
alias mkdir='mkdir -p'
 
# GNU grep をデフォルトで有効にする
alias grep='ggrep'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '
 
########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

