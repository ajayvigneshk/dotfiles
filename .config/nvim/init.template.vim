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
source ~/.config/nvim/rcplugins/lspshortcuts.func
source $CONFIG_DIR/nvim/custom/Grep.vim
"source ~/.config/nvim/custom/tabsandpanes.vim
"source ~/.config/nvim/custom/terminal.vim
" Disable default mappings
source $CONFIG_DIR/nvim/pack/minpac/start/vim-sandwich/macros/sandwich/keymap/surround.vim
source $CONFIG_DIR/nvim/vimwiki.vim
 "}}}
 "{{{ Nnn
let g:nnn#set_default_mappings = 0
" Start nnn in the current file's directory
nnoremap <leader>n :NnnPicker '%:p:h'<CR>
 "}}}
"{{{ vimwiki 
" gpg support
let g:GPGFilePattern = '*.\(gpg\|asc\|pgp\)\(.wiki\)\='
" foldmethod
let g:vimwiki_folding='list:quick'
 "}}}
