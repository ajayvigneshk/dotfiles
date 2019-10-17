setlocal hidden
setlocal number
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
setlocal signcolumn=yes
setlocal statusline+=%{LanguageClient_statusLine()}

"compiler cargo

let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

inoremap <buffer> {<cr> {<cr>}<c-o>O
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

call SetLSPShortcuts()
