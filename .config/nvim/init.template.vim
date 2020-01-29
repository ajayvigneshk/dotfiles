let mapleader = " "

source ~/.config/nvim/minpac.vim
" Define user commands for updating/cleaning the plugins.
" Each of them calls PackInit() to load minpac and register
" the information of plugins, then performs the task.
command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()


if version >= 600
    filetype plugin indent on
endif

set nocompatible
syntax on

set path+=**
set wildmenu
set noshowmode
set incsearch

"FZF
set rtp+=/usr/local/opt/fzf
source ~/.config/nvim/fzf.vim

so ~/.config/nvim/rcplugins/lspshortcuts.func
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Solarized vim config
set background=@@background@@
colorscheme solarized8
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
"Set undofile option for undo persistence
set undofile
"Enable switching buffers without saving
set hidden
source ~/.config/nvim/custom/Grep.vim
