let mapleader = " "

syntax on
filetype plugin indent on

set encoding=utf-8
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent
set incsearch ignorecase smartcase nohlsearch
set number
set foldlevel=0
set foldmethod=marker
set guicursor=i:block
set nohlsearch
set mouse=a
set splitright
set undodir=/tmp/nvim.undo
set undofile
set updatetime=300
set wildmode=longest:list,full wildmenu
set completeopt=menuone,noinsert,noselect,preview
set cindent
set tags=tags
set background=dark
set scrolloff=0 sidescrolloff=1
set wrap linebreak
set termguicolors

iabbrev @@ aarya.bhatia1678@gmail.com

" plugins

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'kshenoy/vim-signature'
Plug 'preservim/tagbar'
Plug 'romainl/vim-qf'
Plug 'justinmk/vim-sneak'
Plug 'preservim/nerdtree'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'wellle/targets.vim'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v4.x'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'stevearc/conform.nvim'
Plug 'ap/vim-css-color'
call plug#end()

let g:lf_map_keys = 0

nnoremap <leader>- :Lf<CR>
nnoremap <leader>tt :TagbarToggle<CR>

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Trim trailing whitespace on lines
au BufWritePost * :%s/\s\+$//e | nohlsearch

au FileType markdown,text setlocal spell spelllang=en_us wrap
au FileType make setlocal ts=4 sts=4 sw=4 noet list

colorscheme default

""""""""""""""""""""""""""""""""""""""""""""""""""

" nerd tree

" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""

" status line

set noshowmode
set laststatus=2

let g:lightline = { 'colorscheme': 'wombat' }

""""""""""""""""""""""""""""""""""""""""""""""""""

" fzf

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden,right,50%', 'ctrl-/']
let g:fzf_layout = { 'down':  '30%'}
let g:fzf_vim.buffers_jump = 1

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
	call setqflist(map(copy(a:lines), '{ "filename": v:val, "lnum": 1 }'))
	copen
	cc
endfunction

let g:fzf_action = {
			\ 'ctrl-q': function('s:build_quickfix_list'),
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-x': 'split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit' }

nnoremap <C-p> :GFiles<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <silent> <leader>fg :RG<CR>
nnoremap <silent> <leader>fo :History<CR>
nnoremap <silent> <leader><leader> :Buffers<CR>
nnoremap <silent> <leader>f/ :BLines<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>fh :Help<CR>
nnoremap <silent> <leader>fm :Marks<CR>
nnoremap <silent> <leader>fj :Jumps<CR>
nnoremap <silent> <leader>fs :Snippets<CR>
nnoremap <silent> <leader>ft :Tags<CR>
nnoremap <silent> <leader>fc :Commands<CR>
nnoremap <silent> <leader>fv :Commits<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""

" vimwiki
let g:vimwiki_list = [{'path': '~/wiki/'}]

""""""""""""""""""""""""""""""""""""""""""""""""""

" quickfix list

let g:qf_auto_resize = 0

au FileType qf cabbrev <buffer> K Keep
au FileType qf cabbrev <buffer> Rej Reject
au FileType qf cabbrev <buffer> Res Restore
au FileType qf nnoremap <buffer> dd :.Reject<CR>
au FileType qf vnoremap <buffer> d :Reject<CR>
au FileType qf nnoremap <buffer> [[ :colder<CR>
au FileType qf nnoremap <buffer> ]] :cnewer<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""

" general keymaps

nnoremap <silent> <leader> <Nop>

" Check if Vim has clipboard support
if has('clipboard')
    " If clipboard support is available, map to the system clipboard
    xnoremap <leader>y "+y
    nnoremap <leader>yy "+yy
    nnoremap <leader>pp "+p
else
    " Check if xclip is available, otherwise fallback to xsel
    if executable('xclip')
        xnoremap <leader>y :w !xclip -sel clipboard<cr>
        nnoremap <leader>yy :w !xclip -sel clipboard<cr>
        nnoremap <leader>pp :r !xclip -o -sel clipboard<cr>
    elseif executable('xsel')
        xnoremap <leader>y :w !xsel --clipboard --input<cr>
        nnoremap <leader>yy :w !xsel --clipboard --input<cr>
        nnoremap <leader>pp :r !xsel --clipboard --output<cr>
    endif
endif

nnoremap <leader>s :write<cr>
nnoremap <leader>q :quit<CR>

" [V]im related
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vpi :PlugInstall<CR>
nnoremap <leader>vpu :PlugUpdate<CR>
nnoremap <leader>vps :PlugStatus<CR>
nnoremap <leader>vpc :PlugClean<CR>

" Unhighlight search results
nnoremap <silent> <leader>hl :set invhlsearch<CR>

" Exit insert mode
inoremap <silent> kj <Esc>

nnoremap <leader>pt :set invpaste<CR>

nnoremap > >>
nnoremap < <<
xnoremap > >gv
xnoremap < <gv

" Paste over currently selected text without yanking it
xnoremap <silent> p "_dP

" Horizontal scrolling
nnoremap <silent> <C-h> 8zh
nnoremap <silent> <C-l> 8zl
xnoremap <silent> <C-h> 8zh
xnoremap <silent> <C-l> 8zl

" move up/down faster
nnoremap <silent> <C-k> 6gk
nnoremap <silent> <C-j> 6gj
xnoremap <silent> <C-k> 6gk
xnoremap <silent> <C-j> 6gj

" To move around in insert mode
inoremap <silent> <C-h> <Left>
inoremap <silent> <C-j> <Down>
inoremap <silent> <C-k> <Up>
inoremap <silent> <C-l> <Right>

" Replay macro @q
nnoremap Q @q

" [Y]ank till end of line for consistency with C and D commands
nnoremap Y y$

" Replace current word with yanked word ([p]aste [w]ord)
nnoremap <leader>pw ciw<C-r>0<Esc>

" [I]nsert [D]ate : TODO replace with date snippet
nnoremap <leader>id i<C-R>=strftime('%Y-%m-%d')<CR><Esc>

nnoremap <leader>mk :make<CR>

" Run the command on current line and paste output below
nnoremap <leader>R "zyy:r !z 2>&1 

xnoremap ss !sort<CR>
xnoremap su !sort\|uniq<CR>

nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

nnoremap <leader>d :bd<CR>

" Exit terminal mode
tnoremap <silent> <Esc> <C-\><C-n>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

