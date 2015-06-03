#!/bin/sh

WHERE=${WHERE-$HOME/projects/config}

packages="git curl terminator vim xclip"
dpkg -s $packages >/dev/null 2>&1 && {
  echo "Packages already install"
} || {
  sudo apt-get update
  sudo apt-get install -y $packages
}

[ ! -d "$WHERE" ] && {
  # Get repo
  mkdir -p $WHERE/..
  git clone --recursive https://github.com/gerchardon/config.git $WHERE
} || {
  # Refresh repo
  git -C $WHERE pull
}

# Configure Bash Aliases
ln -sf $WHERE/.bash_aliases $HOME/
ln -sf $WHERE/.alias.d/ $HOME/
ln -sf $WHERE/bin $HOME/

# Apps Config
ln -sf $WHERE/terminator ~/.config/

# Git Config
ln -sf $WHERE/git/.gitalias $HOME/
ln -sf $WHERE/git/.giturl $HOME/
git config --global --replace-all include.path "~/.gitalias" "~/.gitalias"

# NodeJs Config (with nvm)
if [ ! -d "$HOME/.nvm" ]; then
  git clone github:creationix/nvm $HOME/.nvm
else
  # Get last tag
  git -C "$HOME/.nvm" fetch --all >/dev/null 2>&1
  git -C "$HOME/.nvm" checkout master >/dev/null 2>&1
  git -C "$HOME/.nvm" pull >/dev/null 2>&1
  git -C "$HOME/.nvm" checkout $(git -C "$HOME/.nvm" describe --abbrev=0 --tags) >/dev/null 2>&1
fi
. $HOME/.nvm/nvm.sh
echo "Update iojs"
nvm install iojs
nvm alias default iojs
