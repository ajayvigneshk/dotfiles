set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
nmap <C-s>f :Grep<Up><C-s><F1>
command! -nargs=* Grep AsyncRun -program=grep @ <args> 
cnoremap <C-s><F1> <C-\>ePadQuotes()<CR>
cnoremap <C-s>i <C-\>eAddOpts('i')<CR>
cnoremap <C-s>w <C-\>eAddOpts('w')<CR>
cnoremap <C-s>g <C-\>eAddOpts('g')<CR>
cnoremap <C-s>f <C-\>eAddOpts('F')<CR>
cnoremap <C-s><C-i> <C-\>eRemoveOpts('i')<CR>
cnoremap <C-s><C-w> <C-\>eRemoveOpts('w')<CR>
cnoremap <C-s><C-g> <C-\>eRemoveOpts('g')<CR>
cnoremap <C-s><C-f> <C-\>eRemoveOpts('F')<CR>
function PadQuotes()
	let cmdline = getcmdline()
	if strridx(cmdline,"/")+1!=strlen(cmdline)
		let cmdline = cmdline . " \"\" ./"
	else
		let cmdline = cmdline
	endif
	call setcmdpos(strlen(cmdline)-3)
	return cmdline
endfunction
function AddOpts(parameter)
	let updatedcmdline=getcmdline()
	if stridx(updatedcmdline,"Grep")!=0
		return updatedcmdline
	endif
	let len=strlen(updatedcmdline)
	let idxofparameter =stridx(updatedcmdline,"-" . a:parameter)
	let paramtext=""
	if a:parameter=="g"
		let filetypesexists=stridx(updatedcmdline,"-g ")
		let existingfiletypes =""
		if filetypesexists!=-1
			let idxofnextsinglequote=stridx(updatedcmdline,"'",filetypesexists+4)
			let existingfiletypes=strpart(updatedcmdline, filetypesexists+7,idxofnextsinglequote-(filetypesexists+8)) . ","
			let updatedcmdline =RemoveOpts("g")
		endif
		let filetypes = input("FileTypes(eg: rs,!go): ", existingfiletypes ) "Todo custom completion
		if strridx(filetypes,",")+1==strlen(filetypes)
			let filetypes=strpart(filetypes,0,strlen(filetypes)-1)
		endif
		if filetypes!="" 
			let paramtext=" -" . a:parameter . " '*.{" . filetypes . "}'"
		endif
	elseif idxofparameter==-1
		let paramtext=" -" . a:parameter
		echom paramtext
	endif
	let updatedcmdline=strpart(updatedcmdline,0,4) . paramtext . strpart(updatedcmdline,4)
	call setcmdpos(strlen(updatedcmdline)-3)
	return updatedcmdline
endfunction
function RemoveOpts(parameter)
	let cmdline=getcmdline()
	if stridx(cmdline,"Grep")!=0
		return cmdline
	endif
	if a:parameter == "g"
		let updatedcmdline = substitute(cmdline, "\\s-g\\s'.\\+'","","")
	else
		let updatedcmdline = substitute(cmdline, " -" . a:parameter, "","")
	endif
	call setcmdpos(strlen(updatedcmdline)-3)
	return updatedcmdline
endfunction
