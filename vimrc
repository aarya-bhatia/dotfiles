let mapleader = ' '
let maplocalleader = ' '

let $VIM_DIR=$HOME."/dotfiles/vim"

call plug#begin("$HOME/.vim/plugged")

Plug 'tpope/vim-sensible'					" sensible defaults
Plug 'sheerun/vim-polyglot'					" syntax highlighting
Plug 'tpope/vim-commentary'					" comments
Plug 'tpope/vim-surround'					" surround operator
Plug 'tpope/vim-repeat'						" repeat commands
Plug 'tpope/vim-fugitive'					" git tool
Plug 'andymass/vim-matchup'					" match keywords
Plug 'wellle/targets.vim'					" more text objects
Plug 'jamessan/vim-gnupg'					" edit gpg files

source $VIM_DIR/plugins/fzf.vim           	" fuzzy finder
source $VIM_DIR/plugins/ack.vim           	" grep tool
source $VIM_DIR/plugins/colorscheme.vim   	" colorscheme
" source $VIM_DIR/plugins/vimlsp.vim

call plug#end()

source $VIM_DIR/lf.vim
nnoremap <leader>- :LF<cr>

colorscheme gruvbox-material

source $VIM_DIR/main.vim
set termguicolors
set background=dark


