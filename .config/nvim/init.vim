call plug#begin('$HOME/.local/share/nvim/plugged')
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'echasnovski/mini.bufremove'
Plug 'echasnovski/mini.ai'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-easy-align'
Plug 'kovetskiy/sxhkd-vim'
Plug 'kshenoy/vim-signature'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'preservim/tagbar'

" Quickfix list
Plug 'romainl/vim-qf'

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

call plug#end()

let mapleader = " "

filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase nohlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set list
set fillchars+=vert:\
set wrap breakindent
set encoding=utf-8
set hidden
set number
set title
set foldlevel=0
set foldmethod=marker
set guicursor=i:block
set nohlsearch
set mouse=
set scrolloff=8 sidescrolloff=8
set splitbelow splitright
set undodir=/tmp/nvim.undo
set undofile

colorscheme tokyonight-moon

let g:netrw_banner=0
let g:netrw_liststyle=3

let g:lf_map_keys = 0
let g:lf_replace_netrw = 1

" comments
au FileType asm setlocal commentstring=#\ %s

" Return to last edit position when opening files
au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" Trim trailing whitespace on lines
au BufWritePost * :%s/\s\+$//e | nohlsearch

au BufNewFile,BufRead *.ejs setlocal filetype=html
au FileType c,cpp	setlocal foldmarker={,} foldlevel=4

au FileType markdown,text setlocal spell spelllang=en_us
au FileType markdown,text setlocal wrap

au FileType make setlocal ts=4 sts=4 sw=4 noet list

iabbrev @@ aarya.bhatia1678@gmail.com
iabbrev UIUC University of Illinois
iabbrev ----- --------------------------------------

" adjust split sizes easier
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" open a terminal inside nvim
map <leader><return> :vnew term://bash<CR>i

" easy-align
xnoremap <leader>ga <Plug>(EasyAlign)
nnoremap <leader>ga <Plug>(EasyAlign)

" tagbar
nnoremap <leader>tt :TagbarToggle<CR>

" lsp
nnoremap <leader>M :Mason<CR>
nnoremap <leader>L :LspInfo<CR>

nnoremap <leader>e :25Lex<CR>

nnoremap <leader>- :Lf<CR>

" automatically close comments in C by pressing */ and place cursor inside
inoremap /* /**/<left><left>

source $HOME/.config/nvim/keymaps.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/quickfix.vim

source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/lsp_zero.lua
source $HOME/.config/nvim/install_vim_plug.vim

lua << EOF
require("mini.bufremove").setup()
require("mini.ai").setup()
EOF

