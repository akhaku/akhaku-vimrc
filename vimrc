call pathogen#infect()

:set expandtab
:set ts=4
:set shiftwidth=4

:set nu "Line numbers

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

" Setup commeting and uncommenting
vmap <F2> :s/^/# /<CR>
vmap <F4> :s/^# //<CR>
