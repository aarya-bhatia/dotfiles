let mapleader = ' '
let maplocalleader = ' '

set termguicolors
set background=dark

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
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'preservim/tagbar'

source $VIM_DIR/plugins/fzf.vim           	" fuzzy finder
source $VIM_DIR/plugins/lf.vim

call plug#end()

colorscheme gruvbox

nnoremap <leader>- :LF<cr>
nnoremap <leader>tt :TagbarToggle<CR>
