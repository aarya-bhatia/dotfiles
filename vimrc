let mapleader = ' '
let maplocalleader = ' '

" Vim Plug {{{

call plug#begin("$HOME/.vim/plugged")

Plug 'tpope/vim-sensible'		" sensible defaults
Plug 'sheerun/vim-polyglot' 	" syntax highlighting
Plug 'tpope/vim-commentary' 	" comments
Plug 'tpope/vim-surround'		" surround operator
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'		" git tool
Plug 'jamessan/vim-gnupg'       " edit gpg files in vim
Plug 'kana/vim-textobj-user'
Plug 'andymass/vim-matchup'
Plug 'wellle/targets.vim'		" text objects
Plug 'vim-ruby/vim-ruby'

source $VIM_DIR/plugins/fzf.vim
source $VIM_DIR/plugins/status.vim
source $VIM_DIR/plugins/ack.vim
source $VIM_DIR/plugins/tagbar.vim
source $VIM_DIR/plugins/theme.vim

call plug#end()

" }}}

colorscheme gruvbox-material

source $VIM_DIR/main.vim

