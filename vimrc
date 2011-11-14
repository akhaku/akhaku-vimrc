call pathogen#infect()

"Set up indenting
filetype indent on

:set expandtab
:set ts=4
:set shiftwidth=4

:set nu "Line numbers

let g:clipbrdDefaultReg = '+'

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

" Set the width to 80 and highlight if it's over
function! InitC()
 setlocal makeprg=./compile
  set textwidth=80
  set tw=80
  set wrap
  highlight OverLength ctermbg=red ctermfg=white
  match ErrorMsg '\%>80v.\+'
  match OverLength /\%81v.\+/
  command Wmake :exec ":w | :make"
endfunction

autocmd FileType c,cpp call InitC()

"insert one character
noremap Q a<Space><Esc>r
noremap q i<Space><Esc>r

function! InitHTML()
  setlocal omnifunc=htmlcomplete#CompleteTags
  setlocal completefunc=htmlcomplete#CompleteTags
  setlocal ts=4
  setlocal shiftwidth=4
endfunction

" Html and others
autocmd FileType html call InitHTML()
