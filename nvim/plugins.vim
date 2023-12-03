let shouldInstallPluginManager = 0

" auto-installation of vim-plug
if !filereadable($HOME . "/.local/share/nvim/site/autoload/plug.vim")
  echo "~≥ Installing vim-plug \n"
  silent !curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  le shouldInstallPluginManager = 1
endif

call plug#begin($HOME . "/.local/share/nvim/plugged")

" Colorscheme
Plug 'flazz/vim-colorschemes'

" Statusline/tabline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" GIT
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" EditorConfig
Plug 'editorconfig/editorconfig-vim'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" LSP client (autocomplete)
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

if shouldInstallPluginManager == 1
    echo "~> Installing plugs\n"
    :PlugInstall
endif
