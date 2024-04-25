"{{{ general options
set pumblend=10
set pumheight=8
" NOTE: quoting the value doesn't work
set wildmode=lastused:full
" Adding this to make vim-test autosave tests before running.
" Not sure if it'll have any undesirable side effects
set autowrite
" Not respected by wildmenu (commenting this doesn't seem to affect much)
" set completeopt=menu,preview,noselect
"}}}
"{{{ general mappings
"{{{Buffer switching
nnoremap gb :ls<CR>:b<Space>
" nnoremap <leader>b :buffer *
set wildcharm=<C-z>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>B :sbuffer <C-z><S-Tab>
"}}} 
"{{{ find 
nnoremap <leader>fd :find *
" mapping to ease find files from current dir
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}
"{{{ for tabs
" This apparently shadows some mapping about tags (don't care for now)
nnoremap <C-t> <CMD>tabnew<CR>
inoremap <C-t> <CMD>tabnew<CR>
" nnoremap <leader>te :tabedit **/*
" nnoremap <leader>tf :tabfind *
" }}}
"{{{ Toggles quickfix
" requires asyncrun plugin
noremap <F9> :call asyncrun#quickfix_toggle(8)<cr>
" mapping that is unimpaired style
nnoremap yoq :call asyncrun#quickfix_toggle(8)<cr>
" }}}
" {{{ Delete mappings
" Helps delete without affecting registers
" https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/11993928#11993928
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
" }}}
"{{{ relative line number jumplist
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'j'
"}}}
"{{{ windows
" https://stackoverflow.com/a/29923368
" Maximize current window (horizontal + vertical)
nnoremap <C-W>M <C-W>\|<C-W>_
"}}}
" }}}
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
"{{{ commands
"{{{ scratch buffer
"https://www.reddit.com/r/vim/comments/4tb61s/weekly_vim_tips_and_tricks_thread_19/d5kn931/"
command! SC vnew | setlocal nobuflisted buftype=nofile bufhidden=wipe noswapfile
" }}}
"}}}
"{{{ GH Copilot
" refer to :h index and search `not used`
" Used <C-S> which is marked not used as kind of the prefix and then what
" seems like reasonable pneumonics
" Might be useful to think about contextually adding these maps? But why would
" I want <C-S> something in insert mode?
imap <silent><script><expr> <C-S><C-Y> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
imap <C-S><C-W> <Plug>(copilot-accept-word)
imap <C-S><C-L> <Plug>(copilot-accept-line)
imap <C-S><C-N> <Plug>(copilot-next)
imap <C-S><C-P> <Plug>(copilot-previous)
imap <C-S><C-D> <Plug>(copilot-dismiss)
"}}}
