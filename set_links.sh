#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
HOME=~

[ ! -d ~/.vim ] && mkdir ~/.vim

mkdir -p ~/.vim/autoload && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

ln -fvs $DIR/bashrc $HOME/.bashrc
ln -fvs $DIR/bash_profile $HOME/.bash_profile
ln -fvs $DIR/gitconfig $HOME/.gitconfig
ln -fvs $DIR/git-prompt.sh $HOME/.git-prompt.sh
ln -fvs $DIR/tmux.conf $HOME/.tmux.conf
ln -fvs $DIR/vim/update_bundles $HOME/.vim/update_bundles
ln -fvs $DIR/vimrc $HOME/.vimrc
ln -fvs $DIR/sshrc $HOME/.ssh/rc
