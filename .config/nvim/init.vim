" Autoinstall vim-plug {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" }}}

"" Editor settings {{{

let mapleader = ' '
let maplocalleader = ' '

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
set nowrap
set linebreak
set shiftwidth=4 tabstop=4 noexpandtab
" set scrolloff=8
set backspace=indent,eol,start    " make that backspace key work the way it should
set splitbelow                    " new horizontal split opens below current window
set splitright                    " new vertical split opens to the right of current window
set colorcolumn=0			      " color column
" set foldlevel=99 				  " Prevent folding on startup
set laststatus=2		          " always show status line
set mouse+=a
set wildmenu
set termguicolors
set undodir=~/undodir
set undofile

set foldmethod=marker
set foldmarker={{{,}}}

if filereadable('/usr/share/dict/words')
  set dictionary=/usr/share/dict/words
endif

if has('nvim')
  set guicursor+=i:block
  tnoremap <Esc> <C-\><C-n>
endif

runtime! ftplugin/man.vim         " Use :Man man to lookup man page

" }}}

" Autocommands {{{

" Return to last edit position when opening files (You want this!)
au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

augroup group
  autocmd!
  autocmd FileType markdown,text setlocal spell spelllang=en_us
  autocmd FileType markdown,text setlocal wrap
  autocmd FileType make setlocal ts=4 sts=4 sw=4 noet list

  autocmd BufRead,BufNewFile *.h setlocal filetype=c
  autocmd BufNewFile,BufRead *.ejs setlocal filetype=html

  " Trim trailing whitespace on lines
  autocmd BufWritePost * :%s/\s\+$//e | nohlsearch

augroup END

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" }}}

" Abbreviations {{{

iabbrev @@ aarya.bhatia1678@gmail.com
iabbrev UIUC University of Illinois
iabbrev --- ----------------------

" }}}

" Key Mappings {{{

nnoremap <silent> <leader> <Nop>

map [f <Nop>
map ]f <Nop>
map gh <Nop>
map gH <Nop>

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
" xnoremap p "_dP

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

nnoremap <leader>gq mmgggqG`m

" Replace current word with yanked word ([p]aste [w]ord)
nnoremap <leader>pw ciw<C-r>0<Esc>
nnoremap <leader>pW ciW<C-r>0<Esc>

" [O]ther namespace: <leader>o
" [S]plit [L]ine - splits a comma separated list into a bullet list
nnoremap <leader>osl :s/, \?/\r- /g<CR>:noh<CR>

" [I]nsert [D]ate
nnoremap <leader>id i<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>

nnoremap <leader>mk :make<CR>

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

nnoremap <leader>M :Mason<CR>
nnoremap <leader>F :LspZeroFormat<CR>
" nnoremap <leader>F :Format<CR>

" VimPlug

call plug#begin('$HOME/.config/nvim/plugged')

" Essentials
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'   	  " Git tool
Plug 'tpope/vim-abolish'
Plug 'wellle/targets.vim'		  " text objects
Plug 'numToStr/Comment.nvim'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Async library
Plug 'nvim-lua/plenary.nvim'

" Indent lines
" Plug 'lukas-reineke/indent-blankline.nvim'

" Marks
Plug 'chentoast/marks.nvim'

" PGP file support
Plug 'jamessan/vim-gnupg'

" transparent background
Plug 'xiyaowong/transparent.nvim'

" sidebar code outline
Plug 'preservim/tagbar'
nnoremap <leader>tt :TagbarToggle<CR>

source $HOME/.config/nvim/plugins/fzf.vim           " fuzzy finder
source $HOME/.config/nvim/plugins/cscope.vim

" color$HOME/schemes
Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange-nvim'

" Status Line
Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'wombat' }

" better quickfix list
Plug 'romainl/vim-qf'
let g:qf_auto_resize = 0

" lf file explorer integration
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
let g:lf_map_keys = 0
let g:lf_replace_netrw = 1
nnoremap <leader>- :Lf<CR>

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

call plug#end()

" lua configs
source $HOME/.config/nvim/lua/config.lua
source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/lsp.lua

colorscheme gruvbox
" colorscheme melange

" Run the command on current line and paste output below
nnoremap <leader>R "zyy:r !z

xnoremap ss !sort<CR>
xnoremap su !sort\|uniq<CR>

let g:python3_host_prog="/home/aarya/pyvenv/bin/python3"
