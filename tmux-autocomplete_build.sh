#!/bin/sh

mkdir -p "${HOME}/tmp"
git clone https://github.com/jameseck/tmux-autocomplete ${HOME}/tmp/tmux-autocomplete
docker run --rm -v "${HOME}/tmp/tmux-autocomplete":/usr/src/tmux-autocomplete:Z -w /usr/src/tmux-autocomplete golang:1.8  sh -c "go get -d -v && go build -v"
cp "${HOME}/tmp/tmux-autocomplete/tmux-autocomplete" "${HOME}/bin/"
rm -rf "${HOME}/tmp/tmux-autocomplete"
