#!/bin/bash

# Who?
# Ioannis Petrousov
# petrousov@gmail.com


# 1. find which OS you are on
uname_out="$(uname -s)"
case "${uname_out}" in
    Linux*)     current_os=Linux;;
    Darwin*)    current_os=Mac;;
    CYGWIN*)    current_os=Cygwin;;
    MINGW*)     current_os=MinGw;;
    *)          current_os="UNKNOWN:${unameOut}"
esac
#echo "You on a ${current_os}"

# 2. install necessary packages
if [ "$current_os" == "Mac" ]
then
    echo "You are on a Mac, Good luck..."
    for package in $(cat packages)
    do
        brew install "$package"
    done
fi

# TODO
# Add package installations for Centos, Ubuntu, Debian

# 3. apply configurations

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install tmux configuration to local box
cp tmux ~/.tmux.conf

# install git configuration to local box
cp gitconfig ~/.gitconfig
