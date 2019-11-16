#!/bin/bash
sed "s/@@background@@/$1/g" ~/.config/nvim/init.template.vim > ~/.config/nvim/init.vim
sed "s/@@background@@/$1/g" ~/.config/alacritty/alacritty.template.yml > ~/.config/alacritty/alacritty.yml
sed "s/@@background@@/$1/g" ~/.tmux.template.conf > ~/.tmux.conf
tmux source-file ~/.tmux.conf 
