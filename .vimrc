" plugins

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'dense-analysis/ale'
Plug 'edkolev/tmuxline.vim'
Plug 'freitass/todo.txt-vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'mattn/calendar-vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'preservim/vim-markdown'
Plug 'romainl/vim-qf'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vifm/vifm.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'

call plug#end()

let maplocalleader = " "
let mapleader = " "

syntax on
filetype plugin indent on

if !isdirectory($HOME . '/.vim/undo')
    call mkdir($HOME . '/.vim/undo', 'p')
endif

set undodir=~/.vim/undo 

if !isdirectory($HOME . '/.vim/swap')
    call mkdir($HOME . '/.vim/swap', 'p')
endif

set directory=~/.vim/swap

set background=dark
set completeopt=menuone,noinsert,noselect,preview
set encoding=utf-8
set foldlevel=0 foldmethod=marker
set hidden
set incsearch ignorecase smartcase nohlsearch
set mouse=a
set nocompatible
set nohlsearch
set nowrap linebreak
set relativenumber title noshowcmd
set scrolloff=0 sidescrolloff=0
set smarttab autoindent cindent
set splitright
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
set tags=tags
set undofile
set wildmode=longest:list,full wildmenu

set path+=**

iabbrev @@ aarya.bhatia1678@gmail.com

if isdirectory("~/vimfiles")
    set runtimepath+=~/vimfiles
endif

for config in split(glob('~/vimfiles/plugin-config/*.vim'), '\n')
    execute 'source' config
endfor

" edit todos
nnoremap <leader>et :e ~/Dropbox/todos/todo.txt<CR>
let g:todo_done_filename = 'done.txt'

" edit wiki
nnoremap <leader>ew :e ~/wiki/index.md<CR>

" remap inbuilt CTRL+i = TAB, to use TAB key for other things...
nnoremap <leader><C-o> <C-i>

nnoremap <Tab> >>
nnoremap <S-Tab> <<

" nnoremap <leader>- :Vifm<CR>

nnoremap <leader>tt :TagbarToggle<CR>

"
" theme and statusline
"

hi Normal guibg=NONE ctermbg=NONE
set termguicolors
set noshowmode
set laststatus=2

colorscheme gruvbox

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Trim trailing whitespace on lines
" au BufWritePost * :%s/\s\+$//e | nohlsearch
command TrimTrailingSpaces :%s/\s\+$//e | nohlsearch

au FileType markdown,text,wiki setlocal spell spelllang=en_us wrap
au FileType make setlocal ts=4 sts=4 sw=4 noet list

let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': 'md' }]

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

if exists('$TMUX')
  " yanks visually selected text to tmux buffer
  vnoremap <leader>ty y<cr>:call system("tmux load-buffer -", @0)<cr>
  " yanks current line to tmux buffer
  nnoremap <leader>tyy y<cr>:.w !tmux load-buffer -<cr>
  " yanks entire vim buffer to tmux buffer
  nnoremap <leader>tye y<cr>:w !tmux load-buffer -<cr>
  " pastes text from tmux buffer to vim buffer
  nnoremap <leader>tp :let @0 = system("tmux save-buffer -")<cr>"0p<cr>g;
endif

if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c:%m
elseif executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

if has("autocmd")
    if isdirectory("~/vimfiles/templates")
        augroup templates
            autocmd BufNewFile *.sh 0r ~/vimfiles/templates/skeleton.sh
        augroup END
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

nnoremap [A :first<CR>
nnoremap ]A :last<CR>
nnoremap [a :prev<CR>
nnoremap ]a :next<CR>

nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>
nnoremap [l :lprev<CR>
nnoremap ]l :lnext<CR>

nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>

nnoremap [B :bfirst<CR>
nnoremap ]B :blast<CR>
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

nnoremap [T :tfirst<CR>
nnoremap ]T :tlast<CR>
nnoremap [t :tnext<CR>
nnoremap ]t :tprev<CR>

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

