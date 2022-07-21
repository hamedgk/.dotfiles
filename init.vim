:set number
:set relativenumber
:set autoindent
:set tabstop=8
:set shiftwidth=4
:set smarttab
:set softtabstop=8
:set mouse=a
:set encoding=UTF-8

let mapleader = " " " map leader to Space

call plug#begin()


Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"fzf configurations
nnoremap <C-p> :GFiles<Cr>

"ripgrep need to be installed
nnoremap <C-g> :Rg<Cr>

"listing buffers
nnoremap <silent><leader>l :Buffers<CR>

"autocompletion in ale
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"

"set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 0
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1

let g:ale_fixers = {'rust': ['rustfmt']}

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0

let g:ale_set_highlights = 0
let g:ale_sign_error = "✗"
let g:ale_sign_warning = "⚠"

let g:ale_linters = {'rust': ['analyzer']}
let g:ale_rust_rls_executable = '/home/hamedgk/.cargo/bin/rust-analyzer'
let g:ale_rust_rls_toolchain = 'stable'

Plug 'dense-analysis/ale'

call plug#end()            " required
filetype plugin indent on    " required


"set background=dark
colorscheme PaperColor
