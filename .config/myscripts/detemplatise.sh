#!/bin/bash
sed "s/@@background@@/$1/g" ~/.config/nvim/init.template.vim > ~/.config/nvim/init.vim
sed "s/@@background@@/$1/g" ~/.config/alacritty/alacritty.template.yml > ~/.config/alacritty/alacritty.yml
sed "s/@@background@@/$1/g" ~/.tmux.template.conf > ~/.tmux.conf
tmux source-file ~/.tmux.conf 
if [ "$2" == "presentation" ]; then
	if [ "$1" == "dark" ]; then
		GUI_BG=#586e75
		GUI_FG=#002b36
		echo "highlight CursorLine guibg=$GUI_BG guifg=$GUI_FG" >> ~/.config/nvim/init.vim
	else
		GUI_BG=#93a1a1 
		GUI_FG=#fdf6e3
		echo "highlight CursorLine guibg=$GUI_BG guifg=$GUI_FG" >> ~/.config/nvim/init.vim
	fi
fi
