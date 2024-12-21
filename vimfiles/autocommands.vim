" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Trim trailing whitespace on lines
au BufWritePost * :%s/\s\+$//e | nohlsearch
" command TrimTrailingSpaces :%s/\s\+$//e | nohlsearch

au FileType markdown,text,wiki setlocal spell spelllang=en_us wrap
au FileType make setlocal ts=4 sts=4 sw=4 noet list
au FileType swift setlocal ts=2 sts=2 sw=2 et list

