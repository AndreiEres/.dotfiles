syntax on
" let g:srcery_underline = 0
" colorscheme srcery
colorscheme solarized8_high

set clipboard^=unnamed,unnamedplus

let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set incsearch     " do incremental searching
set ignorecase    " case insensitive searching
set smartcase     " case-sensitive if expresson contains a capital letter
set showmatch     " show matching braces
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set updatetime=100
set lazyredraw
set nocursorline
set ttyfast

set noshowmode
set mouse=a
set signcolumn=yes

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Numbers
set number
set numberwidth=4

" Use one space, not two, after punctuation.
set nojoinspaces

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_altv=1          " open splits to the right
let g:netrw_preview=1
let g:netrw_alto=0

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

filetype plugin indent on

if has('nvim')
  set inccommand=nosplit

  " always use vertical diffs
  set diffopt+=vertical
endif

if &compatible
  set nocompatible
end

if !has('gui_running')
  set t_Co=8 t_md=
  " set termguicolors
endif

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md        set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile *.tsx,*.jsx set filetype=typescript.tsx
augroup END

" All necessary mappings
nnoremap <leader><leader> <c-^>
nnoremap <silent> <leader>/ :TComment<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>ц :w<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <Leader>nt :tabnew<CR>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
imap jj <esc>
imap jk <esc>
imap kj <esc>
noremap <leader>vi :tabe ~/.vimrc<CR>
noremap <leader>S :source ~/.vimrc<CR>:call minpac#update()<CR>
noremap <leader>nh :noh<CR>
noremap <leader>тр :noh<CR>
tnoremap <ESC> <C-\><C-n><C-w><C-p>
nnoremap <silent>K :ALEHover<CR>
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
nnoremap <F2> :ALERename<CR>
nnoremap <F12> :ALEGoToDefinition<CR>
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" fzf mappings
noremap <leader>o :Files<CR>
noremap <leader>щ :Files<CR>
noremap <C-b> :Buffers<CR>
noremap <leader>и :Buffers<CR>

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>

packadd minpac
call minpac#init()
call minpac#add('airblade/vim-gitgutter')
call minpac#add('dense-analysis/ale')
call minpac#add('dyng/ctrlsf.vim')
call minpac#add('elixir-editors/vim-elixir')
call minpac#add('fatih/vim-go')
call minpac#add('itchyny/lightline.vim')
call minpac#add('janko-m/vim-test')
call minpac#add('raimondi/delimitmate')
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call minpac#add('junegunn/fzf.vim')
call minpac#add('justinmk/vim-sneak')
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('leafgarland/typescript-vim')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('maximbaz/lightline-ale')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('pangloss/vim-javascript')
call minpac#add('pbrisbin/vim-mkdir')
call minpac#add('shougo/deoplete.nvim')
call minpac#add('slim-template/vim-slim')
" call minpac#add('srcery-colors/srcery-vim')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-eunuch')
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('vim-ruby/vim-ruby')
call minpac#add('lifepillar/vim-solarized8')

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

let g:highlightedyank_highlight_duration = 200

let g:lightline = {
\   'colorscheme': 'solarized',
\ }
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
\   ]
\ }
let g:lightline#ale#indicator_checking = "..."
let g:lightline#ale#indicator_infos = "i:"
let g:lightline#ale#indicator_warnings = "w:"
let g:lightline#ale#indicator_errors = "e:"
let g:lightline#ale#indicator_ok = "ok"

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint', 'eslint'],
\   'vue': ['eslint'],
\   'eruby': ['erb'],
\   'ruby': ['rubocop'],
\   'python': ['flake8', 'pyls']
\ }
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'vue': ['prettier'],
\   'ruby': ['rubocop'],
\   'python': ['black', 'isort'],
\   'css': ['prettier'],
\   'html': ['prettier']
\ }
let g:ale_python_pyls_config = {
\   'pyls': {
\     'plugins': {
\       'pycodestyle': {
\         'enabled': v:false
\       }
\     }
\   },
\ }
let g:ale_completion_autoimport = 1
let g:ale_completion_max_suggestions = 10
let g:ale_fix_on_save = 1
let g:ale_sign_error = "\u2022"
let g:ale_sign_warning = "\u2022"
let g:ale_list_window_size = 5

let g:deoplete#enable_at_startup = 1
set completeopt-=preview

let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '│'
let g:gitgutter_override_sign_column_highlight = 1
