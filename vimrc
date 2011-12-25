" akhaku-vimrc
" @author: akhaku (Ammar Khaku)
" Use at your own risk
" Report bugs to ammar.khaku@gmail.com

call pathogen#infect()

" Set up indenting
filetype indent on

" Use 4 spaces instead of tab
:set expandtab
:set ts=4
:set shiftwidth=4

:set nu " Line numbers

:set guioptions-=m " Hide menubar from gvim

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

" Setup commeting and uncommenting (uses # for commenting)
vmap <F2> :s/^/# /<CR>
vmap <F4> :s/^# //<CR>

" Paste from system clipboard with Control-P
nmap <silent> <c-P> "+p

function! InitC()
  " Run ./compile on the command :Wmake
  setlocal makeprg=./compile
  command! Wmake :exec ":w | :make"
  set textwidth=80
  set tw=80
  set wrap
  highlight OverLength ctermbg=red ctermfg=white
  match OverLength /\%81v.\+/ " For vim
  match ErrorMsg /\%81v.\+/ " For gvim
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

" Html
autocmd FileType html call InitHTML()
set guifont=Monospace\ 9
