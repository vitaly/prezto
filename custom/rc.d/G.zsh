# vim: ft=zsh

root=~/dev/src

list() (
  cd $root
  find . -type d -name .git -maxdepth 4 | xargs -n1 dirname | cut -d/ -f2-
)

menu() {
  if [ $# -gt 0  ]; then
    q="$1"
  else
    q=""
  fi

  fzf -0 -1 -q "$q"
}

G() {
  d=$(list | menu "$@")

  [ -n "$d"  ] || return

  d="$root/$d"

  [ -d "$d"  ] || return

  cd "$d"
}
