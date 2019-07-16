let mapleader = " "
call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ 'for': 'rust',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" (Optional) Multi-entry selection UI.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
Plug 'altercation/vim-colors-solarized'
Plug 'mcchrish/nnn.vim'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

call plug#end()

if version >= 600
    filetype plugin indent on
endif

set nocompatible
syntax on

set path+=**
set wildmenu
set noshowmode
set incsearch

let g:deoplete#enable_at_startup = 1
so ~/.config/nvim/rcplugins/lspshortcuts.func
if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" Solarized vim config
set background=dark
colorscheme solarized8
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
