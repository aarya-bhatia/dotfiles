Plug 'mileszs/ack.vim'          " grep tool

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

nnoremap <leader>a :Ack!<space>
