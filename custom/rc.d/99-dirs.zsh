if [ -d ~/.g ]; then
  unalias g
  function g()
  {
    local dir=$(\ls ~/.g/ | fzf -1 -0 -q "$*")

    if [ -n "$dir" ]; then
      dir=$(cd ~/.g/"$dir";pwd -P)
      echo changing to $dir
      echo

      cd $dir
      chruby_auto
    fi
  }
fi

# remember last CD directory
function mm() { pwd >! ~/.last_dir }
function chpwd { mm }

unalias gg
# change to the last directory
function gg() {
  if [ -e ~/.last_dir  ]; then
    cd "`cat ~/.last_dir`"
  fi
}

# change to the last directory on new shell
gg
