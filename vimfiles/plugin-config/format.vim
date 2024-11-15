" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
" nnoremap <leader>F :Autoformat<CR>

if executable('clang-format')
    au FileType c,cpp,h nnoremap <leader>F mk:%!clang-format<CR>'k
endif


