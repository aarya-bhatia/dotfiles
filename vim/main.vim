" Autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Editor settings {{{

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set smartindent
set smarttab
set autoindent                    " set auto-indenting on for programming
set relativenumber                " show relative line numbers
set incsearch                     " do incremental searching
set showmatch                     " jump to matches when entering regexp
set ignorecase                    " ignore case when searching
set smartcase                     " no ignorecase if Uppercase char present
set belloff=all                   " turn off error beeps
set hidden                        " allows multiple buffers without saving
set nowrap                        " line wrap
set linebreak
set shiftwidth=4 tabstop=4 noexpandtab
set scrolloff=8
set backspace=indent,eol,start    " make that backspace key work the way it should
set splitbelow                    " new horizontal split opens below current window
set splitright                    " new vertical split opens to the right of current window
set colorcolumn=0			      " color column
set foldlevel=99 " Prevent folding on startup
set mouse+=a
set laststatus=2		          " always show status line
set wildmenu
set cursorline

if filereadable('/usr/share/dictd/gcide.index')
  set dictionary=/usr/share/dictd/gcide.index
endif

if filereadable('/usr/share/dict/words')
  set dictionary=/usr/share/dict/words
endif

" set undodir=$HOME/undodir
" set undofile

if has('nvim')
  set guicursor+=i:block
  tnoremap <Esc> <C-\><C-n>
endif

runtime! ftplugin/man.vim         " Use :Man man to lookup man page

let g:netrw_liststyle = 0
let g:netrw_banner=0

let $PAGER=''

" }}}

" Autocommands {{{

" Return to last edit position when opening files (You want this!)
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

augroup group
  " C/C++ filetye commands
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType * setlocal foldmethod=syntax
  autocmd FileType c,cpp setlocal textwidth=120
  autocmd FileType c,cpp setlocal foldmethod=syntax
  autocmd FileType c,cpp setlocal ts=2 sts=2 sw=2 et
  autocmd FileType markdown,text setlocal spell spelllang=en_us
  autocmd FileType markdown,text setlocal wrap
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType make set ts=4 sts=4 sw=4 noet list

  autocmd BufRead,BufNewFile *.h set filetype=c
  autocmd BufNewFile,BufRead *.ejs set filetype=html

  " Trim trailing whitespace on lines
  autocmd BufWritePost * if &ft != "oil" | :%s/\s\+$//e | nohlsearch

augroup END

" }}}

" Abbreviations {{{

iabbrev @@ aarya.bhatia1678@gmail.com
iabbrev AB Aarya Bhatia
iabbrev ab Aarya Bhatia
iabbrev uiuc University of Illinois
iabbrev --- ----------------------

" }}}

" Mappings {{{

map [f <Nop>
map ]f <Nop>
map gh <Nop>
map gH <Nop>
map gH <Nop>

nnoremap <silent> <leader> <Nop>

" [V]im namespace
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vpi :PlugInstall<CR>
nnoremap <leader>vpu :PlugUpdate<CR>
nnoremap <leader>vps :PlugStatus<CR>
nnoremap <leader>vpc :PlugClean<CR>

" write buffer
nnoremap <leader>s :write<cr>

" save and close window
nnoremap <leader>q :quit<CR>

" close buffer and keep split
" nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>d :bd<CR>

" Close current buffer and switch to the previous one
" noremap <C-x> :bp<Bar>bd #<Cr>

" Unhighlight search results
nnoremap <Esc> :nohl<CR>
nnoremap <leader>hl :set invhlsearch<CR>

" surround last visual selection with quotes
nnoremap <leader>v" `>a"<esc>`<i"<esc>lel

" Exit insert mode
inoremap kj <Esc>

" open netrw file explorer
if has('nvim')
  nnoremap <leader>- :Oil<CR>
else
  nnoremap <leader>- :Ex<CR>
endif

" Indent with single angle bracket
nnoremap > >>
nnoremap < <<

" Reselect visual range while indenting
vnoremap < <gv
vnoremap > >gv

" Paste over currently selected text without yanking it
vnoremap p "_dP

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

" original vim keys
nnoremap <leader>J J
nnoremap <leader>K K

" Vertical scrolling without moving cursor
nnoremap <C-k> 6<C-y>
nnoremap <C-j> 6<C-e>
vnoremap <C-k> 6<C-y>
vnoremap <C-j> 6<C-e>

" Horizontal scrolling
nnoremap <C-h> 8zh
nnoremap <C-l> 8zl
vnoremap <C-h> 8zh
vnoremap <C-l> 8zl

" move up/down faster
nnoremap K 6gk
nnoremap J 6gj
vnoremap K 6gk
vnoremap J 6gj

" handle line wrapped text in normal and visual mode
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" nnoremap <leader>h <C-w>h
" nnoremap <leader>j <C-w>j
" nnoremap <leader>k <C-w>k
" nnoremap <leader>l <C-w>l

" To move around in insert mode
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

" Command line mode navigation
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>

" copying selection to clipboard tools
if has('mac')
  if has('nvim')
    nnoremap <leader>yy :lua SendRegisterToExternalCommand("pbcopy")<CR>
    xnoremap <leader>y y:lua SendRegisterToExternalCommand("pbcopy")<CR>
  else
    nnoremap <leader>yy :write !pbcopy<CR>
    xnoremap <leader>y :write !pbcopy<CR>
  endif

  nnoremap <leader>pp :read !pbpaste<CR>
else
  if has('nvim')
    nnoremap <leader>yy :lua SendRegisterToExternalCommand("xsel -b >/dev/null")<CR>
    xnoremap <leader>y y:lua SendRegisterToExternalCommand("xsel -b >/dev/null")<CR>
  else
    nnoremap <leader>y :write !xsel -b >/dev/null<CR>
    xnoremap <leader>y :write !xsel -b >/dev/null<CR>
  endif

  nnoremap <leader>pp :read !xsel -b -o<CR>
endif

" Replay macro @q
nnoremap Q @q

" [Y]ank till end of line for consistency with C and D commands
nnoremap Y y$

" Select the lines that were just pasted
nnoremap <leader>V V`]

nnoremap <leader>F :Format<CR>
nnoremap <leader>gq mmgggqG`m

" Replace current word with yanked word ([p]aste [w]ord)
nnoremap <leader>pw ciw<C-r>0<Esc>
nnoremap <leader>pW ciW<C-r>0<Esc>

" [O]ther namespace: <leader>o
" [S]plit [L]ine - splits a comma separated list into a bullet list
nnoremap <leader>osl :s/, \?/\r- /g<CR>:noh<CR>

" [I]nsert [D]ate
nnoremap <leader>id i<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>

" Use magic mode regex
" nnoremap / /\v
" cnoremap <C-u> <C-u>\v

augroup qflist
  autocmd!
  autocmd FileType qf cabbrev <buffer> K Keep
  autocmd FileType qf cabbrev <buffer> Rej Reject
  autocmd FileType qf cabbrev <buffer> Res Restore

  autocmd FileType qf nnoremap <buffer> dd :.Reject<CR>
  autocmd FileType qf vnoremap <buffer> d :Reject<CR>

  autocmd FileType qf nnoremap <buffer> [[ :colder<CR>
  autocmd FileType qf nnoremap <buffer> ]] :cnewer<CR>
augroup END
