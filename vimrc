" akhaku-vimrc
" @author: akhaku (Ammar Khaku)
" Use at your own risk
" Report bugs to ammar.khaku@gmail.com

call pathogen#infect()

" Open file at last location
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

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
" Copy to system clipboard with Control-Y in visual mode
vmap <silent> <c-Y> "+y

" Map omnicomplete to contol-space
inoremap <C-space> <C-x><C-o>

"insert one character
noremap Q a<Space><Esc>r
noremap q i<Space><Esc>r

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

function! InitML()
  command! Wmake :exec ":w | :make"
  set textwidth=80
  set tw=80
  set wrap
  highlight OverLength ctermbg=red ctermfg=white
  match OverLength /\%81v.\+/ " For vim
  match ErrorMsg /\%81v.\+/ " For gvim
endfunction

function! InitHTML()
  setlocal omnifunc=htmlcomplete#CompleteTags
  setlocal ts=4
  setlocal shiftwidth=4
endfunction

function! InitCSS()
  setlocal omnifunc=csscomplete#CompleteCSS
endfunction

function! InitJS()
  setlocal omnifunc=javascriptcomplete#CompleteJS
endfunction

function! InitPython()
  setlocal omnifunc=pythoncomplete#Complete
endfunction


autocmd FileType c,cpp call InitC()
autocmd FileType sml call InitML()
autocmd FileType html call InitHTML()
autocmd FileType css call InitCSS()
autocmd FileType javascript call InitJS()
autocmd FileType python call InitPython()
set guifont=Monospace\ 9
