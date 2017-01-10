" Plugins specific configurations

" Multi Cursor
"let g:multi_cursor_exit_from_visual_mode=0
"let g:multi_cursor_exit_from_insert_mode=0

" NERDTree
let NERDTreeShowHidden=1

" YCM
autocmd! User YouCompleteMe call youcompleteme#Enable()
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_max_diagnostics_to_display=1

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" NERDTree git
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

" vim-javascript
let g:javascript_plugin_jsdoc = 1

