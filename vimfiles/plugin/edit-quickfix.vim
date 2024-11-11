function! EditQuickfix()
  new
  let qflist = getqflist()
  setlocal buftype=nofile bufhidden=wipe noswapfile
  nnoremap <buffer> <silent> <leader>s :call SetQuickfix()<CR>
endfunction

function! SetQuickfix()
  let new_qf = []
  for line in getline(1, '$')
    let parts = split(line, ':', 4)
    if len(parts) >= 4
      call add(new_qf, {
            \ 'filename': parts[0],
            \ 'lnum': str2nr(parts[1]),
            \ 'col': str2nr(parts[2]),
            \ 'text': parts[3]
            \ })
    endif
  endfor
  call setqflist(new_qf)
  bd
endfunction

nnoremap <leader>eq :call EditQuickfix()<CR>
