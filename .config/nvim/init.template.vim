let mapleader = " "
"{{{ minpac / plugins
source ~/.config/nvim/minpac.vim
" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()
"}}}
"{{{ Vim essentials / basic / misc  config
if version >= 600
    filetype plugin indent on
endif
set nocompatible
syntax on
set path+=**
set wildmenu
set ignorecase smartcase
"Set undofile option for undo persistence
set undofile
"Enable switching buffers without saving
set hidden
set cursorline cursorcolumn
" Set yank highlight duration
let g:highlightedyank_highlight_duration = 500
"}}}
"{{{ FZF
set rtp+=/usr/local/opt/fzf
source ~/.config/nvim/fzf.vim
"}}}
 "{{{ colors / themes
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Solarized vim config
set background=@@background@@
colorscheme solarized8_flat
" Lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'material',
      \ }
" highlight color to magenta
highlight HighlightedyankRegion guifg=#eee8d5 guibg=#d33682
 "}}}
  "{{{ Source , custom files.
if has('nvim-0.5')
	luafile ~/.config/nvim/rcplugins/lspshortcuts-0.5.lua
elseif has('nvim-0.4')
	source ~/.config/nvim/rcplugins/lspshortcuts.func
endif
source $CONFIG_DIR/nvim/custom/Grep.vim
"source ~/.config/nvim/custom/tabsandpanes.vim
"source ~/.config/nvim/custom/terminal.vim
" Disable default mappings
source $CONFIG_DIR/nvim/pack/minpac/start/vim-sandwich/macros/sandwich/keymap/surround.vim
source $CONFIG_DIR/nvim/vimwiki.vim
 "}}}
 "{{{ Nnn
let g:nnn#set_default_mappings = 0
let g:nnn#replace_netrw = 1
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker %:p:h<CR>
 "}}}
"{{{ vimwiki 
" Do not set filetype outside vimwiki directory
let g:vimwiki_global_ext = 0
" gpg support
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.wiki\)\='
" foldmethod
let g:vimwiki_folding='syntax:quick'
 "}}}
"{{{ Asyncrun
let g:asyncrun_open = 8
 "}}}
"{{{ autocompletion, completion-nvim
if has('nvim-0.5')
	" Set completeopt to have a better completion experience
	set completeopt=menuone,noinsert,noselect

	" Avoid showing message extra message when using completion
	set shortmess+=c
	let g:completion_enable_auto_popup = 0
	"" Manually trigger autocompletion
	imap <silent> <c-p> <Plug>(completion_trigger)
	let g:completion_enable_snippet = 'vim-vsnip'
endif
 "}}}
"{{{ vim-vsnip
let g:vsnip_snippet_dir = expand('~/.config/vsnip/')
imap <expr> <C-j> vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"
imap <expr> <C-k> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-k>"
smap <expr> <C-j> vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"
smap <expr> <C-k> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<C-k>"
"}}}
"{{{ language configs
luafile ~/.config/nvim/ftplugin/go-0.5.lua
luafile ~/.config/nvim/lang/tex.lua
"}}}
"{{{ Tree sitter
luafile ~/.config/nvim/lua/treesitter-textobjects.lua
"}}}
