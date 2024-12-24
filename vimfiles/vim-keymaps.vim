nnoremap <silent> <leader> <Nop>

nnoremap <leader>s :write<cr>
nnoremap <leader>q :quit<CR>

" [V]im related
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vpi :PlugInstall<CR>
nnoremap <leader>vpu :PlugUpdate<CR>
nnoremap <leader>vps :PlugStatus<CR>
nnoremap <leader>vpc :PlugClean<CR>

if has('nvim')
  nnoremap <leader>vl :edit ~/.config/nvim/lua/main.lua<CR>
endif

" Unhighlight search results
nnoremap <silent> <leader>hl :set invhlsearch<CR>

" Exit insert mode
inoremap <silent> kj <Esc>

nnoremap <leader>pt :set invpaste<CR>

nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

nnoremap [A :first<CR>
nnoremap ]A :last<CR>
nnoremap [a :prev<CR>
nnoremap ]a :next<CR>

nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap [l :lprev<CR>
nnoremap ]l :lnext<CR>

nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

nnoremap [T :tfirst<CR>
nnoremap ]T :tlast<CR>
nnoremap [t :tnext<CR>
nnoremap ]t :tprev<CR>

" Paste over currently selected text without yanking it
xnoremap <silent> p "_dP

" Horizontal scrolling
nnoremap <silent> <C-h> 8zh
nnoremap <silent> <C-l> 8zl
xnoremap <silent> <C-h> 8zh
xnoremap <silent> <C-l> 8zl

" move up/down faster
nnoremap <silent> <C-k> 6gk
nnoremap <silent> <C-j> 6gj
xnoremap <silent> <C-k> 6gk
xnoremap <silent> <C-j> 6gj

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
nnoremap <leader>id i<C-R>=strftime('%Y-%m-%d')<CR><Esc>

nnoremap <leader>mk :make<CR>

" Run the command on current line and paste output below
nnoremap <leader>R "zyy:r !z 2>&1

xnoremap ss !sort<CR>
xnoremap su !sort\|uniq<CR>

nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

" adjust split sizes easier
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

nnoremap <leader>d :bd<CR>

" Exit terminal mode
tnoremap <silent> <Esc> <C-\><C-n>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" move lines up or down
nnoremap <leader>k :move .-2<cr>==
nnoremap <leader>j :move .+1<cr>==
vnoremap <leader>k :move '<-2<cr>gv=gv
vnoremap <leader>j :move '>+1<cr>gv=gv

if exists('$TMUX')
  " yanks visually selected text to tmux buffer
  vnoremap <leader>ty y<cr>:call system("tmux load-buffer -", @0)<cr>
  " yanks current line to tmux buffer
  nnoremap <leader>tyy y<cr>:.w !tmux load-buffer -<cr>
  " yanks entire vim buffer to tmux buffer
  nnoremap <leader>tye y<cr>:w !tmux load-buffer -<cr>
  " pastes text from tmux buffer to vim buffer
  nnoremap <leader>tp :let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;
endif

" Check if Vim has clipboard support
if has('clipboard')
    " If clipboard support is available, map to the system clipboard
    xnoremap <leader>y "+y
    nnoremap <leader>yy "+yy
    nnoremap <leader>pp "+p
else
    " Check if xclip is available, otherwise fallback to xsel
    if executable('xclip')
        xnoremap <leader>y :w !xclip -sel clipboard<cr>
        nnoremap <leader>yy :w !xclip -sel clipboard<cr>
        nnoremap <leader>pp :r !xclip -o -sel clipboard<cr>
    elseif executable('xsel')
        xnoremap <leader>y :w !xsel --clipboard --input<cr>
        nnoremap <leader>yy :w !xsel --clipboard --input<cr>
        nnoremap <leader>pp :r !xsel --clipboard --output<cr>
    elseif executable('pbcopy')
        xnoremap <leader>y :w !pbcopy<cr>
        nnoremap <leader>yy :w !pbcopy<cr>
        nnoremap <leader>pp :r !pbpaste<cr>
    endif
endif

" grep for current word
nnoremap <leader>gw yiw:grep "<C-r>""<cr>

" Trim trailing whitespace on lines
command TrimTrailingSpaces :%s/\s\+$//e | nohlsearch
nnoremap <leader>W :TrimTrailingSpaces<CR>

if has('ag')
  command! -nargs=+ Ag :cgetexpr system('ag --vimgrep --ignore "tags" <args>') | copen
endif

if has('vim')
  command! BufOnly silent! execute "%bd|e#|bd#"
  nnoremap <leader>bo :BufOnly<cr>
endif

nnoremap <leader>C :!osc52.sh<cr><cr>
