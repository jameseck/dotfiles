# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.git-prompt.sh

parse_oc_cluster_project() {
  oc config current-context | cut -d '/' -f1,2 | sed 's/\:.*//' | sed 's/\// /' | awk '{print $2"/"$1}'
}

parse_os_login() {
  user=$(env | grep "OS_USERNAME" | cut -d = -f 2)
  project=$(env | grep "OS_PROJECT_NAME" | cut -d = -f 2)
  domain=$(env | grep "OS_USER_DOMAIN_NAME" | cut -d = -f 2)
  if [[ $user ]]; then
    echo "[$domain:$user/$project]"
  fi
}

BOLD="\[\e[1m\]"
NO_BOLD="\[\e[21m\]"
DIM="\[\e[2m\]"
NO_DIM="\[\e[22m\]"
RED="\[\e[00;31m\]"
L_RED="\[\e[01;31m\]"
GREEN="\[\e[00;32m\]"
YELLOW="\[\e[00;33m\]"
L_BLUE="\[\e[01;34m\]"
BLUE="\[\e[00;34m\]"
GREY="\[\e[0m\]"
CYAN="\[\e[36m\]"

PS1="${GREEN}\u@\h${GREY}:${BOLD}${CYAN}\$([ -f ~/.rvm/bin/rvm-prompt ] && ~/.rvm/bin/rvm-prompt) ${NORMAL}${CYAN}\$(type __git_ps1 2>/dev/null| head -1 | grep -q '__git_ps1 is a function' &&__git_ps1 \" (%s)\") \n${YELLOW}\w${GREY}\n$ ${GREY}"
#PS1="\[\033[01;34m\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\$(parse_os_login)\[\033[00m\]:\$([ -f ~/.rvm/bin/rvm-prompt ] && ~/.rvm/bin/rvm-prompt) \[\033[01;36m\]\$(type __git_ps1 2>/dev/null| head -1 | grep -q '__git_ps1 is a function' &&__git_ps1 \" (%s)\") \n\[\033[00;36m\]\w\[\033[00;0m\]\n\$\[\033[00m\] "
export PS1

alias copsi="cops -bp"
alias copsx="cops -X1"
alias copsx2="cops -X2"
alias copsgex="cops get -e -X1"
alias ls="ls --color"

[ -f ~/cops_completion.sh ] && \
source ~/cops_completion.sh

[ -f ~/gittmp/github.com/openshift/origin/contrib/completions/bash/oadm ] && \
source ~/gittmp/github.com/openshift/origin/contrib/completions/bash/oadm
[ -f ~/gittmp/github.com/openshift/origin/contrib/completions/bash/oc ] && \
source ~/gittmp/github.com/openshift/origin/contrib/completions/bash/oc
[ -f ~/gittmp/github.com/openshift/origin/contrib/completions/bash/openshift ] && \
source ~/gittmp/github.com/openshift/origin/contrib/completions/bash/openshift

export GOROOT=/usr/local/go
grep -q $GOROOT <<<$PATH || export PATH="$GOROOT/bin:$PATH"

export GOPATH=$HOME/go
grep -q "$GOPATH" <<<$PATH || export PATH="$GOPATH/bin:$PATH"

alias rppj="ruby -e \"require 'json'; puts (JSON.pretty_generate JSON.parse(STDIN.read))\""
alias os="openstack"

export ANSIBLE_NOCOWS=1

# Add ~/bin to PATH if not already there
echo $PATH | tr ":" "\n" | grep ^~/bin$ || export PATH="~/bin:$PATH"
