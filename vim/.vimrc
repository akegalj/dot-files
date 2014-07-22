set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'

Bundle 'dag/vim2hs'
Bundle 'ujihisa/neco-ghc'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'pbrisbin/html-template-syntax'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-indent'
Bundle 'Shougo/neocomplete.vim'
Bundle 'groenewege/vim-less'
Bundle 'lordm/vim-browser-reload-linux'

Bundle 'kchmck/vim-coffee-script'
"Bundle 'godlygeek/tabular'
"Bundle 'sirver/ultisnips'

" Github repos of the user 'vim-scripts'
" => can omit the username part
"Bundle 'L9'
"Bundle 'FuzzyFinder'

syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized
filetype plugin indent on     " required!

" Tab specific option
set tabstop=8                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=2               "Insert 2 spaces when tab is pressed
set shiftwidth=2               "An indent is 2 spaces
set smarttab                    "Indent instead of tab at start of line
set shiftround                  "Round spaces to nearest shiftwidth multiple
set nojoinspaces                "Don't convert spaces to tabs
set nu
set ignorecase
set smartcase
set autoindent
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-w> <C-w>w

let g:ghc=system("which ghc") 
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:necoghc_enable_detailed_browse = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_select = 0

let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*do\*'

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-e>  neocomplete#cancel_popup()

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:ctrlp_custom_ignore = '\v\.(o|hi|js|css)$'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0

function LessToCss()
  let current_file = shellescape(expand('%:p'))
  let filename = shellescape(expand('%:r'))
  let filepath = "/home/akegalj/projects/visitcro/static/css/"
  let command = "silent !lessc " . filepath . "style.less " . filepath . "style.css"
  execute command
endfunction
autocmd BufWritePost,FileWritePost *.less call LessToCss() | ChromiumReload visitcro

let coffee_make_options = '--bare'
autocmd QuickFixCmdPost * nested cwindow | ChromiumReload visitcro
autocmd BufWritePost *.coffee silent make!
autocmd BufWritePost *.html silent ChromiumReload visitcro
