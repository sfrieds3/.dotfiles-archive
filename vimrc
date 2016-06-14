call plug#begin('~/.vim/plugged')

" start of plugins

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'endwise.vim' " auto end..endif

" fuzzy finder plugins:
Plug 'kien/ctrlp.vim'
Plug 'imkmf/ctrlp-branches'
Plug 'sgur/ctrlp-extensions.vim'

" testmate snippit thing?
" Plug 'SirVer/ultisnips'

Plug 'tpope/vim-commentary' " plugin for commenting things
Plug 'tpope/vim-fugitive' " github manager for vim
Plug 'tpope/vim-surround' " advanced functions with words etc

" Color time!
Plug 'croaky/vim-colors-github'
Plug 'altercation/vim-colors-solarized'
" End colors :(

"Plug 'amiel/vim-tmux-navigator' " navigate tmux and vim panes
Plug 'rking/ag.vim' " silver searcher- quick search thru code

" Language specific
Plug 'jtratner/vim-flavored-markdown' "markdown for vim
Plug 'scrooloose/syntastic' " catch-all highlighting - potential slowdown?

"
Plug 'tpope/vim-abolish' " coersion- (crs) snake, mixed, upper case etc
Plug 'tpope/vim-eunuch' " unix shell commands
Plug 'tpope/vim-repeat' " adds repeat awareness- can repeat commands
Plug 'osyo-manga/vim-over' " visual find replace

" nerd shit
Plug 'scrooloose/nerdcommenter' " ,c[space] to comment/uncomment lines
Plug 'scrooloose/nerdtree' " ,n to toggle nerdtree

" ALL PLUGINS BEFORE THIS LINE
call plug#end()

" Basic vim setups

" retain buffers until quit
set hidden

" No bells!
set visualbell

" Fast scrolling
set ttyfast

" path/file expansion in colon-mode
set wildmode=longest:full,list:full,list:longest
set wildchar=<TAB>

" Line numbers 'yo
set ruler

" Always show status
set laststatus=2

"Brace face
set showmatch
set matchtime=3

" split down and right
set splitbelow
set splitright

" read filetype stuff
filetype plugin on
filetype indent on

" Time out on key codes but not mappings - needed for terminal vim?
set notimeout
set ttimeout
set ttimeoutlen=10

" resize splits when window is resized
au VimResized * :wincmd =

"set utf8 as standard encoding / en_US standard language
set encoding=utf8

" use spaces instead of tabs
set expandtab

"be smart when using tabs!
set autoindent
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set wrap

" search shows all results
set incsearch
set showmatch
set hlsearch

" line numbering
set number

" Tree style listing on Explore
let g:netrw_liststyle=3

set history=1000
set undofile
set undodir=~/.vim/undo " where to save undo history
set undolevels=1000 " How many undos
set undoreload=10000 " number of lines to save for undo
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Color settings!
syntax enable
set background=light
colorscheme github
let g:airline_theme='papercolor'

" Remapping key commands

"wrapped lines go down/up to next row
noremap j gj
noremap k gk

let mapleader = ","
let g:mapleader = ","

"vertical split
nnoremap <leader>w <C-w>v<C-w>l " comma w -> vertical split
"horizontal split
nnoremap <leader>h <C-w>v<C-w>l " comma h -> horizontal split

" save stuff - enter to write file in normal modeG
" nnoremap <cr> :w<cr>

" buffer commands
nmap <c-b> :bprevious<CR> " ctrl+b back in buffers
nmap <c-n> :bnext<CR> " ctrl+n next buffer
nmap bb :bw<CR>

" turn off nohlsarch
nmap <silent> <leader><space> :nohlsearch<CR>

" switch between files with ,,
nnoremap <leader><leader> <c;^>

" ,o opens directory in netrw
nnoremap <leader>o :Explore %:h<cr>

" Clean trailing whitespace
nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" ,v selects text just pasted in 
nnoremap <leader>v V']

" remap % to tab (to find matching bracket pairs)
nnoremap <tab> %
vnoremap <tab> %

" fuck the arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Make moving through words easier!!
nnoremap W gw
nnoremap E ge

" plugin configurations

" ignore for wild:
set wildignore+=*/tmp/*,*.so,*.swp,*.zip "macOS/Linux
set wildignore+=*/node_modules/*,*/bower_components/* "node js

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nmap <leader>i :CtrlPBuffer<cr> "current buffers with ,+i


function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>

" quick editing of files!
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Nerdtree starts up automatially if no file selected for vim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" ,n for nerdtree
map <Leader>n :NERDTreeToggle<CR>
