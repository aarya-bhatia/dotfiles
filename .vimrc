" plugins

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'preservim/tagbar'
Plug 'romainl/vim-qf'
Plug 'justinmk/vim-sneak'
Plug 'wellle/targets.vim'
Plug 'kshenoy/vim-signature'

Plug 'preservim/nerdtree'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'

Plug 'mattn/calendar-vim'
Plug 'ap/vim-css-color'
Plug 'vimwiki/vimwiki'
Plug 'tools-life/taskwiki'
" Plug 'godlygeek/tabular'
" Plug 'preservim/vim-markdown'

call plug#end()

let mapleader = " "

syntax on
filetype plugin indent on

set nocompatible
set encoding=utf-8
set hidden
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
set smarttab autoindent cindent
set incsearch ignorecase smartcase nohlsearch
set number title showcmd
set foldlevel=0 foldmethod=marker
set nohlsearch
set mouse=a
set splitright
set undodir=~/.vim/undo undofile
set wildmode=longest:list,full wildmenu
set completeopt=menuone,noinsert,noselect,preview
set tags=tags
set background=dark
set nowrap linebreak
set scrolloff=0 sidescrolloff=0

iabbrev @@ aarya.bhatia1678@gmail.com

" Theme

hi Normal guibg=NONE ctermbg=NONE
set termguicolors

" status 

set noshowmode
set laststatus=2

let g:airline_theme='term'
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'unique'
let g:airline#extensions#whitespace#enabled = 0  " Disable whitespace extension
let g:airline#extensions#syntastic#enabled = 0   " Disable syntastic if using

""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme gruvbox

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Trim trailing whitespace on lines
" au BufWritePost * :%s/\s\+$//e | nohlsearch
command TrimTrailingSpaces :%s/\s\+$//e | nohlsearch

au FileType markdown,text,wiki setlocal spell spelllang=en_us wrap
au FileType make setlocal ts=4 sts=4 sw=4 noet list

""""""""""""""""""""""""""""""""""""""""""""""""""

" lf

let g:lf_map_keys = 0
nnoremap <leader>- :Lf<CR>
nnoremap <leader>tt :TagbarToggle<CR>

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

" synchronise NERDTree with buffer switch
" autocmd BufWinEnter * NERDTreeFind

" nnoremap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=0

""""""""""""""""""""""""""""""""""""""""""""""""""

" vimwiki

let g:vimwiki_list = [{'path': '~/wiki/' }]

""""""""""""""""""""""""""""""""""""""""""""""""""

" fzf

" Initialize configuration dictionary
let g:fzf_vim = {}
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_vim.preview_window = ['hidden,right,50%', 'ctrl-/']
let g:fzf_layout = { 'down':  '30%'}

inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

" [Buffers] Jump to the existing window if possible (default: 0)
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

" let g:fzf_history_dir = '~/.local/share/fzf-history'

" List files in current files directory
nnoremap <C-p> :GFiles<CR>

" List files in working directory
nnoremap <leader>ff :Files<CR>
" List git files
nnoremap <silent> <leader>fg :Ag<CR>
nnoremap <silent> <leader>/ :RG<CR>
" Find in history
nnoremap <silent> <leader>fo :History<CR>
" List buffers
nnoremap <silent> <leader><leader> :Buffers<CR>
" Find lines in buffers
nnoremap <silent> <leader>f/ :BLines<CR>
" Find lines in all buffers
nnoremap <silent> <leader>fl :Lines<CR>
" List help tags
nnoremap <silent> <leader>fh :Help<CR>
" List marks
nnoremap <silent> <leader>fm :Marks<CR>
" List jumps
nnoremap <silent> <leader>fj :Jumps<CR>
" List snippets
nnoremap <silent> <leader>fs :Snippets<CR>
" List tags
nnoremap <silent> <leader>ft :Tags<CR>
" fzf colorschemes
nnoremap <silent> <leader>fc :Commands<CR>
" List git commits
nnoremap <silent> <leader>fv :Commits<CR>

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
    elseif executable('pbcopy')
        xnoremap <leader>y :w !pbcopy<cr>
        nnoremap <leader>yy :w !pbcopy<cr>
        nnoremap <leader>pp :r !pbpaste<cr>
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

nnoremap [a :ap<CR>
nnoremap ]a :an<CR>

nnoremap [l :lp<CR>
nnoremap ]l :ln<CR>

nnoremap [q :cp<CR>
nnoremap ]q :cn<CR>

nnoremap [b :bp<CR>
nnoremap ]b :bp<CR>

nnoremap [t :tn<CR>
nnoremap ]t :tp<CR>


" nnoremap <Tab> :bnext<CR>
" nnoremap <S-Tab> :bprev<CR>

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

" Select the lines that were just pasted
nnoremap <leader>V V`]

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

" adjust split sizes easier
noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

nnoremap <leader>d :bd<CR>

" Exit terminal mode
tnoremap <silent> <Esc> <C-\><C-n>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" move lines up or down
nnoremap <leader>k :move .-2<cr>==
nnoremap <leader>j :move .+1<cr>==
vnoremap <leader>k :move '<-2<cr>gv=gv
vnoremap <leader>j :move '>+1<cr>gv=gv

" yanks visually selected text to tmux buffer
vnoremap <leader>ty y<cr>:call system("tmux load-buffer -", @0)<cr>
" yanks current line to tmux buffer
nnoremap <leader>tyy y<cr>:.w !tmux load-buffer -<cr>
" yanks entire vim buffer to tmux buffer
nnoremap <leader>tye y<cr>:w !tmux load-buffer -<cr>
" pastes text from tmux buffer to vim buffer
nnoremap <leader>tp :let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;

nnoremap <leader>osc :!osc52.sh<cr>

if executable('ag')
    set grepprg=ag\ --vimgrep
endif

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  augroup END
endif

