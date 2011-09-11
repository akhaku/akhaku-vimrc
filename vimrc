call pathogen#infect()

:set expandtab
:set ts=4
:set shiftwidth=4

:set nu "Line numbers

" Show row and column number
:set ruler

" Open up NERDTree on <C-n>
nmap <silent> <c-n> :NERDTreeToggle<CR>
autocmd FileType ruby,eruby setlocal omnifunc=syntaxcomplete#Complete

" Colors
colorscheme vividchalk

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Enable mouse selecting
set mouse=a

" Set up braces blinking
set showmatch
set mat=2

" Make sure syntax highlighting is enabled
syntax enable

" Setup commeting and uncommenting
vmap <F2> :s/^/# /<CR>
vmap <F4> :s/^# //<CR>

" Setup :make to run ./compile if it's a c or c++ program
autocmd FileType c,cpp setlocal makeprg=./compile

" For c or c++, set the width to 80 and highlight if it's over
autocmd FileType c,cpp setlocal textwidth=80
autocmd FileType c,cpp setlocal tw=80
autocmd FileType c,cpp highlight OverLength ctermbg=red ctermfg=white
autocmd FileType c,cpp match OverLength /\%81v.\+/
command Wmake :exec ":w | :make"
