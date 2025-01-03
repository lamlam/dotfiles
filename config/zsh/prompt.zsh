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
