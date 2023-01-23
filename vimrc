" akhaku-vimrc
" @author: akhaku (Ammar Khaku)
" Use at your own risk
" Report bugs to ammar.khaku@gmail.com

" Open file at last location
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Set up indenting
filetype indent on

" Use 2 spaces instead of tab
set expandtab
set ts=2
set shiftwidth=2

set nu " Line numbers
set scrolloff=8 " Don't touch bottom/top of screen by 8

set guioptions= " Hide all bars from gvim

" Highlight current line
if has("gui_running")
  set cul
  set lines=999 columns=9999
endif

" Show the 91st column
set cc=91
:hi ColorColumn guibg=#5F5F5F ctermbg=59


" Show row and column number
set ruler

" Open up NERDTree on <C-n>
nmap <silent> <c-n> :NERDTreeToggle<CR>
autocmd FileType ruby,eruby setlocal omnifunc=syntaxcomplete#Complete

" Colors
colorscheme vividchalk

" Get out of insert mode easy
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <c-[> <nop>

" Improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

" Enable mouse selecting
set mouse=a

" Highlight the word you're searching for
set hlsearch

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

function! InitJava()
  set wildignore+=*/jaxws/**,*.swp
  set ts=4
  set shiftwidth=4
  syntax clear javaError
  syntax match javaError "+<<<\|=>\|||=\|&&=\|\*\/+"
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
  setlocal ts=2
  setlocal shiftwidth=2
endfunction

function! InitCSS()
  setlocal omnifunc=csscomplete#CompleteCSS
endfunction

function! InitJS()
  setlocal ts=2
  setlocal shiftwidth=2
  setlocal omnifunc=javascriptcomplete#CompleteJS
endfunction

function! InitPython()
  setlocal ts=2
  setlocal shiftwidth=2
  "setlocal omnifunc=pythoncomplete#Complete
endfunction

function! InitLaTex()
    command! Wmake : ":w | !pdflatex % && evince $(basename % .tex).pdf"
endfunction


autocmd FileType c,cpp call InitC()
autocmd FileType sml call InitML()
autocmd FileType html call InitHTML()
autocmd FileType css call InitCSS()
autocmd FileType javascript,json call InitJS()
autocmd FileType python call InitPython()
autocmd FileType tex call InitLaTex()
autocmd FileType java call InitJava()
set guifont=Monospace\ 8

" Some vim-gitgutter options
let g:gitgutter_max_signs=5000

" disable auto-commenting
set comments-=://

" set up fzf
nnoremap <Leader>t :GFiles<CR>

" Fix colorscheme and gitgutter
highlight clear SignColumn
highlight GitGutterAdd guibg=Black
highlight GitGutterChange guibg=Black
highlight GitGutterDelete guibg=Black
highlight GitGutterChangeDelete guibg=Black

