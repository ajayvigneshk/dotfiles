function! PackInit() abort
	packadd minpac
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	call minpac#add('autozimu/LanguageClient-neovim', {'type': 'opt','branch': 'next', 'do': '!./install.sh' })
	call minpac#add('Shougo/deoplete.nvim', {'type': 'opt', 'do': 'UpdateRemotePlugins' })
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('mcchrish/nnn.vim')
	call minpac#add('lifepillar/vim-solarized8')
	call minpac#add('itchyny/lightline.vim')
	call minpac#add('Shougo/echodoc.vim', {'type': 'opt'})
endfunction
