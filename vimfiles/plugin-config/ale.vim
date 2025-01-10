let g:ale_lint_on_text_changed   = '1'
" let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
" let g:ale_lint_on_enter          = 0

let g:ale_enabled = 0
" let g:ale_linters_explicit = 1 " Only use explicitly set linters

let g:ale_completion_enabled     = 1
let g:ale_set_loclist            = 1
let g:ale_open_list              = 0

let g:ale_linters={
            \'python':[],
            \   'go': ['gopls', 'golangci-lint']
            \}

let g:ale_fixers = {
            \ 'cpp': ['clang-format', 'clangtidy'],
            \   'go': ['gofmt', 'goimports']
            \}


set omnifunc=ale#completion#OmniFunc

nnoremap [D :ALEFirst<CR>
nnoremap ]D :ALELast<CR>
nnoremap [d :ALEPrevious<CR>
nnoremap ]d :ALENext<CR>

nnoremap <leader>ca	:ALECodeAction<CR>
nnoremap <leader>rn	:ALERename<CR>

let g:ale_floating_preview=0

nnoremap gd		:ALEGoToDefinition<CR>
nnoremap gh		:ALEHover<CR>
nnoremap gr	    :ALEFindReferences<CR>
nnoremap gs	    :ALESymbolSearch

nnoremap <leader>lf	    :ALEDetail<cr>
nnoremap <leader>lq	    :ALEPopulateQuickfix<cr>

augroup HoverAfterComplete                                                        
	autocmd!                                                                    
	" display argument list of the selected completion candidate using ALEHover
	autocmd User ALECompletePost ALEHover                                       
augroup END

