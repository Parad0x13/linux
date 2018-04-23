syntax on
colorscheme default
set number cursorline
set tabstop=4 shiftwidth=4 softtabstop=4

" Eff you trailing whitespace!!!
autocmd BufWritePre * :%s/\s\+$//e
