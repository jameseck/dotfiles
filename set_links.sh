#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME=~/tmp2

ln -fvs $DIR/bashrc $HOME/.bashrc
ln -fvs $DIR/gitconfig $HOME/.gitconfig
ln -fvs $DIR/git-prompt.sh $HOME/.git-prompt.sh
ln -fvs $DIR/tmux.conf $HOME/.tmux.conf
ln -fvs $DIR/vim $HOME/.vim
ln -fvs $DIR/vimrc $HOME/.vimrc
