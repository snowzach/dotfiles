#!/bin/bash

if [ "$1" == "" ]; then
    echo "setup.sh <path to this repo>"
    exit
fi
if [ ! -f $1/.bashrc ]; then
    echo "Path $1 is incorrect"
    exit
fi
rm ~/.bashrc ~/.bash_prompt ~/.tmux.conf ~/.tmuxline.conf ~/.nanorc

echo "Installing dotfiles..."
ln -s $1/.bashrc ~/.bashrc
ln -s $1/.bash_prompt ~/.bash_prompt
ln -s $1/.tmux.conf ~/.tmux.conf
ln -s $1/.tmuxline.conf ~/.tmuxline.conf
ln -s $1/.nanorc ~/.nanorc
ln -s $1/.wezterm.lua ~/.wezterm.lua

if [ ! -z "${WINDIR}" ]; then
    echo "Installing mintty files for cygwin..."
    rm ~/.minttyrc
    rm ~/.mintty/themes/argonaut
    ln -s $1/.minttyrc ~/.minttyrc
    mkdir -p ~/.mintty/themes
    ln -s `realpath $1/mintty_theme_argonaut` ~/.mintty/themes/argonaut
fi

    
