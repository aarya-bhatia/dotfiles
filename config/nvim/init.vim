source $VIM_DIR/main.vim
source $VIM_DIR/keymaps.vim
source $VIM_DIR/autocmds.vim
source $VIM_DIR/abbrev.vim

set guicursor+=i:block

tnoremap <Esc> <C-\><C-n>

call plug#begin('$HOME/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'     " Repeat custom commands with dot
Plug 'tpope/vim-fugitive'   " Git tool

Plug 'numToStr/Comment.nvim'

" colorschemes
Plug 'sainnhe/gruvbox-material'
Plug 'folke/tokyonight.nvim'

" status line
Plug 'nvim-lualine/lualine.nvim'

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

Plug 'jamessan/vim-gnupg'       " edit gpg files in vim

nnoremap <leader>- :Oil<CR>

source $VIM_DIR/plugins/fzf.vim           " fuzzy finder
source $VIM_DIR/plugins/coc.vim           " lsp
source $VIM_DIR/plugins/ack.vim           " grep tool
source $VIM_DIR/plugins/tagbar.vim        " tags

" Lua development plugin
Plug 'bfredl/nvim-luadev'
nnoremap <leader>lr <Plug>(Luadev-Run)
nnoremap <leader>ll <Plug>(Luadev-RunLine)

call plug#end()

" lua configs
source $HOME/.config/nvim/lua/config.lua
source $HOME/.config/nvim/lua/treesitter.lua
source $HOME/.config/nvim/lua/commands.lua

colorscheme gruvbox-material
" colorscheme tokyonight-night

