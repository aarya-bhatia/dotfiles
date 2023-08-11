let mapleader = ' '
let maplocalleader = ' '

" Vim Plug {{{

call plug#begin("$HOME/.vim/plugged")

Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

source $VIM_DIR/plugins/fzf.vim
source $VIM_DIR/plugins/ack.vim

call plug#end()

" }}}

let g:lightline = { 'colorscheme': 'one' }

set termguicolors
set background=dark

hi Normal guibg=NONE ctermbg=NONE

colorscheme gruvbox

source $VIM_DIR/main.vim

