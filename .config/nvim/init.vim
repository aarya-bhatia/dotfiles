let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.local/share/nvim/plugged')
" General
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'echasnovski/mini.bufremove'
Plug 'echasnovski/mini.ai'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'preservim/tagbar'
Plug 'romainl/vim-qf'
Plug 'justinmk/vim-sneak'

" File management
Plug 'voldikss/vim-floaterm'
Plug 'ptzz/lf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'kovetskiy/sxhkd-vim'

" colorschemes
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange-nvim'
Plug 'rose-pine/neovim'
" Plug 'dracula/vim'

" LSP
Plug 'nvim-lua/plenary.nvim'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'mfussenegger/nvim-lint'
Plug 'stevearc/conform.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'ray-x/lsp_signature.nvim'
Plug 'L3MON4D3/LuaSnip'

call plug#end()

let mapleader = " "

filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase nohlsearch
set wildmode=longest,list,full wildmenu
set ruler laststatus=2 showcmd showmode
set nolist
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
set mouse=n
set scrolloff=8 sidescrolloff=8
set splitbelow splitright
set undodir=/tmp/nvim.undo
set undofile

let g:netrw_banner=0
let g:netrw_liststyle=3

let g:lf_map_keys = 0
let g:lf_replace_netrw = 1

" colorscheme dracula

" comments
au FileType asm setlocal commentstring=#\ %s

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Trim trailing whitespace on lines
au BufWritePost * :%s/\s\+$//e | nohlsearch

au BufNewFile,BufRead */mutt/* set filetype=muttrc

au BufNewFile,BufRead *.ejs setlocal filetype=html
au FileType c,cpp	setlocal foldmarker={,} foldlevel=4
au FileType markdown,text setlocal spell spelllang=en_us
au FileType markdown,text setlocal wrap
au FileType make setlocal ts=4 sts=4 sw=4 noet list

iabbrev @@ aarya.bhatia1678@gmail.com
iabbrev UIUC University of Illinois
iabbrev ----- --------------------------------------

xnoremap <leader>ga <Plug>(EasyAlign)
nnoremap <leader>ga <Plug>(EasyAlign)
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>M :Mason<CR>
nnoremap <leader>L :LspInfo<CR>
nnoremap <leader>e :25Lex<CR>
nnoremap <leader>- :Lf<CR>

lua << EOF

local paths = vim.split(vim.fn.glob('~/.config/nvim/plugins/*.vim'), '\n')
for i, file in pairs(paths) do
  vim.cmd('source ' .. file)
end

require("mini.bufremove").setup()
require("mini.ai").setup()
require("treesitter")
require("lsp_zero")

EOF

