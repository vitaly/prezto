fzf_menu() {
  fzf -0 -1 "$@"
}

fzf_cd_src() {
  local src=~/dev/src

  local list() (
    cd $src
    find . -type d -name .git -maxdepth 5 | xargs -n1 dirname | cut -d/ -f2- | grep -v /_/
  )

  if [ "-u" = "$1" ]; then
    list >! $src/.list
    return
  fi

  local d=$(cat $src/.list | fzf_menu -q "${1:-}")

  [ -n "$d"  ] || return

  local d="$src/$d"

  [ -d "$d"  ] || return

  cd "$d"
}
alias G=fzf_cd_src

fzf_base16() {
  local theme=$(alias |  grep '^base16_[-a-zA-Z0-9_-]\+=' | cut -d= -f1 | cut -d_ -f2- | fzf_menu --cycle -q "${1:-}")
  if [ -n "$theme" ]; then
    echo switching to $theme
    eval "base16_$theme"
  fi
}

alias B=fzf_base16
