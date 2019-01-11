BASE16_SHELL=$HOME/dev/src/github.com/chriskempson/base16-shell
\
  [ -d "${BASE16_SHELL}" ] && \
  [ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] &&\
  eval "$("$BASE16_SHELL/profile_helper.sh")"
