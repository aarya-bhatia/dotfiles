function! EditArgs()
  new
  call setline(1, argv())
  setlocal buftype=nofile bufhidden=wipe noswapfile
  nnoremap <buffer> <silent> <leader>s :call SetArgs()<CR>
endfunction

function! SetArgs()
  let args = getline(1, '$')
  exe 'args ' . join(args, ' ')
  bdelete
endfunction

nnoremap <leader>ea :call EditArgs()<CR>
