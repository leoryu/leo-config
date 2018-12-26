# My config

## preparation

```sh
sudo apt update
sudo apt upgrade
sudo apt install git zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo apt install neovim ctags make
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Also need: nodejs(nvm), go, bingo

## init.vim

~/.config/nvim/init.vim OR
~/.vimrc

```vim
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')
  
  "common
  Plug 'morhetz/gruvbox'
  Plug 'scrooloose/nerdtree'
  map <C-h> :NERDTreeToggle<CR>
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  let NERDTreeShowHidden = 1
  Plug 'majutsushi/tagbar'
  map <C-]> :TagbarToggle<CR>
  Plug 'itchyny/lightline.vim'
  set laststatus=2
  if !has('gui_running')
    set t_Co=256
  endif

  "vim-lsp
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  let g:asyncomplete_remove_duplicates = 1
  let g:asyncomplete_smart_completion = 1
  let g:asyncomplete_auto_popup = 1
  let g:lsp_signs_enabled = 1
  let g:lsp_diagnostics_echo_cursor = 1
  let g:lsp_signs_error = {'text': '✗'}
  let g:lsp_signs_warning = {'text': '‼'}
  let g:lsp_signs_hint = {'text': '✭'}
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  highlight link LspErrorText GruvboxRedSign " requires gruvbox
  highlight clear LspWarningLine
  nnoremap H :LspHover<CR>
  nnoremap <leader>s :LspDocumentSymbol<CR>
  nnoremap <leader>ld :LspDefinition<CR>
  nnoremap <leader>lr :LspReferences<CR>
  nnoremap <leader>lim :LspImplementation<CR>
  nnoremap <leader>lrn :LspRename<CR>
  nnoremap <leader>lws :LspWorkspaceSymbol<CR>
  nnoremap <leader><leader>] :LspNextError<CR>
  nnoremap <leader><leader>[ :LspPreviousError<CR>
  autocmd BufWritePre <buffer> LspDocumentFormatSync
  if executable('bingo')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'bingo',
          \ 'cmd': {server_info->['bingo', '-mode', 'stdio']},
          \ 'whitelist': ['go'],
          \ })
  endif
  if executable('typescript-language-server')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'typescript-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
          \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
          \ 'whitelist': ['typescript', 'javascript', 'javascript.jsx'],
          \ })
  endif
  if executable('css-languageserver')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'css-languageserver',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
          \ 'whitelist': ['css', 'less', 'sass'],
          \ })
  endif

  "Markdown
  Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

  "TS
  Plug 'HerringtonDarkholme/yats.vim'

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
  let g:go_metalinter_enabled = ['golint', 'vet', 'errcheck', 'deadcode', 'maligned', 'gosec', 'dupl', 'gocyclo']
  let g:go_metalinter_autosave = 1
  let g:go_metalinter_autosave_enabled=['golint', 'vet', 'errcheck', 'deadcode', 'maligned']
  let g:go_auto_type_info = 1
  let g:go_def_mapping_enabled = 0
 
call plug#end()

"common
colorscheme gruvbox
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
imap jk <Esc>
set wildmenu
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
export GOPATH=$HOME/Workspace/go
export PATH=$PATH:$GOPATH/bin

```

