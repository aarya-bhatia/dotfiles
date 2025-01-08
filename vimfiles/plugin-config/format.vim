au FileType c,cpp,h nnoremap <leader>F mk:%!clang-format<CR>'k
au FileType go nnoremap <leader>F :%!gofmt<CR>
au FileType javascript,typescript nnoremap <leader>F :%!prettier --stdin-filepath %<CR>
au FileType python nnoremap <leader>F :!black %<CR>
