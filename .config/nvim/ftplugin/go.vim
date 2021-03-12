if exists('g:loaded_gopls_lsp')
  finish
endif
if has('nvim-0.5')
	luafile ~/.config/nvim/ftplugin/go-0.5.lua
elseif has('nvim-0.4')
	source ~/.config/nvim/ftplugin/go-0.4.vim
endif
let g:loaded_gopls_lsp = 1
