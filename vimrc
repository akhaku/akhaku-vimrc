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

" Set the width to 80 and highlight if it's over
set textwidth=80
set tw=80
set wrap
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%81v.\+/
command Wmake :exec ":w | :make"

"insert one character
noremap Q a<Space><Esc>r
noremap q i<Space><Esc>r
