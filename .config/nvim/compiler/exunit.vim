" This is intended to be used by tpope's dispatch plugin
" This is copied from vim-elixir's exunit.vim, errorformat is the only intended change, 
" maybe I don't need all this copying
if exists("current_compiler")
  finish
endif
let current_compiler = "exunit"

if exists(":CompilerSet") != 2    " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C
CompilerSet makeprg=mix\ test
" My changes
" This is more of a hack where not matched lines are still on quickfix(as general lines) but folded
CompilerSet errorformat=
  \%E\ \ %n)\ %m(%o),
  \%C\ \ \ \ \ %f:%l,
  \%C\ \ \ \ \ code:%m,
  \%+C\ \ \ \ \ %.%#failed,
augroup exunit
  autocmd BufReadPost quickfix setlocal nofoldenable
  autocmd BufReadPost quickfix setlocal foldmethod=expr
  autocmd BufReadPost quickfix setlocal foldexpr=getline(v:lnum)[0]==\"\|\"
augroup END
" Works but ignores console output / makes console output part of error
" message, can't get general lines + exact line from stacktrace working
" CompilerSet errorformat=
"   \%E\ \ %n)\ %m(%o),
"   \%C\ \ \ \ \ \ \ %f:%l:\ (test),
"   \%C\ \ \ \ \ %m

let &cpo = s:cpo_save
unlet s:cpo_save

" vim: nowrap sw=2 sts=2 ts=8:
