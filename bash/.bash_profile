alias vim='mvim'
export EDITOR="vim"

be () {
  bundle exec $1 $2
}

ze () { 
  ARGS=$@; 
  command zeus "$@"; 
  ZE_EC=$?; 
  stty sane; 
  if [ $ZE_EC = 2 ]; then zeus "$ARGS"; fi 
}

eval "$(rbenv init -)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

GIT_PS1_SHOWDIRTYSTATE=true

green=$(tput setaf 2)
red=$(tput setaf 1)
blue=$(tput setaf 4)
bold=$(tput bold)
reset=$(tput sgr0)

source "$HOME/git-completion.sh"
export PS1='\[$red$bold\]\u@\h \[$blue\]\W\[$green\]$(__git_ps1)\[$reset\]\$ '

export PATH=/Users/lucas/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/lucas/.vimpkg/bin
