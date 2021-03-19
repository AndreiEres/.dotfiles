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
set splitbelow " Open new split panes to right and bottom, which feels more natural
set splitright
set tabstop=2 " softtabs, 2 spaces
set shiftwidth=2
set shiftround
set expandtab
set signcolumn=yes
set number " Numbers
set numberwidth=3
set nojoinspaces " Use one space, not two, after punctuation.
set list listchars=tab:>>,trail:·,nbsp:· " Display extra whitespace
set nocompatible
set termguicolors
set fillchars=vert:\│,eob:\  " Remove annoying `~` on signcolumn after buffer end
set inccommand=nosplit
set diffopt+=vertical
set clipboard^=unnamed,unnamedplus
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

filetype plugin indent on

syntax on
colorscheme onehalfdark

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

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

  autocmd TermOpen * setlocal nonumber norelativenumber

  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
augroup END

" All necessary mappings
let mapleader = " "
nnoremap <silent> <leader>/ :TComment<CR>
nnoremap <silent> <Leader>w :w<CR>
nnoremap <silent> <Leader>ц :w<CR>
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
noremap <leader>vi :tabe ~/.config/nvim/init.vim<CR>
noremap <leader>S :source ~/.config/nvim/init.vim<CR>:call minpac#update()<CR>
noremap <leader>nh :noh<CR>
noremap <leader>тр :noh<CR>
noremap <C-n> :noh<CR>
tnoremap <ESC> <C-\><C-n><C-w><C-p>
nnoremap <silent>K :ALEHover<CR>
nnoremap <leader>de :ALEDetail<CR>
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>
nnoremap <F2> :ALERename<CR>
nnoremap <F12> :ALEGoToDefinition<CR>
nnoremap <leader>re :ALEFindReferences<CR>
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"

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
noremap <leader>b :Buffers<CR>
noremap <leader>и :Buffers<CR>

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-T> :NERDTreeFind<CR>

packadd minpac
call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('airblade/vim-gitgutter')
call minpac#add('dense-analysis/ale')
call minpac#add('itchyny/lightline.vim')
call minpac#add('janko-m/vim-test')
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call minpac#add('junegunn/fzf.vim')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('maxmellon/vim-jsx-pretty')
call minpac#add('pangloss/vim-javascript')
call minpac#add('preservim/nerdtree')
call minpac#add('raimondi/delimitmate')
call minpac#add('shougo/deoplete.nvim')
call minpac#add('tomtom/tcomment_vim')
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-endwise')
call minpac#add('tpope/vim-rails')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('vim-ruby/vim-ruby')

call minpac#add('lifepillar/vim-solarized8')
call minpac#add('morhetz/gruvbox')
call minpac#add('sonph/onehalf', { 'subdir': 'vim' })
call minpac#add('rakr/vim-two-firewatch')

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in fzf for listing files. Lightning fast and respects .gitignore
  let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden --ignore .git -g ""'
  let $FZF_DEFAULT_OPTS    = '--layout=reverse'

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

let g:fzf_buffers_jump = 1
let g:fzf_preview_window = []
let g:fzf_layout = { 'window': { 'width': 0.5, 'height': 0.4, 'yoffset': 0.1, 'border': 'sharp' } }

let g:highlightedyank_highlight_duration = 200

let g:lightline = { 'colorscheme': 'onehalfdark' }

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver', 'tslint', 'eslint'],
\   'vue': ['eslint'],
\   'eruby': ['erb'],
\   'ruby': ['rubocop', 'solargraph'],
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
\   'pyls': { 'plugins': { 'pycodestyle': { 'enabled': v:false } } },
\ }
let g:ale_completion_autoimport = 1
let g:ale_completion_max_suggestions = 10
let g:ale_fix_on_save = 1
let g:ale_sign_error = "\u2022"
let g:ale_sign_warning = "\u2022"
let g:ale_list_window_size = 5
let g:ale_floating_preview = 1
let g:ale_floating_window_border = []
let g:ale_hover_cursor = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' > '

let g:deoplete#enable_at_startup = 1
set completeopt-=preview

let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '│'
let g:gitgutter_override_sign_column_highlight = 1

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
