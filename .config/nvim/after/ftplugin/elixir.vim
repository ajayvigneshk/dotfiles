setlocal number
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
setlocal signcolumn=yes
setlocal makeprg=mix
" buffer / global?
nnoremap <buffer> <leader>mc :Make compile --warnings-as-errors --ignore-module-conflict<CR>
nnoremap <buffer> <leader>ml :Make lint --strict<CR>
" TODO improve
" Show full paths on wildmenu
nnoremap <buffer> <leader>fd :find 
