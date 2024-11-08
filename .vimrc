" plugins

""""""""""""""""""""""""""""""""""""""""""""""""""

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Plug 'dense-analysis/ale'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'ap/vim-css-color'
Plug 'crusoexia/vim-monokai'
Plug 'edkolev/tmuxline.vim'
Plug 'freitass/todo.txt-vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
Plug 'mattn/calendar-vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'preservim/vim-markdown'
Plug 'ptzz/lf.vim'
Plug 'romainl/vim-qf'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
Plug 'wellle/targets.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""

let maplocalleader = " "
let mapleader = " "

syntax on
filetype plugin indent on

if !isdirectory($HOME . '/.vim/undo')
    call mkdir($HOME . '/.vim/undo', 'p')
endif

if !isdirectory($HOME . '/.vim/swap')
    call mkdir($HOME . '/.vim/swap', 'p')
endif

if !isdirectory($HOME . '/.vim/templates')
    call mkdir($HOME . '/.vim/templates', 'p')
endif

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
set number title showcmd
set scrolloff=0 sidescrolloff=0
set smarttab autoindent cindent
set splitright
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab 
set tags=tags
set undodir=~/.vim/undo 
set undofile
set wildmode=longest:list,full wildmenu
set directory=~/.vim/swap

iabbrev @@ aarya.bhatia1678@gmail.com

" edit todos
nnoremap <leader>et :e ~/Dropbox/todos/todo.txt<CR>
let g:todo_done_filename = 'done.txt'

" edit wiki
nnoremap <leader>ew :e ~/wiki/index.md<CR>

" ------------------------------------
"
" theme and statusline
"

hi Normal guibg=NONE ctermbg=NONE
set termguicolors
set noshowmode
set laststatus=2

colorscheme gruvbox

let g:airline_powerline_fonts = 1
let g:airline_theme='term'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#whitespace#enabled = 0  " Disable whitespace extension
let g:airline#extensions#syntastic#enabled = 0   " Disable syntastic if using
let g:airline#extensions#tabline#enabled = 0     " Disable tabline

"
" --------- vim-markdown ---------
"

let g:vim_markdown_folding_disabled = 0
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_no_default_key_mappings = 0
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_fenced_languages = ['php', 'py=python', 'js=javascript', 'bash=sh', 'viml=vim']
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0

""""""""""""""""""""""""""""""""""""""""""""""""""

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

let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': 'md' }]

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

""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('ag')
    set grepprg=ag\ --vimgrep
    set grepformat=%f:%l:%c:%m
elseif executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
  augroup END
endif

""""""""""""""""""""""""""""""""""""""""""""""""""

function! EditArgs()
  new
  call setline(1, argv())
  setlocal buftype=nofile bufhidden=wipe noswapfile
  nnoremap <buffer> <silent> <leader>s :call SetArgs()<CR>
endfunction

function! SetArgs()
  let args = getline(1, '$')
  exe 'args ' . join(args, ' ')
  bdelete
endfunction

nnoremap <leader>ea :call EditArgs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""

function! EditQuickfix()
  new
  let qflist = getqflist()
  setlocal buftype=nofile bufhidden=wipe noswapfile
  nnoremap <buffer> <silent> <leader>s :call SetQuickfix()<CR>
endfunction

function! SetQuickfix()
  let new_qf = []
  for line in getline(1, '$')
    let parts = split(line, ':', 4)
    if len(parts) >= 4
      call add(new_qf, {
            \ 'filename': parts[0],
            \ 'lnum': str2nr(parts[1]),
            \ 'col': str2nr(parts[2]),
            \ 'text': parts[3]
            \ })
    endif
  endfor
  call setqflist(new_qf)
  bd
endfunction

nnoremap <leader>eq :call EditQuickfix()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""

