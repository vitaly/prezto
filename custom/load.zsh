setopt CLOBBER

while read f; do
  source $f
done < <(\ls ~/.zsh/custom/profile.d/*.zsh)

while read f; do
  source $f
done < <(\ls ~/.zsh/custom/rc.d/*.zsh)

if [ -r ~/.zsh/custom/host/$(hostname -s).zsh ]; then
  source ~/.zsh/custom/host/"$(hostname -s).zsh"
fi
