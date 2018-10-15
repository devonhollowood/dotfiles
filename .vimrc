call plug#begin('~/.vim/bundle')
" My Plugins

" Defaults
Plug 'tpope/vim-sensible'

" Keybindings
Plug 'ctjhoa/spacevim'

" General coding
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'reedes/vim-pencil'
Plug 'majutsushi/tagbar'

" Language-specific
Plug 'rust-lang/rust.vim'
Plug 'lambdatoast/elm.vim'
Plug 'wlangstroth/vim-racket'

" Appearance
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'chriskempson/base16-vim'

" File Navigation
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Integration
Plug 'tpope/vim-fugitive'
Plug 'jez/vim-superman'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'

" Trial Plugins
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-unimpaired'
Plug 'dietsche/vim-lastplace'
Plug 'mbbill/undotree'

call plug#end()

"basic options
set background=dark " Set dark background
set colorcolumn=80  " Highlight the 80th column
set hidden          " Allow switching tabs without saving
set smartcase       " search is case-insensitive by default if all lowercase
set mouse=a

"highlight extra spaces
match ErrorMsg '\s\+$'

" general re-mapping
map ; :
let mapleader = "\<Space>"

"set up tabs
set smartindent     " Do smart auto-indenting at beginning of line
set tabstop=4       " Tabs are 4 spaces wide
set shiftwidth=4    " Shifts are 4 spaces wide
set expandtab       " Tabs are made of spaces
set shiftround      " Round indentations to multiples of shiftwidth

"set up spellcheck
set spelllang=en_us
nnoremap <leader>s :set spell!<CR>

"set up colorscheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellRare
hi SpellRare cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline
hi clear SpellLocal
hi SpellLocal cterm=underline

"set up undo
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

"set up ale
let g:ale_completion_enabled = 1

"airline options
let g:airline#extensions#tabline#enabled = 1

"set up NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"set up Tagbar
nmap <F8> :TagbarToggle<CR>

" set up encoding
set encoding=utf-8
