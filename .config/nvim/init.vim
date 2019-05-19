let mapleader = " "
call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ 'for': 'rust',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" (Optional) Multi-entry selection UI.
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
Plug 'altercation/vim-colors-solarized'
" using vim-plug
Plug 'mcchrish/nnn.vim'

call plug#end()

if version >= 600
    filetype plugin indent on
endif

set nocompatible
syntax on

set path+=**
set wildmenu
" Solarized vim config
set background=dark
colorscheme solarized

let g:deoplete#enable_at_startup = 1
so ~/.config/nvim/rcplugins/lspshortcuts.func
