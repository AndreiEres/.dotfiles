call plug#begin()
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'maxmellon/vim-jsx-pretty'
Plug 'ibhagwan/fzf-lua'
Plug 'raimondi/delimitmate'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'vim-test/vim-test'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
call plug#end()

set ignorecase
set smartcase
set mouse=a
set number
set clipboard^=unnamed,unnamedplus
set completeopt=menu,menuone,noselect
set tabstop=2
set shiftwidth=2
set expandtab
set noswapfile
set signcolumn=yes:1
set pumheight=10
set splitbelow
set splitright
filetype plugin on

let mapleader = " "
noremap <leader>nh :noh<CR>

augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}
augroup END

if !exists('g:vscode')
set termguicolors
colorscheme code

autocmd TermOpen * setlocal nonumber norelativenumber

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

nnoremap <silent> <Leader>w :w<CR>
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
noremap <leader>S :source ~/.config/nvim/init.vim<CR>
tnoremap <ESC> <C-\><C-n><C-w><C-p>
nnoremap <leader><leader> :b#<CR>

nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>

command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')
inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>a :CocAction<CR>
nmap <leader>or :OR<CR>
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> [r <Plug>(coc-diagnostic-prev)
nmap <silent> ]r <Plug>(coc-diagnostic-next)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>

command SynID echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')

lua << EOF
require'gitsigns'.setup()
EOF
endif
