# My vimrc
~/.vimrc
```vim
call plug#begin('~/.vim/plugged')

"common
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim'

"ncm2
if has('nvim')
  Plug 'roxma/nvim-yarp'
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'fgrsnau/ncm-otherbuf'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'filipekiss/ncm2-look.vim'

"Go
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'ncm2/ncm2-go'

"TS
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ncm2/nvim-typescript', {'do': './install.sh'}

"Python
Plug 'ncm2/ncm2-jedi'

call plug#end()

"common
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
imap jk <Esc>
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set nocompatible

"ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
"ncm2-look
let g:ncm2_look_enabled = 1

"gruvbox
colorscheme gruvbox
set background=dark

"lightline.vim
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif

"nerdtree
map <C-h> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

"tagbar
map <C-]> :TagbarToggle<CR>

"Go
"vim-go
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode', 'maligned', 'gosec', 'dupl', 'gocyclo']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled=['vet', 'golint', 'gocyclo', 'dupl', 'deadcode', 'maligned']
let g:go_auto_type_info = 1
```
