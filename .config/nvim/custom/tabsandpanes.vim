function! CaptureMode(mode)
	if &buftype == 'terminal' 
		let b:mode=a:mode
	endif
endfunction
"Tabs switching
nnoremap <silent> <C-Tab> :call CaptureMode("normal")<CR>gt
nnoremap <silent> <C-S-Tab> :call CaptureMode("normal")<CR>gT
cnoremap <silent> <C-Tab> <C-c>:call CaptureMode("command")<CR>gt
cnoremap <silent> <C-S-Tab> <C-c>:call CaptureMode("command")<CR>gT
vnoremap <silent> <C-Tab> <C-[>:call CaptureMode("visual")<CR>gt
vnoremap <silent> <C-S-Tab> <C-[>:call CaptureMode("visual")<CR>gT
inoremap <C-Tab> <C-[>gt
inoremap <C-S-Tab> <C-[>gT
tnoremap <silent> <C-Tab> <C-\><C-n>:call CaptureMode("terminal")<CR>gt
tnoremap <silent> <C-S-Tab> <C-\><C-n>:call CaptureMode("terminal")<CR>gT
"Panes
"Mappings
"<Super-[>
nnoremap <silent> <F17> :call CaptureMode("normal")<CR><C-w>W
cnoremap <F17> <C-c>:call CaptureMode("command")<C-w>W
inoremap <F17> <C-[><C-w>W
vnoremap <silent> <F17> <C-[>:call CaptureMode("visual")<CR><C-w>W
tnoremap <silent> <F17> <C-\><C-n>:call CaptureMode("terminal")<CR><C-w>W
"<Super-]>
nnoremap <silent> <F18> :call CaptureMode("normal")<CR><C-w>w
cnoremap <F18> <C-c>:call CaptureMode("command")<C-w>w
inoremap <F18> <C-[><C-w>w
vnoremap <silent> <F18> <C-[>:call CaptureMode("visual")<CR><C-w>w
tnoremap <silent> <F18> <C-\><C-n>:call CaptureMode("terminal")<CR><C-w>w
