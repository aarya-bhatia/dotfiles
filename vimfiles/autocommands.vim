" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

au FileType markdown,text,wiki setlocal spell spelllang=en_us wrap
au FileType make setlocal ts=4 sts=4 sw=4 noet list
au FileType swift setlocal ts=2 sts=2 sw=2 et list

au FileType c,cpp,h nnoremap <buffer> <leader>F :%!clang-format<CR>
au FileType sh nnoremap <buffer> <leader>F :%!shfmt<CR>

au FileType go nnoremap <buffer> <leader>F :%!gofmt<CR>

au FileType go iabbrev <buffer> iferr if err != nil { return err }
