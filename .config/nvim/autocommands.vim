" comments
au FileType asm setlocal commentstring=#\ %s

" Return to last edit position when opening files
au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" Trim trailing whitespace on lines
au BufWritePost * :%s/\s\+$//e | nohlsearch

au BufNewFile,BufRead *.ejs setlocal filetype=html

au FileType c,cpp	setlocal foldmarker={,} foldlevel=4
" au FileType c,cpp	setlocal ts=2 sts=2 sw=2 et

au FileType markdown,text setlocal spell spelllang=en_us
au FileType markdown,text setlocal wrap

au FileType make setlocal ts=4 sts=4 sw=4 noet list
