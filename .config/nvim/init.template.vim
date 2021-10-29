let mapleader = " "
"{{{ plugins
lua require("install_packer")
lua require("install_hotpot")
lua require("hotpot")
lua require("plugins")
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
source $CONFIG_DIR/nvim/custom/Grep.vim
" Disable default mappings
" TODO
source ~/.local/share/nvim/site/pack/packer/start/vim-sandwich/macros/sandwich/keymap/surround.vim
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
"{{{ autocompletion, lsp
lua require('nvim-cmp-setup')
lua require('lsp')
 "}}}
"{{{ vim-vsnip
" let g:vsnip_snippet_dir = expand('~/.config/vsnip/')
lua require("vim-vsnip")
" Todo move to fennel
imap <expr> <C-y>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-y>'
smap <expr> <C-y>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-y>'
imap <expr> <Tab> vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"
imap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<S-Tab>"
smap <expr> <Tab> vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<Tab>"
smap <expr> <S-Tab> vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)"      : "<S-Tab>"
"}}}
"{{{ Tree sitter
lua require("treesitter")
"}}}
