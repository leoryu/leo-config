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

  let g:ale_completion_enabled = 1
  Plug 'w0rp/ale'
  let g:ale_set_balloons = 1
  let g:ale_linters = {
  \		'go': ['golangserver', 'gometalinter', 'gofmt'],
  \		'typescript': ['tsserver', 'prettier'],
  \		'javascript': ['prettier'],
  \}
  let g:ale_linters_explicit = 1
  let g:ale_fix_on_save = 1

  let g:ale_go_gometalinter_options = '--disable-all --enable=errcheck --enable=vet --enable=golint'
  nnoremap <leader>d :ALEGoToDefinition<CR>
  nnoremap H :ALEHover<CR>
  nnoremap <leader>r :ALEFindReferences<CR>
  nnoremap <leader>ss :ALESymbolSearch<CR>

  Plug 'majutsushi/tagbar'
  map <C-]> :TagbarToggle<CR>

  Plug 'itchyny/lightline.vim'
  set laststatus=2
  if !has('gui_running')
    set t_Co=256
  endif

  "Go
  Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
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
  let g:go_metalinter_autosave_enabled=['gocyclo', 'dupl', 'deadcode', 'maligned']
  let g:go_auto_type_info = 1
  let g:go_def_mapping_enabled = 0

  "TS
  Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

"common
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
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

```
## zshrc

~/.zshrc

```sh
# lightline.vim
export TERM=xterm-256color

# Go
export PATH="$PATH:$HOME/go/bin"
```
