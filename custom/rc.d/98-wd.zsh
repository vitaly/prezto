wd() {
  . ~/dev/src/github.com/mfaerevaag/wd/wd/wd.sh
}
unalias g
function g()
{
  local dir=$(\cat ~/.warprc | cut -d: -f1 | fzf -1 -0 -q "$*")

  if [ -n "$dir" ]; then
    wd $dir
    chruby_auto
  fi
}
