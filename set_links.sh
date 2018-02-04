#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME=~

ln -fvs $DIR/bashrc $HOME/.bashrc
ln -fvs $DIR/gitconfig $HOME/.gitconfig
ln -fvs $DIR/git-prompt.sh $HOME/.git-prompt.sh
ln -fvs $DIR/tmux.conf $HOME/.tmux.conf
ln -fvs $DIR/vim/update_bundles $HOME/.vim/update_bundles
ln -fvs $DIR/vimrc $HOME/.vimrc
