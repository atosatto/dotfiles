" Generic settings

" -------------------------------------------------------------------------------------------------
" Colors
" -------------------------------------------------------------------------------------------------

" Enable TrueColors
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Set the colorscheme 
set t_Co=256
set background=dark
colorscheme molokai

" -------------------------------------------------------------------------------------------------
" Editor
" -------------------------------------------------------------------------------------------------

" Clipboard
set cb=unnamed

" Enable mouse usage
set mouse=a

" File types detection
filetype on        " detect files types based on the extension
filetype plugin on " load plugins matching the filetype
filetype indent on " preserve filetype indentation

" Initial indentation settings
set expandtab    " insert spaces when tab is pressed
set tabstop=2    " number of spaces inserted when tab is pressed
set shiftwidth=2 " number of spaces to use for each auto indent

" Display line numbers
set nu

" Opening a new file when the current buffer has unsaved changes causes files
" to be hidden instead of closed
set hidden

" Always show signcolumns (e.g. breakpoints)
set signcolumn=yes

" Open split buffers below the active one
set splitbelow

" Show matching brackets
set showmatch

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Always open NERDTree
" au VimEnter *  NERDTree

" Show tabs and spaces
set list
set listchars=tab:›\ ,eol:¬,trail:⋅,extends:>,precedes:<  "sets chars representing "invisibles when `set list!` is called

" Highlight current line
set cursorline
hi CursorLine ctermbg=0  "8 = dark gray, 15 = white
hi Cursor ctermbg=15 ctermfg=8

" Highlight mispelled words
hi SpellBad guibg=#ff2929 ctermbg=124
