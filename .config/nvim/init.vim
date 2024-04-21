source $HOME/.config/nvim/lua/config.lua

call plug#begin('$HOME/.local/share/nvim/plugged')

Plug 'echasnovski/mini.nvim'

" Edit gpg files
Plug 'jamessan/vim-gnupg'

" Align text
Plug 'junegunn/vim-easy-align'

" Additional syntax
Plug 'kovetskiy/sxhkd-vim'

" Marks
Plug 'kshenoy/vim-signature'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'

" Quickfix list
Plug 'romainl/vim-qf'

" Classic
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" Floating Terminal
Plug 'voldikss/vim-floaterm'

" colorschemes
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange-nvim'
Plug 'rose-pine/neovim'

" Lua library
Plug 'nvim-lua/plenary.nvim'

" LSP
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

" Code Linter
Plug 'mfussenegger/nvim-lint'

" Code Formatter
Plug 'stevearc/conform.nvim'

" Auto completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'ray-x/lsp_signature.nvim'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" File management
Plug 'ptzz/lf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stevearc/oil.nvim'

call plug#end()

let g:lf_map_keys = 0
let g:lf_replace_netrw = 0

source $HOME/.config/nvim/keymaps.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/abbreviations.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/quickfix.vim

source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/lsp_zero.lua
source $HOME/.config/nvim/lua/mini.lua
source $HOME/.config/nvim/lua/plugins.lua
" source $HOME/.config/nvim/lua/linter.lua

colorscheme tokyonight-moon
" colorscheme rose-pine-moon
" highlight Normal guibg=NONE ctermbg=NONE

" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

