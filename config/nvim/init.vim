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

" edit gpg files in vim
Plug 'jamessan/vim-gnupg'

" transparent background
Plug 'xiyaowong/transparent.nvim'

" sidebar code outline
Plug 'preservim/tagbar'
nnoremap <leader>tt :TagbarToggle<CR>

source $VIM_DIR/plugins/fzf.vim           " fuzzy finder
source $VIM_DIR/plugins/coc.vim           " lsp
source $VIM_DIR/plugins/ack.vim           " grep tool
source $VIM_DIR/plugins/colorscheme.vim   " colorscheme

" better quickfix list
Plug 'romainl/vim-qf'
let g:qf_auto_resize = 0

" File explorer
" Plug 'stevearc/oil.nvim'
" Plug 'preservim/nerdtree'
" nnoremap <C-t> :NERDTreeToggle<CR>

" lf file explorer integration
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
let g:lf_map_keys = 0
nnoremap <leader>- :Lf<CR>

call plug#end()

" lua configs
source $HOME/.config/nvim/lua/config.lua
source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/commands.lua

colorscheme gruvbox
" colorscheme gruvbox-material

source $VIM_DIR/main.vim

nnoremap <leader>R "zyyo:r !z

