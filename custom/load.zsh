while read f; do
  source $f
done < <(\ls ~/.zsh/custom/profile.d/*.zsh)

while read f; do
  source $f
done < <(\ls ~/.zsh/custom/rc.d/*.zsh)