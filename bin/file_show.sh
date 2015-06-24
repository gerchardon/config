#!/bin/bash

if [[ $# -eq 0 ]];
then
    echo "Usage : $0 <file_name>"
    exit 1
fi

file=$1

# FIXME Need to know if exist
if [[ -f $file ]];
then
    package=$(dpkg -S $file | awk -F ":" '{ print $1 }')
else
    package=$(apt-file search $file | awk -F ":" '{ print $1 }')
fi

temp=$(mktemp -d -t file_show.XXXX)
cd $temp && apt-get download $package 1>/dev/null 2>&1

name=$temp/*.deb
dpkg --fsys-tarfile $name | tar xOf - .$file

rm -R $temp
