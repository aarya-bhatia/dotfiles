source $HOME/.config/nvim/lua/config.lua

call plug#begin('$HOME/.local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-easy-align'
Plug 'kovetskiy/sxhkd-vim'
Plug 'kshenoy/vim-signature'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'voldikss/vim-floaterm'
Plug 'wellle/targets.vim'

" colorschemes
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange-nvim'

" LSP / Linter / Formatter
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-lint'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'stevearc/conform.nvim'

" Auto completion
Plug 'hrsh7th/nvim-cmp'

" sources
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" snippet engine
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" Plug 'honza/vim-snippets'

Plug 'ptzz/lf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'romainl/vim-qf'

call plug#end()

" source $HOME/.config/nvim/snippets.vim

source $HOME/.config/nvim/keymaps.vim
source $HOME/.config/nvim/autocommands.vim
source $HOME/.config/nvim/abbreviations.vim
source $HOME/.config/nvim/lf.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/quickfix.vim

source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/lsp.lua
source $HOME/.config/nvim/lua/formatter.lua
source $HOME/.config/nvim/lua/autocomplete.lua
" source $HOME/.config/nvim/lua/linter.lua

colorscheme tokyonight-moon
" highlight Normal guibg=NONE ctermbg=NONE

let g:lightline = { 'colorscheme': 'one' }

" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

