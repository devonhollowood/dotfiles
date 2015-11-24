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

call plug#end()

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

"filetype specific

"Markdown
autocmd FileType markdown,mkd   call pencil#init()
autocmd FileType markdown,mkd   set colorcolumn&vim

"Text
autocmd FileType text           set colorcolumn&vim

"Tex
autocmd FileType tex,plaintext,context  call pencil#init()
autocmd FileType tex,plaintext,context  set colorcolumn&vim
autocmd FileType tex,plaintext,context  set conceallevel=0

"Python
autocmd FileType python set colorcolumn=100

"Rust
autocmd FileType rust set colorcolumn=100

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
