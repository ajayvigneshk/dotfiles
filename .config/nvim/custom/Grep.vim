nnoremap <M-s-f> :Grep ""<Up><Left>
command! -nargs=* Grep AsyncRun -program=grep @ <args> 
cnoremap <M-i> <C-\>eAddOpts('i')<CR>
cnoremap <M-w> <C-\>eAddOpts('w')<CR>
cnoremap <M-g> <C-\>eAddOpts('g')<CR>
cnoremap <M-S-i> <C-\>eRemoveOpts('i')<CR>
cnoremap <M-S-w> <C-\>eRemoveOpts('w')<CR>
cnoremap <M-S-g> <C-\>eRemoveOpts('g')<CR>
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
			let existingfiletypes=strpart(updatedcmdline, filetypesexists+5,idxofnextsinglequote-(filetypesexists+6)) . ","
			let updatedcmdline =RemoveOpts("g")
		endif
		let filetypes = input("FileTypes(eg: *.rs,!*.go): ", existingfiletypes ) "Todo custom completion
		if strridx(filetypes,",")+1==strlen(filetypes)
			let filetypes=strpart(filetypes,0,strlen(filetypes)-1)
		endif
		if filetypes!="" 
			let paramtext=" -" . a:parameter . " '{" . filetypes . "}'"
		endif
	elseif idxofparameter==-1
		let paramtext=" -" . a:parameter
	endif
	let updatedcmdline=strpart(updatedcmdline,0,4) . paramtext . strpart(updatedcmdline,4)
	call setcmdpos(strlen(updatedcmdline))
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
	call setcmdpos(strlen(updatedcmdline))
	return updatedcmdline
endfunction
