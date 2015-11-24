" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins

" Defaults
Plugin 'tpope/vim-sensible'

" General coding
Plugin 'scrooloose/syntastic'

" Language-specific
Plugin 'rust-lang/rust.vim'
Plugin 'bitc/vim-hdevtools'

" Appearance
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'

" Integration
Plugin 'tpope/vim-fugitive'
Plugin 'jez/vim-superman'

" Trial Plugins
Plugin 'rking/ag.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-commentary'
Plugin 'reedes/vim-pencil'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'

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

"basic options
syntax enable       " Show syntax highlighting
set background=dark " Set dark background
set ruler           " Show location in file
set backspace=2     " Can backspace over anything
set colorcolumn=80  " Highlight the 80th column
set hidden          " Allow switching tabs without saving

"highlight extra spaces
match ErrorMsg '\s\+$'

"set up tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"set up colorscheme
colorscheme solarized

"set up bash
let g:is_bash=1

"set up crontab
au FileType crontab setlocal bkc=yes

"set up git
au FileType gitcommit setlocal spell

"set up text files
filetype plugin on
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd   call pencil#init()
    autocmd FileType markdown,mkd   set colorcolumn&vim
    autocmd FileType text           set colorcolumn&vim
    autocmd FileType tex,plaintext,context  call pencil#init()
    autocmd FileType tex,plaintext,context  set colorcolumn&vim
    autocmd FileType tex,plaintext,context  set conceallevel=0
augroup END

"airline options
let g:airline#extensions#tabline#enabled = 1

"syntastic general
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"syntastic checker options
let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_sh_checkers = ['sh', 'shellcheck']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11'

"set up NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"set up Tagbar
nmap <F8> :TagbarToggle<CR>
