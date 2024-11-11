let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0
let g:ale_completion_enabled=1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
let g:ale_set_loclist = 1

let g:ale_linters={
			\'python':[],
			\}

set omnifunc=ale#completion#OmniFunc

nnoremap [D :ALEFirst<CR>
nnoremap ]D :ALELast<CR>
nnoremap [d :ALEPrevious<CR>
nnoremap ]d :ALENext<CR>

nnoremap gca	:ALECodeAction<CR>
nnoremap gd		:ALEGoToDefinition<CR>
nnoremap gh		:ALEHover<CR>
nnoremap grn	:ALERename<CR>
nnoremap grr	:ALEFindReferences<CR>
nnoremap gss	:ALESymbolSearch

