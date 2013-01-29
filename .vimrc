syntax enable
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set tabstop=2
set encoding=utf-8
set number
set backspace=2
set ignorecase
set smartcase

execute pathogen#infect()
filetype plugin on
set ft=html
filetype indent on
set si

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
autocmd FileType ruby,eruby colorscheme jellybeans
"improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold
"highlight PMenu gui=bold guibg=#CECECE guifg=#444444

nnoremap <C-j> <C-w>w
