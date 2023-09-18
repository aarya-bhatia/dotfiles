let mapleader = ' '
let maplocalleader = ' '

call plug#begin('$HOME/.config/nvim/plugged')

" Essentials
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'   " Git tool

" comment with gc
Plug 'numToStr/Comment.nvim'

" status line
Plug 'nvim-lualine/lualine.nvim'

Plug 'wellle/targets.vim'		              " more text objects

" icons
Plug 'nvim-tree/nvim-web-devicons'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" Async library
Plug 'nvim-lua/plenary.nvim'

" Debugger
Plug 'mfussenegger/nvim-dap'

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Marks
Plug 'chentoast/marks.nvim'

" File explorer
Plug 'stevearc/oil.nvim'

" edit gpg files in vim
Plug 'jamessan/vim-gnupg'

Plug 'xiyaowong/transparent.nvim'

source $VIM_DIR/plugins/fzf.vim           " fuzzy finder
source $VIM_DIR/plugins/coc.vim           " lsp
source $VIM_DIR/plugins/ack.vim           " grep tool
source $VIM_DIR/plugins/colorscheme.vim   " colorscheme

Plug 'romainl/vim-qf'
let g:qf_auto_resize = 0

Plug 'preservim/nerdtree'
nnoremap <C-t> :NERDTreeToggle<CR>

Plug 'preservim/tagbar'
nnoremap <leader>tt :TagbarToggle<CR>

Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
let g:lf_map_keys = 0
nnoremap <leader>L :Lf<CR>

call plug#end()

" lua configs
source $HOME/.config/nvim/lua/config.lua
source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/commands.lua

colorscheme gruvbox
" colorscheme gruvbox-material

source $VIM_DIR/main.vim

