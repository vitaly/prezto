# override standard git_prompt_status to include both branch and commit
function git_prompt_info() {
  local br
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    local ref=$(command git rev-parse --short HEAD 2> /dev/null)
    if br="$(command git symbolic-ref HEAD 2> /dev/null)"; then
      ref="$br: $ref"
    fi
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}
