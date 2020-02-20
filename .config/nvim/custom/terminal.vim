augroup terminalgroup
 autocmd!
 autocmd TermOpen * :startinsert 
 autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
 autocmd TextYankPost * if &buftype == 'terminal' | let @*=@" | normal i | endif
augroup END
"General
tnoremap <C-[> <C-\><C-n>
"Tabs creation and closing
"<Super-t>
nnoremap <F13> :tabnew<CR>:term<CR>
cnoremap <F13> <C-c>:tabnew<CR>:term<CR>
inoremap <F13> <C-[>:tabnew<CR>:term<CR>
tnoremap <F13> <C-\><C-n>:tabnew<CR>:term<CR>
"<Super-w>
nnoremap <F14> :q<CR>
cnoremap <F14> <C-c>:q<CR>
inoremap <F14> <C-[>:q<CR>
tnoremap <F14> <C-\><C-n>:q<CR>
"General
set splitright
set splitbelow
"<Super-D>
nnoremap <F15> :vnew<CR>:term<CR>
cnoremap <F15> <C-c>:vnew<CR>:term<CR>
inoremap <F15> <C-[>:vnew<CR>:term<CR>
tnoremap <F15> <C-\><C-n>:vnew<CR>:term<CR>
"<Super-Shift-D>
nnoremap <F16> :new<CR>:term<CR>
cnoremap <F16> <C-c>:new<CR>:term<CR>
inoremap <F16> <C-[>:new<CR>:term<CR>
tnoremap <F16> <C-\><C-n>:new<CR>:term<CR>
