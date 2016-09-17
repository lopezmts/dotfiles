set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


" Utilities
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'

"Color schema
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/base16-vim'

" languages
Plugin 'tpope/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
set nocompatible " not compatible with vi
set autoread " detect when a file is changed
set backspace=indent,eol,start " make backspace behave in a sane manner
"
" Set a map leader for more key combos
let mapleader =','
let g:mapleader = ','
"
set history=10000
"
set tabstop=4 " the sible width of tabs"
set shiftwidth=4 " number of spaces use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
"
" code stuff
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1
"
"
" Color schema
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
"colorscheme solarized
"
" User Interface
set wildmenu " enhaced command line completion
set showcmd " show incomplete commands
set wildmode=list:longest " complete file like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height

set title " set terminal title

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw

set magic " set magic on, for regex
"
"
" syntax highlighting on
syntax on
set encoding=utf8
let base16colorspace=256 " Access color present in 256 colorspace
set t_Co=256
"
"
set number
set wrap " turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft linewrappig
set showbreak=... " show ellipsis at breaking

set autoindent " automatically set indent of new line
set smartindent

" status line
set laststatus=2 " show the status line all the time
"
"
" toggle invisible characters
set invlist
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
highlight SpecialKey ctermbg=none
set showbreak=↪
nmap <leader>l :set list!<cr>
"
" Textmate style indentation
"vmap <leader>[ <gv
"vmap <leader>] >gv
"nmap <leader>[ <<
"nmap <leader>] >>
"
"
" toggle cursor line
 nnoremap <leader>i :set cursorline!<cr>
"
" Plugins
"
" Tarbar config
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
"
" toggle syntastic
nmap <leader>s :SyntasticToggleMode<cr>

" Enable subpertab plugin
let g:SuperTabDefaultCompletionType = "context"
"

" close NERDTree after a file is opened
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
"nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
"nmap <silent> <leader>y :NERDTreeFind<cr>a
nmap <C-n> :NERDTreeToggle<CR>
"
" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'
"
" Fugitive Shortcuts
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>
"
nmap <leader>m :MarkedOpen!<cr>
nmap <leader>mq :MarkedQuit<cr>

" airline options
" let g:airline_left_sep=''
" let g:airline_right_sep=''
let g:airline_powerline_fonts=1
let g:airline_theme='base16'
"
