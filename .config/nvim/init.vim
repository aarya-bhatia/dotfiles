set nocompatible
syntax on
filetype indent plugin on

let mapleader = ' '
let maplocalleader = ' '
let g:python3_host_prog="/home/aarya/pyvenv/bin/python3"

set autoindent                    " set auto-indenting on for programming
set background=dark
set backspace=indent,eol,start    " make that backspace key work the way it should
set belloff=all                   " turn off error beeps
set colorcolumn=0
set foldlevel=0
set foldmarker={{{,}}}
set foldmethod=marker
set guicursor=i:block
set hidden                        " allows multiple buffers without saving
set ignorecase                    " ignore case when searching
set incsearch                     " do incremental searching
set laststatus=2				  " always show status line
set linebreak
set list
set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~
set mouse=a
set nowrap
" set relativenumber                " show relative line numbers
set number
set shiftwidth=4 tabstop=4 noexpandtab
set showmatch                     " jump to matches when entering regexp
set smartcase                     " no ignorecase if Uppercase char present
set smartindent
set smarttab
set splitbelow                    " new horizontal split opens below current window
set splitright                    " new vertical split opens to the right of current window
set termguicolors
set undodir=~/undodir
set undofile
set wildmenu

call plug#begin('$HOME/.local/share/nvim/plugged')

Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'preservim/tagbar'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-autoformat/vim-autoformat'
Plug 'voldikss/vim-floaterm'
Plug 'wellle/targets.vim'
Plug 'kovetskiy/sxhkd-vim'

" colorschemes
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange-nvim'

" LSP
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'neovim/nvim-lspconfig'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'

source $HOME/.config/nvim/lf.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/quickfix.vim

" source $HOME/.config/nvim/ale.vim
" source $HOME/.config/nvim/snippets.vim
" source $HOME/.config/nvim/cscope.vim

call plug#end()

" THEMES
" melange koehler gruvbox
" colorscheme gruvbox-material
colorscheme tokyonight-moon
" highlight SignColumn guibg=none
" highlight Normal guibg=NONE ctermbg=NONE

" Change the color of the current match
highlight Search cterm=none ctermbg=yellow ctermfg=black guibg=yellow guifg=black

" Change the color of the first character of the current match
highlight SearchCursor cterm=none ctermbg=yellow ctermfg=black guibg=yellow guifg=black

let g:lightline = { 'colorscheme': 'one' }

" comments
au FileType asm setlocal commentstring=#\ %s

" autoformat
let g:autoformat_verbosemode=1
let g:formatter_prettier="prettier --write"
let g:formatters_html=["prettier"]

" easy-align
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" tagbar
nnoremap <leader>tt :TagbarToggle<CR>

" lsp
nnoremap <leader>M :Mason<CR>
nnoremap <leader>F :LspZeroFormat<CR>
" nnoremap <leader>F :AutoFormat<CR>

nnoremap <leader>nn :NERDTreeToggle<CR>

source $HOME/.config/nvim/keymaps.vim
source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/lsp.lua
source $HOME/.config/nvim/lua/config.lua

" aliases
iabbrev @@ aarya.bhatia1678@gmail.com
iabbrev UIUC University of Illinois
iabbrev ---- -----------------------------------

" autocommands

" Return to last edit position when opening files
au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" Trim trailing whitespace on lines
au BufWritePost * :%s/\s\+$//e | nohlsearch

au BufRead,BufNewFile *.h setlocal filetype=c
au BufNewFile,BufRead *.ejs setlocal filetype=html

" au FileType c,cpp,h setlocal ts=2 sts=2 sw=2 et
au FileType c,cpp	setlocal foldmarker={,} foldlevel=4
" au FileType c,cpp	setlocal ts=2 sts=2 sw=2 et

au FileType markdown,text setlocal spell spelllang=en_us
au FileType markdown,text setlocal wrap

au FileType make setlocal ts=4 sts=4 sw=4 noet list

" Plugins
runtime ftplugin/man.vim         " Use :Man man to lookup man page
runtime macros/matchit.vim         " jump to matching words with %

" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

