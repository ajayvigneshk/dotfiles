function! CopyLinestoRegister(lines)
  let joined_lines = join(a:lines, "\n")
  if len(a:lines) > 1
    let joined_lines .= "\n"
  endif
  echom joined_lines
  let @+ = joined_lines
endfunction
let g:nnn#action = {
	\ '<c-e>': 'edit',
	\ '<c-t>': 'tab split',
	\ '<c-x>': 'split',
	\ '<c-v>': 'vsplit',
	\ '<c-o>': function('CopyLinestoRegister') }
