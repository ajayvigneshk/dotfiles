#!/bin/bash
next_color=$1
if [[ "$next_color" == "dark" ]]; then
	current_color="light"
else
	current_color="dark"
fi
sed -i'' -e "s/set background=$current_color/set background=$next_color/g" ~/.config/nvim/init.vim
sed -i'' -e "s/solarized_$current_color.toml/solarized_$next_color.toml/g" ~/.config/alacritty/alacritty.toml
sed -i'' -e "s/vimstatusline3-$current_color/vimstatusline3-$next_color/g"  ~/.tmux.conf
tmux source-file ~/.tmux.conf 
# Below is old and useless (I think)
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
