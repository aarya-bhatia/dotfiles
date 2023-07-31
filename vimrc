let mapleader = ' '
let maplocalleader = ' '

" Vim Plug {{{

call plug#begin("$HOME/.vim/plugged")

Plug 'tpope/vim-sensible'		              " sensible defaults
Plug 'sheerun/vim-polyglot' 	            " syntax highlighting
Plug 'tpope/vim-commentary' 	            " comments
Plug 'tpope/vim-surround'		              " surround operator
Plug 'tpope/vim-repeat'                   " repeat plugin commands
Plug 'tpope/vim-fugitive'		              " git tool
Plug 'andymass/vim-matchup'               " match keywords
Plug 'wellle/targets.vim'		              " more text objects
Plug 'jamessan/vim-gnupg'                 " edit gpg files

source $VIM_DIR/plugins/fzf.vim           " fuzzy finder
source $VIM_DIR/plugins/ack.vim           " grep tool
source $VIM_DIR/plugins/colorscheme.vim   " colorscheme
source $VIM_DIR/plugins/tagbar.vim        " tags

call plug#end()

" }}}

colorscheme gruvbox-material

" Transparent background
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

source $VIM_DIR/main.vim

