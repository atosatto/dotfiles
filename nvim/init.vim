" vim-plug
" reload .vimrc and :PlugInstall to install plugins
call plug#begin('~/.local/share/nvim/plugged')

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NERDTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Vim Go
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Ansible
Plug 'pearofducks/ansible-vim'

call plug#end()
