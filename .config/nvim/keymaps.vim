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
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>te :tabedit **/*
nnoremap <leader>tf :tabfind *
"}}}
