" Generic settings

" Clipboard
set cb=unnamed

" Mouse
set mouse=a

" Initial indentation settings
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab
set modeline
set exrc
set hidden
set nu                      " display numbers
set showmatch
hi SpellBad guibg=#ff2929 ctermbg=124

" Always open NERDTree
" au VimEnter *  NERDTree

" Show tabs and spaces
set list
set listchars=tab:›\ ,eol:¬,trail:⋅
au FileType nerdtree set nolist

" XML
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" Highlight current line
set cursorline
hi CursorLine ctermbg=0  "8 = dark gray, 15 = white
hi Cursor ctermbg=15 ctermfg=8

" Colors
set t_Co=256              " Use 256 colors
set background=dark
colorscheme molokai
