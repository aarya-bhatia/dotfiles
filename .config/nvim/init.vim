let mapleader = ' '
let maplocalleader = ' '

" plugins {{{

" autoinstall vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('$HOME/.config/nvim/plugged')

Plug 'chentoast/marks.nvim'
Plug 'itchyny/lightline.vim'
Plug 'jamessan/vim-gnupg'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'preservim/tagbar'
Plug 'ptzz/lf.vim'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'
Plug 'wellle/targets.vim'

" colorschemes
Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'savq/melange-nvim'

" " LSP
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'L3MON4D3/LuaSnip'
" Plug 'neovim/nvim-lspconfig'
" Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
" Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'williamboman/mason.nvim'

" Syntax
Plug 'kovetskiy/sxhkd-vim'

source /home/aarya/.config/nvim/plugins/coc.vim

call plug#end()

" }}}

" Plugin config {{{

let g:autoformat_verbosemode=1
let g:lf_map_keys = 0
let g:lf_replace_netrw = 1
let g:lightline = { 'colorscheme': 'wombat' }

" quickfix list {{{

let g:qf_auto_resize = 0

au FileType qf cabbrev <buffer> K Keep
au FileType qf cabbrev <buffer> Rej Reject
au FileType qf cabbrev <buffer> Res Restore

au FileType qf nnoremap <buffer> dd :.Reject<CR>
au FileType qf vnoremap <buffer> d :Reject<CR>

au FileType qf nnoremap <buffer> [[ :colder<CR>
au FileType qf nnoremap <buffer> ]] :cnewer<CR>

" }}}

au FileType asm setlocal commentstring=#\ %s

" }}}

" editor settings {{{

" colorscheme melange
" colorscheme koehler
colorscheme gruvbox-material

set background=dark

set nocompatible
syntax on
filetype indent plugin on

set autoindent                    " set auto-indenting on for programming
set backspace=indent,eol,start    " make that backspace key work the way it should
set belloff=all                   " turn off error beeps
set colorcolumn=0
set hidden                        " allows multiple buffers without saving
set ignorecase                    " ignore case when searching
set incsearch                     " do incremental searching
set laststatus=2		          " always show status line
set linebreak
set mouse+=a
set nowrap
set relativenumber                " show relative line numbers
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

set foldlevel=0
set foldmarker={{{,}}}
set foldmethod=marker

set list
set listchars=tab:..,trail:_,extends:>,precedes:<,nbsp:~

runtime! ftplugin/man.vim         " Use :Man man to lookup man page

let g:python3_host_prog="/home/aarya/pyvenv/bin/python3"

" }}}

" autocommands {{{

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
au FileType c,cpp 	setlocal foldmarker={,} foldlevel=4

au FileType markdown,text setlocal spell spelllang=en_us
au FileType markdown,text setlocal wrap

au FileType make setlocal ts=4 sts=4 sw=4 noet list

" }}}

" aliases {{{
iabbrev @@ aarya.bhatia1678@gmail.com
iabbrev UIUC University of Illinois
iabbrev ---- -----------------------------------
iabbrev #### ###################################

" }}}

" keymaps {{{

nnoremap <silent> <leader> <Nop>

tnoremap <Esc> <C-\><C-n>

map [f <Nop>
map ]f <Nop>
map gh <Nop>
map gH <Nop>

xnoremap <leader>y :w !xsel -b<CR><CR>
nnoremap <leader>yy :w !xsel -b<CR><CR>

nnoremap <leader>q :quit<CR>
nnoremap <leader>s :write<cr>
nnoremap <leader>d :bd<CR>

" [V]im namespace
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <leader>vpi :PlugInstall<CR>
nnoremap <leader>vpu :PlugUpdate<CR>
nnoremap <leader>vps :PlugStatus<CR>
nnoremap <leader>vpc :PlugClean<CR>

" Unhighlight search results
nnoremap <Esc> :nohl<CR>
nnoremap <leader>hl :set invhlsearch<CR>

" surround last visual selection with quotes
nnoremap <leader>v" `>a"<esc>`<i"<esc>lel

" Exit insert mode
inoremap kj <Esc>

" Indent with single angle bracket
nnoremap > >>
nnoremap < <<

" Reselect visual range while indenting
vnoremap < <gv
vnoremap > >gv

" Paste over currently selected text without yanking it
xnoremap p "_dP

" navigate quickfix list
nnoremap [q :cprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" navigate location list
nnoremap [l :lprev<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

" navigate buffers
nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

" navigate arg list
nnoremap [A :first<CR>
nnoremap ]A :last<CR>
nnoremap [a :prev<CR>
nnoremap ]a :next<CR>

" navigate tabs
nnoremap [t :tabprevious<CR>
nnoremap ]t :tabnext<CR>
nnoremap [T :tabfirst<CR>
nnoremap ]T :tablast<CR>

" Horizontal scrolling
nnoremap <C-h> 8zh
nnoremap <C-l> 8zl
vnoremap <C-h> 8zh
vnoremap <C-l> 8zl

" Vertical scrolling without moving cursor
nnoremap <leader>k 6<C-y>
nnoremap <leader>j 6<C-e>
vnoremap <leader>k 6<C-y>
vnoremap <leader>j 6<C-e>

" move up/down faster
nnoremap <C-k> 6gk
nnoremap <C-j> 6gj
vnoremap <C-k> 6gk
vnoremap <C-j> 6gj

" handle line wrapped text in normal and visual mode
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" To move around in insert mode
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Replay macro @q
nnoremap Q @q

" [Y]ank till end of line for consistency with C and D commands
nnoremap Y y$

" Select the lines that were just pasted
nnoremap <leader>V V`]

" Replace current word with yanked word ([p]aste [w]ord)
nnoremap <leader>pw ciw<C-r>0<Esc>
nnoremap <leader>pW ciW<C-r>0<Esc>

" [I]nsert [D]ate
nnoremap <leader>id i<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>

nnoremap <leader>mk :make<CR>

" Run the command on current line and paste output below
nnoremap <leader>R "zyy:r !z

xnoremap ss !sort<CR>
xnoremap su !sort\|uniq<CR>

" }}}

" FZF (Fuzzy Finder) {{{

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

" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" Preview window is hidden by default. You can toggle it with ctrl-/.
" It will show on the right with 50% width, but if the width is smaller
" than 70 columns, it will show above the candidate list
let g:fzf_preview_window = ['right,50%', 'ctrl-/']

let g:fzf_command_prefix = 'Fzf'

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_history_dir = '~/.local/share/fzf-history'

" List files in current files directory
nnoremap <leader>fF :call fzf#vim#files(expand("%:h"))<CR>

" List git files
nnoremap <silent> <leader>fg :FzfGFiles<CR>

" List files
nnoremap <silent> <leader>ff :FzfFiles<CR>

nnoremap <C-p> :FzfFiles<CR>

" Find in history
nnoremap <silent> <leader>fh :FzfHistory<CR>

" List windows
nnoremap <silent> <leader>fw :FzfWindows<CR>

" List buffers
nnoremap <silent> <leader><leader> :FzfBuffers<CR>

" Find lines in buffers
nnoremap <silent> <leader>fl :FzfBLines<CR>

" Find lines in all buffers
nnoremap <silent> <leader>fL :FzfLines<CR>

" Grep search with Silver Searcher
nnoremap <silent> <leader>/ :FzfAg<CR>

" List help tags
nnoremap <silent> <leader>f? :FzfHelp<CR>

" List marks
nnoremap <silent> <leader>fm :FzfMarks<CR>

" List jumps
nnoremap <silent> <leader>fj :FzfJumps<CR>

" List snippets
nnoremap <silent> <leader>fs :FzfSnippets<CR>

" List tags
nnoremap <silent> <leader>ft :FzfTags<CR>

" List git commits
nnoremap <silent> <leader>fc :FzfCommits<CR>

" }}}

if has("cscope") " {{{

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

function! LoadCscopeToQuickFix(currword, oper)
  execute "normal mZ"
  execute "set csqf=" . a:oper . "-"
  execute "lcs find " a:oper . " " . a:currword
  execute "lopen"
  execute "wincmd p"
  execute "normal `Z"
  execute "set csqf="
endfunction

nnoremap <leader>css         <Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"s")<CR>
nnoremap <leader>csg         <Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"g")<CR>
nnoremap <leader>csc         <Esc>:call LoadCscopeToQuickFix(expand("<cword>"),"c")<CR>

" }}}

function! LF() " {{{
    let temp = tempname()
    exec 'silent !lf -selection-path=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        return
    endif
    exec 'edit ' . fnameescape(names[0])
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction

command! -bar LF call LF()
nnoremap <leader>- :LF<CR>

" }}}

" Ultisnips {{{

" Plug 'SirVer/ultisnips'       " snippet engine

" let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" }}}

" Plugin keymaps {{{

xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

nnoremap <leader>- :Lf<CR>z1
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>M :Mason<CR>
" nnoremap <leader>F :LspZeroFormat<CR>
nnoremap <leader>F :Format<CR>

" }}}

" nvim/lua configs {{{

if has('nvim')

lua <<EOF

require('Comment').setup()

require('marks').setup()

vim.opt.list = false
vim.opt.listchars:append "eol:↴"
vim.opt.listchars:append "space:⋅"

function SendRegisterToExternalCommand(cmd)
	local contents = vim.fn.getreg('"')
	local tmpfile = vim.fn.tempname()
	local file = io.open(tmpfile, "w")
	if file == nil then return end
	file:write(contents)
	file:close()
	print("Copied " .. string.len(contents) .. " bytes to " .. tmpfile)

	cmd = "cat " .. tmpfile .. " | " .. cmd
	print(vim.fn.system(cmd))
end

EOF

source $HOME/.config/nvim/lua/treesitter.lua
" source $HOME/.config/nvim/lua/lsp.lua

set guicursor=i:block

endif

" }}}

" Colors {{{
" hi Normal guibg=NONE ctermbg=NONE

" Change the color of the current match
highlight Search cterm=none ctermbg=yellow ctermfg=black guibg=yellow guifg=black

" Change the color of the first character of the current match
highlight SearchCursor cterm=none ctermbg=yellow ctermfg=black guibg=yellow guifg=black

" }}}
