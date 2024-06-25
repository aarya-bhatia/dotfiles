nnoremap <silent> <leader> <Nop>

xnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>pp "+p

nnoremap <leader>s :write<cr>
nnoremap <leader>q :quit<CR>
nnoremap <leader>d :lua MiniBufremove.wipeout()<CR>

" [V]im related
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vpi :PlugInstall<CR>
nnoremap <leader>vpu :PlugUpdate<CR>
nnoremap <leader>vps :PlugStatus<CR>
nnoremap <leader>vpc :PlugClean<CR>
nnoremap <leader>vrn :set relativenumber! number!<CR>

" Unhighlight search results
nnoremap <silent> <Esc> :noh<CR>
nnoremap <silent> <leader>hl :set invhlsearch<CR>

" Exit insert mode
inoremap <silent> kj <Esc>

nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" nnoremap <Tab> :bnext<CR>
" nnoremap <S-Tab> :bprev<CR>

" Paste over currently selected text without yanking it
xnoremap <silent> p "_dP

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

" [I]nsert [D]ate : TODO replace with date snippet
nnoremap <leader>id i<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>

nnoremap <leader>mk :make<CR>

" Run the command on current line and paste output below
nnoremap <leader>R "zyy:r !z

xnoremap ss !sort<CR>
xnoremap su !sort\|uniq<CR>

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

nnoremap [a :prev<CR>
nnoremap ]a :next<CR>

nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

nnoremap [l :lprev<CR>
nnoremap ]l :lnext<CR>

nnoremap [L :lopen<CR>
nnoremap ]L :lclose<CR>

nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

nnoremap [Q :copen<CR>
nnoremap ]Q :cclose<CR>

nnoremap [e ddkP
nnoremap ]e ddp

nnoremap [t :tabprev<CR>
nnoremap ]t :tabnext<CR>

" adjust split sizes easier
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" automatically close comments in C by pressing */ and place cursor inside
inoremap /* /**/<left><left>

" open a terminal inside nvim
map <leader><return> :vnew term://bash<CR>i

" Exit terminal mode
tnoremap <silent> <Esc> <C-\><C-n>

