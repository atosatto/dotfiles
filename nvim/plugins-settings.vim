" Plugins specific configurations

" -------------------------------------------------------------------------------------------------
" Multi Cursor
" -------------------------------------------------------------------------------------------------

"let g:multi_cursor_exit_from_visual_mode=0
"let g:multi_cursor_exit_from_insert_mode=0

" -------------------------------------------------------------------------------------------------
" NERDTree
" -------------------------------------------------------------------------------------------------

let NERDTreeShowHidden=1

" -------------------------------------------------------------------------------------------------
" NERDCommenter
" -------------------------------------------------------------------------------------------------

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
" automatically remove deleted files from the buffer
let NERDTreeAutoDeleteBuffer = 1

" -------------------------------------------------------------------------------------------------
" NERDTree git
" -------------------------------------------------------------------------------------------------

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" -------------------------------------------------------------------------------------------------
" vim-go
" -------------------------------------------------------------------------------------------------

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" -------------------------------------------------------------------------------------------------
" lightline.vim
" -------------------------------------------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

" -------------------------------------------------------------------------------------------------
" editorconfig-vim
" -------------------------------------------------------------------------------------------------

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" -------------------------------------------------------------------------------------------------
" 
" -------------------------------------------------------------------------------------------------

let g:coc_global_extensions = [
  \ 'coc-emoji', 'coc-prettier',
  \ 'coc-json', 'coc-yaml', 'coc-python'
  \ ]
