"NOTE: files in the plugin directory are automatically sourced
"{{{ elixir (Vim-test) global vars
let g:test#runner_commands = ['ExUnit']
"}}}
"{{{ remote, elixir, sort aliases
"" https://vim.fandom.com/wiki/Search_for_lines_not_containing_pattern_and_other_helpful_searches
" Why without -1 in the end marker regex?
" Because the regex matches mutliple lines but the number is from the first line match
" Also views are much better than marks for logical + physical cursor position

" TODO improve into buffer local command if that makes sense (with
" filetype autocmd and such)
" errors
" loading view (seems)fails on files with one aliases -> not sure why(even though I'm using silent!), but moving loadview to BufWritePost helps
augroup sort_imports
	autocmd!
	autocmd BufWritePre ~/remote/code/tiger/**/*.ex,~/remote/code/tiger/**/*.exs silent! mkview! | silent! g/^\(\(alias\)\@!.\)*$\n\s*alias/+1,/\s*alias.*$\n^\(\(alias\)\@!.\)*$/ sort i
	autocmd BufWritePost ~/remote/code/tiger/**/*.ex,~/remote/code/tiger/**/*.exs silent! loadview
augroup end
" LSP formatter bug on elixir
" augroup mix_format
" 	autocmd!
" 	autocmd BufWritePost ~/remote/code/tiger/**/*.ex,~/remote/code/tiger/**/*.exs silent! !mix format %
" augroup end
"}}}
