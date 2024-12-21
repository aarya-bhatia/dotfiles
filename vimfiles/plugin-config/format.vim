if executable('clang-format')
    au FileType c,cpp,h nnoremap <leader>F mk:%!clang-format<CR>'k
endif


