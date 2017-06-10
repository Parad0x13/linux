set number
syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4

" Eff you trailing whitespace!!!
autocmd BufWritePre * :%s/\s\+$//e
