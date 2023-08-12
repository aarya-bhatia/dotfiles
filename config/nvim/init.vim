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
" Plug 'nvim-lualine/lualine.nvim'

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

source $VIM_DIR/plugins/fzf.vim           " fuzzy finder
source $VIM_DIR/plugins/coc.vim           " lsp
source $VIM_DIR/plugins/ack.vim           " grep tool
source $VIM_DIR/plugins/colorscheme.vim   " colorscheme

Plug 'romainl/vim-qf'
let g:qf_auto_resize = 0

Plug 'freitass/todo.txt-vim'

Plug 'voldikss/vim-floaterm'
" let g:floaterm_wintype='split'
let g:floaterm_opener='edit'
let g:floaterm_keymap_prev   = '<F10>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'
nnoremap <leader>tt :FloatermToggle<CR>

Plug 'ptzz/lf.vim'
nnoremap <leader>lf :Lf<CR>
let g:lf_map_keys = 0

Plug 'preservim/nerdtree'
nnoremap <C-t> :NERDTreeToggle<CR>

call plug#end()

" lua configs
source $HOME/.config/nvim/lua/config.lua
source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/commands.lua

colorscheme gruvbox
" colorscheme gruvbox-material

if has("termguicolors")     " set true colors
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif

" highlight Normal ctermbg=none
" highlight NonText ctermbg=none

source $VIM_DIR/main.vim

" command! Ctags :!ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp .<CR>

