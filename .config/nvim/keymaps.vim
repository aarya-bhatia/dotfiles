nnoremap <silent> <leader> <Nop>

tnoremap <Esc> <C-\><C-n>

xnoremap <leader>y :w !xsel -b<CR><CR>
nnoremap <leader>yy :w !xsel -b<CR><CR>

nnoremap <leader>q :quit<CR>
nnoremap <leader>s :write<cr>
nnoremap <leader>d :bd<CR>

" [V]im namespace
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vpi :PlugInstall<CR>
nnoremap <leader>vpu :PlugUpdate<CR>
nnoremap <leader>vps :PlugStatus<CR>
nnoremap <leader>vpc :PlugClean<CR>

" Unhighlight search results
nnoremap <Esc> :nohl<CR>
nnoremap <leader>hl :set invhlsearch<CR>

" surround last visual selection with quotes
nnoremap <leader>v" `>a"<esc>`<i"<esc>lel

" Exit insert mode
inoremap kj <Esc>

" Indent with single angle bracket
nnoremap > >>
nnoremap < <<

" Reselect visual range while indenting
vnoremap < <gv
vnoremap > >gv

" Paste over currently selected text without yanking it
xnoremap p "_dP

" navigate quickfix list
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" navigate location list
nnoremap [l :lprev<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

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

" Horizontal scrolling
nnoremap <C-h> 8zh
nnoremap <C-l> 8zl
vnoremap <C-h> 8zh
vnoremap <C-l> 8zl

" Vertical scrolling without moving cursor
nnoremap <leader>k 6<C-y>
nnoremap <leader>j 6<C-e>
vnoremap <leader>k 6<C-y>
vnoremap <leader>j 6<C-e>

" move up/down faster
nnoremap <C-k> 6gk
nnoremap <C-j> 6gj
vnoremap <C-k> 6gk
vnoremap <C-j> 6gj

" handle line wrapped text in normal and visual mode
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" To move around in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Replay macro @q
nnoremap Q @q

" [Y]ank till end of line for consistency with C and D commands
nnoremap Y y$

" Select the lines that were just pasted
nnoremap <leader>V V`]

" Replace current word with yanked word ([p]aste [w]ord)
nnoremap <leader>pw ciw<C-r>0<Esc>
nnoremap <leader>pW ciW<C-r>0<Esc>

" [I]nsert [D]ate
nnoremap <leader>id i<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>

nnoremap <leader>mk :make<CR>

" Run the command on current line and paste output below
nnoremap <leader>R "zyy:r !z

xnoremap ss !sort<CR>
xnoremap su !sort\|uniq<CR>
