call plug#begin()
Plug 'sonph/onehalf', {'rtp': 'vim/'}
call plug#end()

set ignorecase
set smartcase
set mouse=a
set number
set clipboard^=unnamed,unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab

colorscheme onehalfdark

let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

let mapleader = " "
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
noremap <leader>nh :noh<CR>
tnoremap <ESC> <C-\><C-n><C-w><C-p>
nnoremap <leader><leader> :b#<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=200}
augroup END
