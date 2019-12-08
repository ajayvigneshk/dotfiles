packadd LanguageClient-neovim
packadd deoplete.nvim
packadd echodoc.vim
LanguageClientStart
call deoplete#enable()
EchoDocEnable

setlocal hidden
setlocal number
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
setlocal signcolumn=yes
setlocal statusline+=%{LanguageClient_statusLine()}

compiler cargo

let g:LanguageClient_serverCommands.rust= ['rustup', 'run', 'stable', 'rls']
let $RUST_BACKTRACE = 1
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

inoremap <buffer> {<cr> {<cr>}<c-o>O
let g:rustfmt_autosave = 1

call SetLSPShortcuts()
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu
