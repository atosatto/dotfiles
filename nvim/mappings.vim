" All Mappings

" Remap leader
let mapleader = ","

" Map è + to square brackets
nmap è [
nmap + ]
omap é [
omap + ]
xmap è [
xmap + ]

" NERDTree
map <Leader>n :NERDTreeToggle<cr>

" YCM Go to definition
nnoremap <Leader>jd :YcmCompleter GoTo <cr>

" Neomake cheker run
map ]n :Neomake<cr>

" Generate ctags
map ]gt :call atags#generate()<cr>

" FZF
map <Leader>f :FZF<cr>
map <Leader>t :Tags<cr>
map <Leader>b :Buffers<cr>

" Exit highlight mode
map <ESC><ESC> :nohl<cr>

" Buffers and tabs
map ]b :bn<cr>
map [b :bp<cr>
map gb :bn<cr>
map bd :bd<cr>

map ]t :tabnext<cr>
map [t :tabprevious<cr>

" Annotate
map ]a :Gblame<cr>

" Lnext/Lprev
map ]l :lnext<cr>
map [l :lprev<cr>

map <C><RightMouse> :pta <cword><cr>
