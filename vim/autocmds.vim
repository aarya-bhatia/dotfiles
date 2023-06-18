" Autocommands {{{ 

" Return to last edit position when opening files (You want this!)
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

augroup filetypes
	autocmd!
	autocmd FileType markdown,text setlocal spell spelllang=en_us
	autocmd FileType markdown,text setlocal wrap
	autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType c,cpp setlocal textwidth=120
	autocmd FileType c,cpp setlocal foldmethod=syntax
	autocmd FileType c,cpp setlocal ts=2 sts=2 sw=2 et
    autocmd BufRead,BufNewFile *.h set filetype=c
augroup END

" }}}
