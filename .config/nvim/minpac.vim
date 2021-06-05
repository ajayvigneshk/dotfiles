function! PackInit() abort
	packadd minpac
	call minpac#init()
	call minpac#add('k-takata/minpac', {'type': 'opt'})
	call minpac#add('junegunn/fzf.vim')
	call minpac#add('mcchrish/nnn.vim')
	call minpac#add('lifepillar/vim-solarized8')
	call minpac#add('itchyny/lightline.vim')
	call minpac#add('machakann/vim-sandwich')
	call minpac#add("tpope/vim-unimpaired")
	call minpac#add('tpope/vim-repeat')
	call minpac#add('tpope/vim-sensible')
	call minpac#add('skywind3000/asyncrun.vim')
	call minpac#add('jamessan/vim-gnupg')
	call minpac#add('vimwiki/vimwiki')
	call minpac#add('machakann/vim-highlightedyank')
	call minpac#add('hrsh7th/vim-vsnip')
	call minpac#add('hrsh7th/vim-vsnip-integ')
	call minpac#add('fatih/vim-go')
	call minpac#add('tpope/vim-rsi')
	if has('nvim-0.5')
		call minpac#add('neovim/nvim-lspconfig')
		call minpac#add('nvim-lua/completion-nvim')
		call minpac#add('nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}) " We recommend updating the parsers on update
	else
		call minpac#add('autozimu/LanguageClient-neovim', {'type': 'opt','branch': 'next', 'do': '!./install.sh' })
		call minpac#add('Shougo/deoplete.nvim', {'type': 'opt', 'do': 'UpdateRemotePlugins'})
		call minpac#add('Shougo/echodoc.vim', {'type': 'opt'})
	endif
endfunction
