function StartInPreviousMode()
	if exists("b:mode")
		"echom b:mode
		if b:mode=="terminal"
			:startinsert
		elseif b:mode=="visual"
			:normal gv
"TODO Future?
"		elseif b:mode=="command"
"			:<Up>
		endif
	endif
endfunction
augroup terminalgroup
 autocmd!
 autocmd TermOpen * :startinsert 
 autocmd BufEnter * if &buftype == 'terminal' | :call StartInPreviousMode() | endif
 autocmd TextYankPost * if &buftype == 'terminal' | let @*=@" | :startinsert | endif
augroup END
"General
tnoremap <C-[> <C-\><C-n>
"Tabs creation and closing
"<Super-t>
nnoremap <F13> :call CaptureMode("normal")<CR>:tabnew<CR>:term<CR>
cnoremap <F13> <C-c>:call CaptureMode("command"):tabnew<CR>:term<CR>
inoremap <F13> <C-[>:tabnew<CR>:term<CR>
vnoremap <F13> <C-[>:call CaptureMode("visual")<CR>:tabnew<CR>:term<CR>
tnoremap <F13> <C-\><C-n>:call CaptureMode("terminal")<CR>:tabnew<CR>:term<CR>
"<Super-w>
nnoremap <F14> :q<CR>
cnoremap <F14> <C-c>:q<CR>
inoremap <F14> <C-[>:q<CR>
vnoremap <F14> <C-[>:q<CR>
tnoremap <F14> <C-\><C-n>:q<CR>
"General
set splitright
set splitbelow
"<Super-D>
nnoremap <F15> :call CaptureMode("normal")<CR>:vnew<CR>:term<CR>
cnoremap <F15> <C-c>:call CaptureMode("command"):vnew<CR>:term<CR>
inoremap <F15> <C-[>:vnew<CR>:term<CR>
vnoremap <F15> <C-[>:call CaptureMode("visual")<CR>:vnew<CR>:term<CR>
tnoremap <F15> <C-\><C-n>:call CaptureMode("terminal")<CR>:vnew<CR>:term<CR>
"<Super-Shift-D>
nnoremap <F16> :new<CR>:term<CR>
cnoremap <F16> <C-c>:call CaptureMode("command"):new<CR>:term<CR>
inoremap <F16> <C-[>:new<CR>:term<CR>
vnoremap <F16> <C-[>:call CaptureMode("visual")<CR>:new<CR>:term<CR>
tnoremap <F16> <C-\><C-n>:call CaptureMode("terminal")<CR>:new<CR>:term<CR>
