function! LF()
	let temp = tempname()
	exec 'silent !lf -selection-path=' . shellescape(temp)
	if !filereadable(temp)
		redraw!
		return
	endif
	let names = readfile(temp)
	if empty(names)
		redraw!
		return
	endif
	exec 'edit ' . fnameescape(names[0])
	for name in names[1:]
		exec 'argadd ' . fnameescape(name)
	endfor
	redraw!
endfunction

command! -bar LF call LF()
" nnoremap <leader>- :LF<CR>
