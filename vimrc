" vimrc - Ondrej Sika, http://ondrejsika.com
""""""""""""""""""""""""""""""""""""""""""""
runtime! debian.vim

" Configurations
""""""""""""""""

syntax on
set wildmenu

" Tab settings
set tabstop=4 shiftwidth=4
set expandtab


" Search
set ignorecase
set incsearch
set hlsearch

" Copy (scrolling, mouse, scrolling)
set mouse=a
set number

" Trailing spaces
highlight _trailing_spaces ctermbg=red guibg=red
match _trailing_spaces /\s\+$/


" Mapping
"""""""""

" Search
map <c-f> /

" Copy (scrolling, mouse, scrolling)
map <c-n> :call _number_toggle() <lf>
map <c-b> :call _mouse_toggle() <lf>


" Trailing spaces
nmap <c-t> :call _remove_trailing_spaces() <lf>

" Insert tab
imap <c-t> <tab>

" Autocommands
""""""""""""""


" Functions
"""""""""""

function _remove_trailing_spaces()
    :%s/\s\+$//e
    echo "Trailing spaces removed"
endfunction

function _number_toggle()
    if &number == 0
        set number
   else
        set nonumber
    endif
endfunction

function _mouse_toggle()
    if &mouse == 'a'
        set mouse=
        echo "Mouse disabled"
   else
        set mouse=a
        echo "Mouse enabled"
    endif
endfunction


" ~/.vimrc
""""""""""

if filereadable("~/.vimrc")
    source ~/.vimrc
endif
