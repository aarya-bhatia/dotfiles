" Mappings {{{

let mapleader = ' '
let maplocalleader = ' '

nnoremap <Esc> :nohl<CR>

nnoremap <silent> <leader> <Nop>
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>s :w<cr>

" surround last visual selection with quotes
nnoremap <leader>v" `>a"<esc>`<i"<esc>lel

" Exit insert mode
inoremap kj <Esc>

" open netrw file explorer
nnoremap <leader>- :Ex<CR>

" Reselect visual range while indenting
vnoremap < <gv
vnoremap > >gv

" Paste over currently selected text without yanking it
vnoremap p "_dP

" navigate quickfix list
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :colder<CR>
nnoremap ]Q :cnewer<CR>

" navigate buffers
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

" navigate arg list
nnoremap [A :first<CR>
nnoremap ]A :last<CR>
nnoremap [a :prev<CR>
nnoremap ]a :next<CR>

" navigate tabs
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap [T :tabfirst<CR>
nnoremap ]T :tablast<CR>

" nnoremap <C-k> 8<C-y>
" nnoremap <C-j> 8<C-e>
nnoremap <C-k> 6k
nnoremap <C-j> 6j
nnoremap <C-l> 8zl
nnoremap <C-h> 8zh

" copy selection to clipboard tool
if has('mac')
  nnoremap <leader>y :write !pbcopy<CR>
  vnoremap <leader>y :write !pbcopy<CR>
  nnoremap <leader>p :read !pbpaste<CR>
else
  nnoremap <leader>y :write !xsel -i -b >/dev/null<CR>
  vnoremap <leader>y :write !xsel -i -b >/dev/null<CR>
  nnoremap <leader>p :read !xsel -o<CR>
endif

" save and close window
nnoremap <leader>q :wqa<CR>

" close buffer and quit if last window
nnoremap <silent> <leader>d :call CloseBuffer()<CR>

function! CloseBuffer()
    if bufnr('$') == 1
        execute 'q'
    else
        execute 'bd'
        " execute 'bp'
        " execute 'bd #'
    endif
endfunction

" Close current buffer and switch to the previous one
noremap <C-x> :bp<Bar>bd #<Cr>

nmap >> <Nop>
nmap << <Nop>
vmap << <Nop>
vmap << <Nop>

nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv

nnoremap Q @q

nnoremap Y y$

inoremap <> <><Left>
inoremap () ()<Left>
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap `` ``<Left>

inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

" }}}
