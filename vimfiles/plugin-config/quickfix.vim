let g:qf_auto_resize = 0

au FileType qf cabbrev <buffer> K Keep
au FileType qf cabbrev <buffer> Rej Reject
au FileType qf cabbrev <buffer> Res Restore
au FileType qf nnoremap <buffer> dd :.Reject<CR>
au FileType qf vnoremap <buffer> d :Reject<CR>
au FileType qf nnoremap <buffer> [[ :colder<CR>
au FileType qf nnoremap <buffer> ]] :cnewer<CR>
