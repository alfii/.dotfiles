execute pathogen#infect()
syntax enable
set number
set autoindent
filetype plugin indent on
set expandtab
set shiftwidth=4

colorscheme darcula

"Toggle semicolon at end of line"
nnoremap ;; m`:s/\v(.)$/\=submatch(1)==';' ? '' : submatch(1).';'<CR>``

