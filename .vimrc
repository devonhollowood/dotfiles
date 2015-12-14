call plug#begin('~/.vim/bundle')
" My Plugins

" Defaults
Plug 'tpope/vim-sensible'

" General coding
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'reedes/vim-pencil'
Plug 'majutsushi/tagbar'

" Language-specific
Plug 'rust-lang/rust.vim'
Plug 'bitc/vim-hdevtools'

" Appearance
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'

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

call plug#end()

"basic options
set background=dark " Set dark background
set colorcolumn=80  " Highlight the 80th column
set hidden          " Allow switching tabs without saving
set shiftround      " Round indentations to multiples of shiftwidth

"highlight extra spaces
match ErrorMsg '\s\+$'

let mapleader = "\<Space>"

"set up tabs
set smartindent     " Do smart auto-indenting at beginning of line
set tabstop=4       " Tabs are 4 spaces wide
set shiftwidth=4    " Shifts are 4 spaces wide
set expandtab       " Tabs are made of spaces

"set up spellcheck
set spelllang=en_us
nnoremap <leader>s :set spell!<CR>

"set up colorscheme
colorscheme solarized

"set up bash
let g:is_bash=1

"set up crontab
au FileType crontab setlocal bkc=yes

"set up git
au FileType gitcommit setlocal spell

"filetype specific

"Markdown
autocmd FileType markdown,mkd call pencil#init({'wrap': 'soft'})
autocmd FileType markdown,mkd set colorcolumn&vim

"Text
autocmd FileType text set colorcolumn&vim

"Tex
autocmd FileType tex,plaintext,context call pencil#init({'wrap': 'soft'})
autocmd FileType tex,plaintext,context set colorcolumn&vim
autocmd FileType tex,plaintext,context set conceallevel=0

"Python
autocmd FileType python set colorcolumn=100

"Rust
autocmd FileType rust set colorcolumn=100

"Haskell
autocmd Filetype haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
autocmd FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>

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
let g:syntastic_haskell_hdevtools_args = "-g -Wall -g -fno-warn-unused-do-bind"

"set up NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"set up Tagbar
nmap <F8> :TagbarToggle<CR>
