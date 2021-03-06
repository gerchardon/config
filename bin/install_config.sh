#!/bin/bash

##
## Shell script to configure env
##  * Install gerchardon/config
##  * Run install/update scripts

WHERE=${WHERE-$HOME/projects/config}

## FUNCTION UTIL

# Check or install packages $1
function check_or_install_packages() {
    packages=$@
    dpkg -s $packages >/dev/null 2>&1 && {
        echo "Packages already install"
    } || {
        sudo apt-get update
        sudo apt-get install -y $packages
    }
}

function git_clone() {
    repo=$1
    dir=$2
    [[ ! -d "$dir" ]] && {
        mkdir -p "$dir/.."
        git clone --recursive $repo $dir
    } || {
        git -C $dir pull
    }
}

## START SCRIPT

check_or_install_packages \
    "git" "curl" \
    "terminator" "vim" \
    "xclip" "wget" "binutils"

git_clone "https://github.com/gerchardon/config.git" "$WHERE"

$WHERE/bin/update_config
