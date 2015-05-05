#!/bin/bash

set -e

read -p "Git Username:" GIT_USERNAME
read -p "Git Email:" GIT_EMAIL

git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git config --global push.default simple

[[ ! -r "$HOME/.ssh/id_rsa.pub" ]] && ssh-keygen -t rsa -C "$GIT_EMAIL+$HOSTNAME"
cat $HOME/.ssh/id_rsa.pub | xclip -i
echo "Your key is add to your clipboard : add it to github,..."
