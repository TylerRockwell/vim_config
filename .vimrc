" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Add nerdtree
Plugin 'scrooloose/nerdtree'
" Multiline Comments
Plugin 'scrooloose/nerdcommenter'
" Nerdtree Tabs
Bundle 'jistr/vim-nerdtree-tabs'
" Fuzzy Finder
Plugin 'ctrlpvim/ctrlp.vim'
" Surround
Plugin 'tpope/vim-surround'
" Proper Markdown syntax highlighting
Plugin 'plasticboy/vim-markdown'
" Use tab for autocomplete
Plugin 'ervandew/supertab'
" Rails Development
Plugin 'tpope/vim-rails'
" Ruby Development
Plugin 'vim-ruby/vim-ruby'
" Git Commands
Plugin 'tpope/vim-fugitive'
" Bundler Commands
Plugin 'tpope/vim-bundler'
" Visual select by expanding regions
Plugin 'terryma/vim-expand-region'
" Run tests from vim
Plugin 'skalnik/vim-vroom'
" Use ack for project search
Plugin 'mileszs/ack.vim'
" Python PEP8 Linting
Plugin 'nvie/vim-flake8'
" Rainbow Parentheses
Plugin 'junegunn/rainbow_parentheses.vim'
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line Use Vim settings, rather then Vi settings (much better!).

" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set splitbelow                  "Split down when creating vsplit
set splitright                  "Split right when creating split
set hlsearch                    "Highlight search results

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
set hidden

"turn on syntax highlighting
syntax on

" =============== Vundle Initialization ===============
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ NERDTree Config ==================
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Improve Your Spelling ==============
autocmd BufRead,BufNewFile *.md setlocal spell

" ================ Set Ctrl-P to Open in New Tab ==============
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" ================ Custom Settings ========================

colorscheme molokai
set ruler

map <SPACE> <leader>
" hjkl ignore wrappig
noremap k gk
noremap j gj
noremap 0 g0
noremap $ g$

" Save faster
nnoremap <Leader>w :w<CR>

" Close faster
nnoremap <Leader>q :q<CR>

" Quickly use system clipboard
nnoremap <leader>p "+

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier Split Resizing
nnoremap <leader>h :vertical resize -20<CR>
nnoremap <leader>l :vertical resize +20<CR>
nnoremap <leader>k :resize +10<CR>
nnoremap <leader>j :resize -10<CR>

" Expanding Visual Regions
map v <Plug>(expand_region_expand)
map <C-v> <Plug>(expand_region_shrink)

" Invert Supertab Display
let g:SuperTabDefaultCompletionType = "<C-N>"
set complete-=i

" Use silver searcher for search
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack!
set switchbuf=useopen,usetab,newtab " Switch to file if open, else open in new tab

" Turn on Rainbow Parentheses
call rainbow_parentheses#activate()

" Search as you type
set incsearch
" ================ Atom-Like Mappings ========================
" Toggle NerdTree
nnoremap <leader><Bslash> :NERDTreeToggle<CR>

" Swap tabs
nnoremap <leader>] :tabn<CR>
nnoremap <leader>[ :tabp<CR>

" Fuzzy find
nnoremap <leader>t :CtrlP<CR>

" Toggle comments
nnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
vnoremap <leader>/ :call NERDComment(0,"toggle")<CR>
