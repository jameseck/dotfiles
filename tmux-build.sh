#!/bin/sh
set -o pipefail
set -e

if [ -e ~/bin/tmux ] && [ "$1" != "-f" ]; then
  echo "tmux binary already exists in ~/bin/"
  echo "Pass -f to force overwrite"
  exit 1
fi

GITDIR=~/gittmp/github.com/justone/docker-tmux-static

[ ! -d $GITDIR ] && mkdir -p $GITDIR 2> /dev/null && true

if [ ! -d $GITDIR/.git ]; then
  git clone https://github.com/justone/docker-tmux-static $GITDIR
else
  git -C $GITDIR pull
fi

docker build -t tmux $GITDIR
docker run --rm tmux cat /tmux/tmux > ~/bin/tmux && chmod +x ~/bin/tmux
docker rmi tmux
