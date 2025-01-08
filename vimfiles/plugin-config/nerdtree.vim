let NERDTreeShowHidden=0

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Use <leader>n + q to close it
"nnoremap <C-n> :NERDTreeToggle<CR>

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

