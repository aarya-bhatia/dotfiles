" Mappings {{{

let mapleader = ' '
let maplocalleader = ' '

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

nnoremap <C-k> 8<C-y>
nnoremap <C-j> 8<C-e>
nnoremap <C-l> 8zl
nnoremap <C-h> 8zh

vnoremap <silent> <leader>y :call WriteToClipboard()<CR>

function! WriteToClipboard()
    let clipboard_command = has('mac') ? 'pbcopy' : 'xsel --clipboard'
    let error_message = has('mac') ? 'pbcopy command not found' : 'xsel command not found'
    
    if executable(clipboard_command)
        execute 'write !' . clipboard_command
    else
        echomsg error_message
    endif
endfunction

" close buffer and quit if last window
nnoremap <silent> <leader>d :call CloseBuffer()<CR>

" save and close window
nnoremap <leader>q :wqa<CR>

function! CloseBuffer()
    if bufnr('$') == 1
        execute 'q'
    else
        execute 'bd'
    endif
endfunction

" }}}
