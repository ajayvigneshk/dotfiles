"FZF
" nnoremap <C-p> : <C-u>FZF<CR>
let g:fzf_action = {
  \ 'ctrl-e': 'edit',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" elixir modules fuzzy finder
" Quick win(actual fix should come from LSP which might take ages)
" <C-X><C-M> doesn't work (despite showing no overridden keybindings)
inoremap <expr> <C-X><C-D> fzf#vim#complete('rg -o --no-filename --pcre2  "(?<=defmodule\s)Tiger.*(?=\sdo)" ./lib')
" inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
