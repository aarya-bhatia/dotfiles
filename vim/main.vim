" Autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Editor settings {{{

syntax on
filetype indent plugin on

set nocompatible
set autoindent                    " set auto-indenting on for programming
set number                        " show current line number
set relativenumber                " show relative line numbers
set incsearch                     " do incremental searching
set showmatch                     " jump to matches when entering regexp
set ignorecase                    " ignore case when searching
set smartcase                     " no ignorecase if Uppercase char present
set belloff=all                   " turn off error beeps
set hidden                        " allows multiple buffers without saving
set nowrap                        " line wrap
set linebreak
set shiftwidth=2 tabstop=2 expandtab
set scrolloff=8
set backspace=indent,eol,start    " make that backspace key work the way it should
set splitbelow                    " new horizontal split opens below current window
set splitright                    " new vertical split opens to the right of current window
set colorcolumn=0			      " color column
set foldlevel=99 " Prevent folding on startup
set mouse=a
set noswapfile
set nowritebackup
set undodir=$HOME/undodir
set undofile
set laststatus=2		          " always show status line
set path+=**
set wildmenu

runtime! ftplugin/man.vim         " Use :Man man to lookup man page

" }}}

