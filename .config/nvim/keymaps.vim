nnoremap <silent> <leader> <Nop>

tnoremap <Esc> <C-\><C-n>

xnoremap <leader>y :w !xsel -b -i<CR><CR>
nnoremap <leader>yy :w !xsel -b -i<CR><CR>
nnoremap <leader>pp :r !xsel -o<CR><CR>

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
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>

" navigate location list
nnoremap <silent> [l :lprev<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [L :lfirst<CR>
nnoremap <silent> ]L :llast<CR>

" navigate buffers
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> ]b :bnext<CR>

" navigat<silent> e arg list
nnoremap <silent> [A :first<CR>
nnoremap <silent> ]A :last<CR>
nnoremap <silent> [a :prev<CR>
nnoremap <silent> ]a :next<CR>

" navigate tabs
nnoremap <silent> [t :tabprevious<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [T :tabfirst<CR>
nnoremap <silent> ]T :tablast<CR>

" Horizontal scrolling
nnoremap <silent> <C-h> 8zh
nnoremap <silent> <C-l> 8zl
vnoremap <silent> <C-h> 8zh
vnoremap <silent> <C-l> 8zl

" Vertical scrolling without moving cursor
nnoremap <silent> <leader>k 6<C-y>
nnoremap <silent> <leader>j 6<C-e>
vnoremap <silent> <leader>k 6<C-y>
vnoremap <silent> <leader>j 6<C-e>

" move up/down faster
nnoremap <silent> <C-k> 6gk
nnoremap <silent> <C-j> 6gj
vnoremap <silent> <C-k> 6gk
vnoremap <silent> <C-j> 6gj

" handle line wrapped text in normal and visual mode
nnoremap <silent> k gk
nnoremap <silent> j gj
vnoremap <silent> k gk
vnoremap <silent> j gj

" To move around in insert mode
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-l> <Right>

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

nnoremap <leader>rn :set relativenumber! number!<CR>
