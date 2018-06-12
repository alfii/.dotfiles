execute pathogen#infect()
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

let g:gruvbox_italic=1
colorscheme gruvbox

"Toggle semicolon at end of line"
nnoremap ;; m`:s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>``

set termguicolors

