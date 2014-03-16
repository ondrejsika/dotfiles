runtime! debian.vim

syntax on

set tabstop=4 shiftwidth=4
set expandtab

set number

set ignorecase
set incsearch
set hlsearch

set wildmenu

set cursorline

set mouse=a

function _number_toggle()
    if &number == 0
        set number
   else
        set nonumber
    endif
endfunction

map <c-n> :call _number_toggle() <lf>

function _mouse_toggle()
    if &mouse == 'a'
        set mouse=
        echo "Mouse disabled"
   else
        set mouse=a
        echo "Mouse enabled"
    endif
endfunction

map <c-m> :call _mouse_toggle() <lf>

map <c-f> /

autocmd BufWritePre * :%s/\s\+$//e

if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

