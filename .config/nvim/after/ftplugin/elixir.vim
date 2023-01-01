setlocal number
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
setlocal signcolumn=yes
setlocal makeprg=mix
" buffer / global?
nnoremap <buffer> <leader>mc :Make compile --warnings-as-errors --ignore-module-conflict<CR>
nnoremap <buffer> <leader>ml :Make lint --strict<CR>
setlocal foldexpr=nvim_treesitter#foldexpr()
setlocal foldmethod=expr
setlocal nofoldenable
" set path based on top level dirs(honouring git exclusions)
" Found somewhere on reddit with comments from romainl
call git#SetSanePath()
" Set marks based on last files
augroup ELIXIRMARKS
  autocmd!

  autocmd BufLeave *_controller.ex  normal! mC
  autocmd BufLeave *_test.exs  normal! mT
  autocmd BufLeave */views/*.ex  normal! mV
  "tiger specific
  autocmd BufLeave */handlers/*.ex  normal! mH
  autocmd BufLeave */services/*.ex,*/service/*.ex  normal! mS
  autocmd BufLeave */finders/*.ex  normal! mF
  autocmd BufLeave */values/*.ex  normal! mA
  autocmd BufLeave *html.eex  normal! mM
  autocmd BufLeave *text.eex  normal! mE
augroup END
