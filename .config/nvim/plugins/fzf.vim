" FZF (Fuzzy Finder)

let g:fzf_vim = {}
" let g:fzf_vim.preview_window = []
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
	copen
	cc
endfunction

let g:fzf_action = {
			\ 'ctrl-q': function('s:build_quickfix_list'),
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit' }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" List files in current files directory
nnoremap <C-p> :call fzf#vim#files(expand("%:h"))<CR>

" List files in working directory
nnoremap <leader>ff :Files<CR>

" List git files
nnoremap <silent> <leader>fg :GFiles<CR>

" Find in history
nnoremap <silent> <leader>fh :History<CR>

" List windows
nnoremap <silent> <leader>fw :Windows<CR>

" List buffers
nnoremap <silent> <leader><leader> :Buffers<CR>

" Find lines in buffers
nnoremap <silent> <leader>fl :BLines<CR>

" Find lines in all buffers
nnoremap <silent> <leader>fL :Lines<CR>

" Grep search
nnoremap <silent> <leader>/ :Rg<CR>
nnoremap <silent> <leader>a :Ag<CR>

" List help tags
nnoremap <silent> <leader>f? :Help<CR>

" List marks
nnoremap <silent> <leader>fm :Marks<CR>

" List jumps
nnoremap <silent> <leader>fj :Jumps<CR>

" List snippets
nnoremap <silent> <leader>fs :Snippets<CR>

" List tags
nnoremap <silent> <leader>ft :Tags<CR>

" fzf colorschemes
nnoremap <silent> <leader>fc :Colors<CR>

" List git commits
nnoremap <silent> <leader>fC :Commits<CR>
