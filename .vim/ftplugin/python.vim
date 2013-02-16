map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
map <buffer> <S-c> :w<CR>:!/usr/bin/pylint -r n % <CR>

source ~/.vim/ftplugin/pylint.vim


set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

set foldmethod=indent
set foldnestmax=2
set hlsearch

au FileType python set omnifunc=pythoncomplete#Complete
