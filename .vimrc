set number
syntax on

colorscheme darkblue

set tabstop=4
set shiftwidth=4
set softtabstop=4

set cursorline

" Eff you trailing whitespace!!!
autocmd BufWritePre * :%s/\s\+$//e

