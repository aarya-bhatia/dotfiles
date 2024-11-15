" let g:ale_lint_on_text_changed   = 'never'
" let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
" let g:ale_lint_on_enter          = 0

let g:ale_completion_enabled     = 1
let g:ale_set_loclist            = 1
let g:ale_open_list              = 0

let g:ale_linters={
            \'python':[],
            \}

let g:ale_fixers = {
            \ 'cpp': ['clang-format', 'clangtidy'],
            \}


set omnifunc=ale#completion#OmniFunc

nnoremap [D :ALEFirst<CR>
nnoremap ]D :ALELast<CR>
nnoremap [d :ALEPrevious<CR>
nnoremap ]d :ALENext<CR>

nnoremap <leader>ca	:ALECodeAction<CR>
nnoremap <leader>rn	:ALERename<CR>

nnoremap gd		:ALEGoToDefinition<CR>
nnoremap gh		:ALEHover<CR>
nnoremap gr	    :ALEFindReferences<CR>
nnoremap gs	    :ALESymbolSearch
