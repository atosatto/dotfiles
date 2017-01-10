let shouldInstallPluginManager = 0

" auto-installation of vim-plug
if !filereadable($HOME . "/.local/share/nvim/site/autoload/plug.vim")
  echo "~≥ Installing vim-plug \n"
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  le shouldInstallPluginManager = 1
endif

" post installation hooks
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer
    endif
endfunction

call plug#begin($HOME . "/.local/share/nvim/plugged")

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorscheme
Plug 'flazz/vim-colorschemes'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" GIT
Plug 'tpope/vim-fugitive'

" AutoComplete
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Syntax Highlighting
Plug 'mattn/emmet-vim', { 'for': 'html' }
Plug 'shime/vim-livedown', { 'for': 'markdown' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'pearofducks/ansible-vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx', 'javascript']}

call plug#end()

if shouldInstallPluginManager == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif
