packadd LanguageClient-neovim
packadd deoplete.nvim
packadd echodoc.vim
let g:LanguageClient_selectionUI="quickfix"
LanguageClientStart
call deoplete#enable()
EchoDocEnable

setlocal hidden
setlocal number
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
setlocal signcolumn=yes
setlocal statusline+=%{LanguageClient_statusLine()}

let g:LanguageClient_serverCommands = {
  \ 'c': ['clangd'],
  \ 'cpp': ['clangd'],
  \ }
let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

inoremap <buffer> {<cr> {<cr>}<c-o>O

call SetLSPShortcuts()
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu
