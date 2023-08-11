" FZF (Fuzzy Finder) {{{

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'			" fuzzy finder

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

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

let g:fzf_command_prefix = 'Fzf'

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" List files in current files directory
nnoremap <leader>fF :call fzf#vim#files(expand("%:h"))<CR>

" List git files
nnoremap <silent> <leader>fg :FzfGFiles<CR>

" List files
nnoremap <silent> <leader>ff :FzfFiles<CR>

" Find in history
nnoremap <silent> <leader>fh :FzfHistory<CR>

" List windows
nnoremap <silent> <leader>fw :FzfWindows<CR>

" List buffers
nnoremap <silent> <leader><leader> :FzfBuffers<CR>

" Find lines in buffers
nnoremap <silent> <leader>fl :FzfBLines<CR>

" Find lines in all buffers
nnoremap <silent> <leader>fL :FzfLines<CR>

" Grep search with Silver Searcher
nnoremap <silent> <leader>/ :FzfAg<CR>

" List help tags
nnoremap <silent> <leader>f? :FzfHelp<CR>

" List marks
nnoremap <silent> <leader>fm :FzfMarks<CR>

" List jumps
nnoremap <silent> <leader>fj :FzfJumps<CR>

" List snippets
nnoremap <silent> <leader>fs :FzfSnippets<CR>

" List tags
nnoremap <silent> <leader>ft :FzfTags<CR>

" List git commits
nnoremap <silent> <leader>fc :FzfCommits<CR>

" Insert mode completion
" imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')

" Word completion with custom spec with popup layout option
" inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" }}}
