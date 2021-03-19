call minpac#add('maximbaz/lightline-ale')
call minpac#add('tpope/vim-fugitive')

let g:lightline.component_expand = {
\   'linter_checking': 'lightline#ale#checking',
\   'linter_infos': 'lightline#ale#infos',
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\   'linter_ok': 'lightline#ale#ok',
\   'gitbranch': 'FugitiveHead',
\ }
let g:lightline.active = {
\   'left': [
\     ['mode', 'paste'],
\     ['gitbranch'],
\     ['filename', 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok'],
\   ],
\   'right': [['lineinfo'], ['percent'], ['filetype']]
\ }
let g:lightline#ale#indicator_checking = "..."
let g:lightline#ale#indicator_infos = "i:"
let g:lightline#ale#indicator_warnings = "w:"
let g:lightline#ale#indicator_errors = "e:"
let g:lightline#ale#indicator_ok = "ok"
