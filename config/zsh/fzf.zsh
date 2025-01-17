# fzf
if type fzf &> /dev/null
then
    source <(fzf --zsh)
    if type fd &> /dev/null
    then
        export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
        export FZF_DEFAULT_OPTS='-m'
    fi
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    function fzf-select-history() {
        BUFFER=$(fc -ln -2147483548 | awk '!seen[$0]++' | fzf --tac +s --tiebreak=index --no-sort --query="$LBUFFER" --reverse)
        CURSOR=$#BUFFER
        zle reset-prompt
    }
    zle -N fzf-select-history
    bindkey '^r' fzf-select-history

    function ssh-hint() {
        local SELECTED_HOST=$(cat ~/.ssh/known_hosts | awk '{ sub(",.*$", ""); print $1 }' | fzf)
        if [ -n "$SELECTED_HOST" ]; then
            echo "ssh $SELECTED_HOST"
            ssh -A $SELECTED_HOST
        fi
    }

    # find repository managed by ghq
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
fi
