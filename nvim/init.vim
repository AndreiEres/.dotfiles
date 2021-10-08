call plug#begin()
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
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

set termguicolors

let g:gruvbox_invert_selection = 0
let g:gruvbox_sign_column='bg0'
colorscheme gruvbox

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

autocmd TermOpen * setlocal nonumber norelativenumber

if !exists('g:vscode')
lua << EOF
require('gitsigns').setup()

-- Setup nvim-cmp.
local cmp = require'cmp'
cmp.setup({
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }
})
-- Setup lspconfig.
-- require('lspconfig')[%YOUR_LSP_SERVER%].setup {
--   capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- }
EOF
endif
