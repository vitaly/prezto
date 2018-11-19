wd() {
  . ~/dev/src/github.com/mfaerevaag/wd/wd.sh
}
unalias g
function g()
{
  local dir=$(\cat ~/.warprc | cut -d: -f1 | fzf -1 -0 +i -q "$*")

  if [ -n "$dir" ]; then
    echo "Changing to $dir"
    wd $dir
    chruby_auto
  else
    echo "no match"
  fi
}
