"{{{ general options
set pumblend=10
set pumheight=8
" NOTE: quoting the value doesn't work
set wildmode=lastused:full
" Not respected by wildmenu (commenting this doesn't seem to affect much)
set completeopt=menu,preview,noselect
"}}}
"{{{ general mappings
" Buffer switching
nnoremap gb :ls<CR>:b<Space>
" nnoremap <leader>b :buffer *
set wildcharm=<C-z>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>
" find 
nnoremap <leader>f :find *
" mapping to ease find files from current dir
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" for tabs
" This apparently shadows some mapping about tags (don't care for now)
nnoremap <C-t> <CMD>tabnew<CR>
inoremap <C-t> <CMD>tabnew<CR>
" nnoremap <leader>te :tabedit **/*
" nnoremap <leader>tf :tabfind *

" Toggles quickfix
" requires asyncrun plugin
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>
" mapping that is unimpaired style
nnoremap yoq :call asyncrun#quickfix_toggle(8)<cr>
"}}}
"{{{ Quick fix niceties
" Automatically open quickfix when something populates it
" https://github.com/skywind3000/asyncrun.vim/wiki/Quickfix-Best-Practice
augroup QUICKFIX
    autocmd QuickFixCmdPost * call asyncrun#quickfix_toggle(8, 1)
augroup END
"}}}
"{{{ terminal mode mappings
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <M-[> <Esc>
  tnoremap <C-v><Esc> <Esc>
endif
"}}}
