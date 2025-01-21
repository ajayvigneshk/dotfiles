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
"Ask for confirmation (for eg. unsaved buffers being closed)
set confirm
set cursorline cursorcolumn
set relativenumber
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
set background=light
colorscheme solarized8
if has('nvim')
	if &background ==# "dark"
		highlight ActiveWindow guibg=#002b36
		highlight InactiveWindow guibg=#073642
		set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
	else
		highlight ActiveWindow guibg=#fdf6e3
		highlight InactiveWindow guibg=#eee8d5
		set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
	endif
endif
" highlights for different search categories
" Colors from solarized scheme
highlight Search gui=reverse guifg=#6c71c4
highlight CurSearch gui=reverse guifg=#d33682
" This also works for highlight on yank
highlight IncSearch gui=reverse guifg=#d33682
" Lightline
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'material',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
 "}}}
  "{{{ Source , custom files.
source $CONFIG_DIR/nvim/custom/Grep.vim
" Disable default mappings
" TODO
runtime macros/sandwich/keymap/surround.vim
source $CONFIG_DIR/nvim/vimwiki.vim
 "}}}
 "{{{ Nnn
" Use env for consistent usage instead
" let g:nnn#command = 'nnn -A -d'
let g:nnn#set_default_mappings = 0
let g:nnn#replace_netrw = 1
" It's nice to have native mappings on nnn. The above terminal mappings make
" it awful for nnn
autocmd FileType nnn tnoremap <buffer> <Esc> <Esc>
autocmd FileType nnn tnoremap <buffer> <C-w> <C-\><C-n><C-w>
" Start nnn in the current file's directory (this is easier to do in vimscript
" than lua / fnl)
nnoremap <expr> <leader>n filereadable(expand('%'))==1 ? '<CMD>NnnPicker %:p<CR>' : '<CMD>NnnPicker %:p:h<CR>'
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
lua require('lsp')
 "}}}
"{{{ Tree sitter
lua require("treesitter")
"}}}
"{{{ highlighted yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=500}
augroup END
"}}}
"{{{ general
runtime keymaps.vim
" set path based on top level dirs(honouring git exclusions)
" Found somewhere on reddit with comments from romainl
call git#SetSanePath()
"}}}
"{{{abbreviations
iab :positive: ✅
iab :negative: 🚫
iab :mixed: ⚠️
"}}}
"{{{experimental
function! HandleGf()
  try
    normal! gf
  catch /.*/
    if &filetype ==# 'elixir'
      if confirm("File not found. Create it?", "&Yes\n&No", 1) == 1
        silent! execute "e lib/" . elixir#util#get_filename(expand('<cfile>')) . ".ex"
      endif
    else
      throw v:exception
    endif
  endtry
endfunction
nnoremap gf :call HandleGf()<CR>

" Auto-create parent directories (except for URIs "://").
au BufWritePre,FileWritePre * if @% !~# '\(://\)' | call mkdir(expand('<afile>:p:h'), 'p') | endif
"}}}
