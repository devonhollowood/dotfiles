call plug#begin('~/.vim/bundle')
" My Plugins

" Defaults
Plug 'tpope/vim-sensible'

" Keybindings
Plug 'ctjhoa/spacevim'

" General coding
Plug 'scrooloose/syntastic'
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

"set up bash
let g:is_bash=1

"set up crontab
au FileType crontab setlocal bkc=yes

"set up git
au FileType gitcommit setlocal spell

"set up undo
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

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
autocmd FileType tex,plaintext,context set tabstop=2
autocmd FileType tex,plaintext,context set shiftwidth=2

"Python
autocmd FileType python set colorcolumn=100

"Rust
autocmd FileType rust set colorcolumn=100
let g:rustfmt_autosave = 1

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
"let g:syntastic_haskell_checkers = ['hlint']
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -Wall -Wextra -Wpedantic'
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck', 'clang_check', 'clang_tidy']
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck', 'clang_check', 'clang_tidy']
let g:syntastic_tex_checkers = ['chktex']

"set up NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"set up Tagbar
nmap <F8> :TagbarToggle<CR>

" set up encoding
set encoding=utf-8
