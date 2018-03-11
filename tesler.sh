#!/bin/bash

# Who?
# Ioannis Petrousov
# petrousov@gmail.com

mac_fix_home_end_buttons () {
    # Make Home and End keys work when you connect a normal keyboard on mac
    # https://apple.stackexchange.com/questions/18016/can-i-change-the-behavior-of-the-home-and-end-keys-on-an-apple-keyboard-with-num

    if [ ! -d ~/Library/KeyBindings/ ]
        then
            mkdir ~/Library/KeyBindings/
            cat mac_keybindings.txt >> ~/Library/KeyBindings/DefaultKeyBinding.dict
        else
            cat mac_keybindings.txt >> ~/Library/KeyBindings/DefaultKeyBinding.dict
    fi
}

install_packages_for_mac () {
    for package in $(cat packages)
    do
        brew install "$package"
    done
}

apply_package_configs () {
    # install tmux plugin manager
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # install tmux configuration to local box
    cp tmux ~/.tmux.conf

    # install git configuration to local box
    cp gitconfig ~/.gitconfig

    # install irb config to local box
    cp irbrc ~/.irbrc

    # TODO
    # install vim config
}

uname_out="$(uname -s)"
case "${uname_out}" in
    Linux*)     current_os=Linux;;
    Darwin*)    current_os=Mac;;
    CYGWIN*)    current_os=Cygwin;;
    MINGW*)     current_os=MinGw;;
    *)          current_os="UNKNOWN:${uname_out}"
esac

# 2. install necessary packages
if [ "$current_os" == "Mac" ]
then
    echo "You are on a Mac, Good luck..."
    mac_fix_home_end_buttons
    install_packages_for_mac
    apply_package_configs
fi

# TODO
# Add support for Centos, Ubuntu, Debian

