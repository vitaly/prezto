BASE16_SHELL=$HOME/.zsh/vendor/wd

if [ -e ~/.zsh/vendor/wd/wd.sh ]; then
  wd() {
    . ~/.zsh/vendor/wd/wd.sh
  }

  g()
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
fi
