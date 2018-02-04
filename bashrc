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

PS1="\[\033[01;34m\]\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\$(parse_os_login)\[\033[00m\]:\$([ -f ~/.rvm/bin/rvm-prompt ] && ~/.rvm/bin/rvm-prompt) \[\033[01;36m\]\$(type __git_ps1 2>/dev/null| head -1 | grep -q '__git_ps1 is a function' &&__git_ps1 \" (%s)\") \n\[\033[00;36m\]\w\[\033[00;0m\]\n\$\[\033[00m\] "
export PS1

export NOCHOP=james.eckersall@10.44.255.186
export DEVHOP=james.eckersall@10.44.249.4

alias copsi="cops -bp"
alias copsx="cops -X1"
alias copsx2="cops -X2"
alias copsgex="cops get -e -X1"
source ~/cops_completion.sh

source ~/gittmp/github.com/openshift/origin/contrib/completions/bash/oadm
source ~/gittmp/github.com/openshift/origin/contrib/completions/bash/oc
source ~/gittmp/github.com/openshift/origin/contrib/completions/bash/openshift

export GOROOT=/usr/local/go
grep -q $GOROOT <<<$PATH || export PATH="$GOROOT/bin:$PATH"

export GOPATH=$HOME/go
grep -q "$GOPATH" <<<$PATH || export PATH="$GOPATH/bin:$PATH"

alias rppj="ruby -e \"require 'json'; puts (JSON.pretty_generate JSON.parse(STDIN.read))\""
alias os="openstack"

export ANSIBLE_NOCOWS=1
