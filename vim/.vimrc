call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal.vim'
Plug 'vim-airline/vim-airline'
call plug#end()

syntax enable
set clipboard=unnamed
set number
set autoindent
filetype plugin indent on
set expandtab
set shiftwidth=4
set ignorecase

nnoremap p ]p
nnoremap P ]P
"set termguicolors

colorscheme wal
"let g:gruvbox_italic=1


"AIRLINE
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'


"Toggle semicolon at end of line"
nnoremap ;; m`:s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>``
