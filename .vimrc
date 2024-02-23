" plugings {{{

" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin("~/.vim/plugged")

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/tagbar'
Plug 'morhetz/gruvbox'

call plug#end()

" }}}

set background=dark
colorscheme gruvbox

set nocompatible
syntax on
filetype indent plugin on

let mapleader = ' '
let maplocalleader = ' '

set autoindent                    " set auto-indenting on for programming
set backspace=indent,eol,start    " make that backspace key work the way it should
set belloff=all                   " turn off error beeps
set hidden                        " allows multiple buffers without saving
set ignorecase                    " ignore case when searching
set incsearch                     " do incremental searching
set laststatus=2		          " always show status line
set linebreak
set mouse+=a
set nowrap
set relativenumber                " show relative line numbers
set shiftwidth=4 tabstop=4 noexpandtab
set showmatch                     " jump to matches when entering regexp
set smartcase                     " no ignorecase if Uppercase char present
set smartindent
set smarttab
set splitbelow                    " new horizontal split opens below current window
set splitright                    " new vertical split opens to the right of current window
set termguicolors
set wildmenu
set foldmethod=marker
set foldmarker={{{,}}}
" set foldlevel=99 				  " Prevent folding on startup
" set colorcolumn=0			      " color column
" set undodir=~/undodir.vim
" set undofile

runtime! ftplugin/man.vim         " Use :Man man to lookup man page

" Return to last edit position when opening files
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Trim trailing whitespace on lines
au BufWritePost * :%s/\s\+$//e | nohlsearch

au BufRead,BufNewFile *.h setlocal filetype=c
au BufNewFile,BufRead *.ejs setlocal filetype=html

au FileType markdown,text setlocal spell spelllang=en_us
au FileType markdown,text setlocal wrap

au FileType make setlocal ts=4 sts=4 sw=4 noet list

iabbrev @@ aarya.bhatia1678@gmail.com
iabbrev UIUC University of Illinois
iabbrev --- ----------------------

nnoremap <silent> <leader> <Nop>

map [f <Nop>
map ]f <Nop>
map gh <Nop>
map gH <Nop>

nnoremap <leader>q <Nop>

" [V]im namespace
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vpi :PlugInstall<CR>
nnoremap <leader>vpu :PlugUpdate<CR>
nnoremap <leader>vps :PlugStatus<CR>
nnoremap <leader>vpc :PlugClean<CR>

" write buffer
nnoremap <leader>s :write<cr>

" close buffer and keep split
nnoremap <leader>d :bd<CR>
nnoremap <leader>D :bd!<CR>

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
nnoremap <leader>R "zyy:r !z

xnoremap ss !sort<CR>
xnoremap su !sort\|uniq<CR>

