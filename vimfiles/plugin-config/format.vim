au FileType c,cpp,h nnoremap <buffer> <leader>F mk:%!clang-format<CR>'kz.
au FileType go nnoremap <buffer> <leader>F mk:%!gofmt<CR>'kz.
au FileType javascript,typescript nnoremap <buffer> <leader>F :%!prettier --stdin-filepath %<CR>
au FileType python nnoremap <buffer> <leader>F :!black %<CR>
