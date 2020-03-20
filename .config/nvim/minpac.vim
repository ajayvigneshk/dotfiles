function! PackInit() abort
	packadd minpac
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	call minpac#add('autozimu/LanguageClient-neovim', {'type': 'opt','branch': 'next', 'do': '!./install.sh' })
	call minpac#add('Shougo/deoplete.nvim', {'type': 'opt', 'do': 'UpdateRemotePlugins','rev':'e61b8faee0b07f837f9009d780cbc3c2caaef76a' })
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('mcchrish/nnn.vim')
	call minpac#add('lifepillar/vim-solarized8')
	call minpac#add('itchyny/lightline.vim')
	call minpac#add('tpope/vim-surround')
	call minpac#add('tpope/vim-unimpaired')
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-sensible')
	call minpac#add('Shougo/echodoc.vim', {'type': 'opt'})
	call minpac#add('skywind3000/asyncrun.vim')
"	call minpac#add('mhinz/neovim-remote')
endfunction
