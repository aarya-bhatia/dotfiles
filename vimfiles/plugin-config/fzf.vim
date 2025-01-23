" Initialize configuration dictionary
let g:fzf_vim = {}
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_vim.preview_window = ['hidden,right,50%', 'ctrl-/']
let g:fzf_layout = { 'down':  '30%'}

if has('rg')
  inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
endif

" [Buffers] Jump to the existing window if possible (default: 0)
let g:fzf_vim.buffers_jump = 1

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

" CTRL-A CTRL-Q to select all and build quickfix list

" function! s:build_quickfix_list(lines)
"   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"   copen
"   cc
" endfunction


let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" List files in current files directory
nnoremap <C-p> :GFiles<CR>

" List files in working directory
nnoremap <leader>ff :Files<CR>

"nnoremap <silent> <leader>fg :Ag<CR>

" Live grep
nnoremap <silent> <leader>/ :RG<CR>

" Find in history
nnoremap <silent> <leader>fo :History<CR>
" List buffers
nnoremap <silent> <leader><leader> :Buffers<CR>
" Find lines in buffers
nnoremap <silent> <leader>f/ :BLines<CR>
" Find lines in all buffers
nnoremap <silent> <leader>fl :Lines<CR>
" List help tags
nnoremap <silent> <leader>fh :Help<CR>
" List marks
nnoremap <silent> <leader>fm :Marks<CR>
" List jumps
nnoremap <silent> <leader>fj :Jumps<CR>
" List snippets
nnoremap <silent> <leader>fs :Snippets<CR>
" List tags
nnoremap <silent> <leader>ft :Tags<CR>
" fzf colorschemes
nnoremap <silent> <leader>fc :Commands<CR>
" List git commits
nnoremap <silent> <leader>fv :Commits<CR>

