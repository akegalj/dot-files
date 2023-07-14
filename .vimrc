set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
"
" original repos on github
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'sjl/badwolf'
" Plugin 'tomasr/molokai'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kana/vim-textobj-user'
" Plugin 'gilligan/vim-textobj-haskell'
" Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'sdiehl/vim-ormolu'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'rust-lang/rust.vim'
" Plugin 'vim-syntastic/syntastic'

" 
" Plugin 'dag/vim2hs'
" Plugin 'ujihisa/neco-ghc'
" Plugin 'eagletmt/ghcmod-vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'pbrisbin/html-template-syntax'
" Plugin 'kana/vim-textobj-user'
" Plugin 'kana/vim-textobj-indent'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'groenewege/vim-less'
" Plugin 'lordm/vim-browser-reload-linux'
" 
" Plugin 'kchmck/vim-coffee-script'
" "Bundle 'godlygeek/tabular'
" "Bundle 'sirver/ultisnips'
" 
" " Github repos of the user 'vim-scripts'
" " => can omit the username part
" "Bundle 'L9'
" "Bundle 'FuzzyFinder'

" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
filetype plugin indent on     " required!
syntax enable

" Tab specific option
set tabstop=4                   "A tab is 8 spaces
set expandtab                   "Always uses spaces instead of tabs
set softtabstop=4               "Insert 2 spaces when tab is pressed
set shiftwidth=4               "An indent is 2 spaces
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

" let g:ghc=system("which ghc") 
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:necoghc_enable_detailed_browse = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_auto_select = 0
" 
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#lock_buffer_name_pattern = '\*do\*'
" 
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"     return neocomplete#close_popup() . "\<CR>"
"     " For no inserting <CR> key.
"     "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction
" 
" " <TAB>: completion.
" "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" 
" inoremap <expr><C-e>  neocomplete#cancel_popup()
" 
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
" 
" let g:ctrlp_custom_ignore = '\v\.(o|hi|js|css)$'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" 
" function LessToCss()
"   let current_file = shellescape(expand('%:p'))
"   let filename = shellescape(expand('%:r'))
"   let filepath = "/home/akegalj/projects/visitcro/static/css/"
"   let command = "silent !lessc " . filepath . "style.less " . filepath . "style.css"
"   execute command
" endfunction
" autocmd BufWritePost,FileWritePost *.less call LessToCss() | ChromiumReload visitcro
" 
" let coffee_make_options = '--bare'
" autocmd QuickFixCmdPost * nested cwindow | ChromiumReload visitcro
" autocmd BufWritePost *.coffee silent make!
" autocmd BufWritePost *.html silent ChromiumReload visitcro
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" 
" set nocompatible " vi improved
" filetype off
" 
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
" 
" " let Vundle manage Vundle
" " required! 
" Plugin 'gmarik/vundle'
" 
" Plugin 'kien/ctrlp.vim'


"Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬
" set list

"Invisible character colors
" highlight NonText guifg=#d2d2d2
" highlight SpecialKey guifg=#d2d2d2

" allow backspacing over everything in insert mode
" set ts=2 sts=2 sw=2 expandtab
set backspace=indent,eol,start

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set mouse=a

colorscheme badwolf

" colorscheme zenburn

" syntax on
" filetype plugin indent on
set nohlsearch

" make line navigation ignore line wrap
nmap j gj
nmap k gk

let g:ctrlp_cmd = 'CtrlPMixed'
set wildignore+=*.pyc,*.pdf,*/env/*,*/js_build/*,*/build/*,*/node_modules/*,*/output/*,*/bower_components/* " ctrlp won't index pyc
set directory=$HOME/.vim/swapfiles//

set cursorline
set wildmenu
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
" let mapleader="," 
" http://dougblack.io/words/a-good-vimrc.html
"
au! BufNewFile,BufRead *.elm setf haskell
au! BufNewFile,BufRead *.purs setf haskell

" remove trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python,haskell autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

vnoremap <C-c> :w !xclip -i -sel c<CR><CR>
" noremap <C-v> :r !xclip -o -sel c<CR><CR>
au BufRead /tmp/mutt-* set tw=72

" rust
let g:rustfmt_autosave = 1

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

set nofixeol
set noeol
