# My config

## preparation

```sh
cd
sudo pacman -Syu
sudo pacman -S git zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo pacman -S neovim python python-neovim ctags words make go nodejs npm
mkdir -p go/src go/bin go/pkg .config/nvim
sudo npm install -g typescript
sudo npm install -g @angular/cli
sudo npm install -g neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## init.vim

~/.config/nvim/init.vim

```vim
call plug#begin('~/.local/share/nvim/plugged')

  "common
  Plug 'morhetz/gruvbox'
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
  Plug 'scrooloose/nerdtree'
  map <C-h> :NERDTreeToggle<CR>
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  let NERDTreeShowHidden=1
  Plug 'vim-syntastic/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  Plug 'majutsushi/tagbar'
  map <C-]> :TagbarToggle<CR>

  Plug 'itchyny/lightline.vim'
  set laststatus=2
  if !has('gui_running')
    set t_Co=256
  endif

  "ncm2
  Plug 'roxma/nvim-yarp'
  Plug 'ncm2/ncm2'
  autocmd BufEnter * call ncm2#enable_for_buffer()
  set completeopt=noinsert,menuone,noselect
  set shortmess+=c
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

  Plug 'ncm2/ncm2-bufword'
  Plug 'fgrsnau/ncm-otherbuf', { 'branch': 'ncm2' }
  Plug 'ncm2/ncm2-path'
  Plug 'ncm2/ncm2-cssomni'
  Plug 'ncm2/ncm2-html-subscope'
  Plug 'ncm2/ncm2-markdown-subscope'
  Plug 'filipekiss/ncm2-look.vim'

  "Go
  Plug 'ncm2/ncm2-go'
  Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
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

  "TS
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

  "Python
  Plug 'ncm2/ncm2-jedi'

call plug#end()

"common
colorscheme gruvbox
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
imap jk <Esc>
set wildmode=longest:full,full
set number
set relativenumber
set background=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set nocompatible
```
## zshrc

~/.zshrc

```sh
# lightline.vim
export TERM=xterm-256color

# Go
export PATH="$PATH:$HOME/go/bin"
```
