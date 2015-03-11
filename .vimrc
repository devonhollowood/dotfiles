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
Plugin 'Valloric/YouCompleteMe'
Plugin 'wting/rust.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-sensible'

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
syntax on
set background=dark
set ruler
set backspace=2

"set up tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"set up colorscheme
colorscheme solarized
let g:solarized_termcolors=256

"set up bash
let g:is_bash=1

"set up youcompleteme
let g:ycm_extra_conf_globlist=['~/Documents/Work/Tesla/matcha/.ycm_extra_conf.py','~/Documents/Programming/.ycm_extra_conf.py','/Users/devon/Dropbox/Crypto101/.ycm_extra_conf.py']
let g:ycm_always_populate_location_list=1
