if executable('clang-format')
  au FileType c,cpp,h nnoremap <buffer> <leader>F mk:%!clang-format<CR>'kz.
endif

if executable('gofmt')
  au FileType go nnoremap <buffer> <leader>F mk:%!gofmt<CR>'kz.
endif

if executable('prettier')
  au FileType javascript,typescript nnoremap <buffer> <leader>F :%!prettier --stdin-filepath %<CR>
endif

if executable('black')
  au FileType python nnoremap <buffer> <leader>F :!black %<CR>
endif
