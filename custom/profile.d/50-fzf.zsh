[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v ag > /dev/null; then
  export FZF_DEFAULT_COMMAND="ag --follow --nocolor --nogroup -g ''"
fi
