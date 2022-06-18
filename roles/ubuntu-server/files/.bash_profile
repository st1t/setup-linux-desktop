# Import profiles
for i in $(ls ~/.bash_profile.d/)
do
  source ~/.bash_profile.d/$i
done

# Change ls color https://www.itmedia.co.jp/help/tips/linux/l0372.html
export LSCOLORS=gxfxcxdxbxegedabagacad

# Other settings
alias ls='ls -G'
