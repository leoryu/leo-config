# My config

## preparation

```sh
sudo apt update
sudo apt upgrade
sudo apt install git zsh curl
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -s https://packagecloud.io/install/repositories/headmelted/codebuilds/script.deb.sh | sudo zsh
sudo apt update
sudo apt install neovim ctags make wget gcc g++ python3-pip code-oss
sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/aarch64-linux-gnu/libxcb.so.1.1.0
sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/aarch64-linux-gnu/libxcb.so.1
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | zsh
mkdir -p $NVM_DIR/versions/node 
pip3 install --user python-language-server
npm install -g --registry=https://registry.npm.taobao.org typescript typescript-language-server vscode-css-languageserver-bin bash-language-server
```

Also need: go, bingo

## init.vim

~/.config/nvim/init.vim

OR

~/.vimrc

```vim
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')
  
  "common
  Plug 'mhinz/vim-startify'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
  Plug 'scrooloose/nerdtree'
  map <C-h> :NERDTreeToggle<CR>
  let NERDTreeShowHidden = 1
  Plug 'majutsushi/tagbar'
  map <C-]> :TagbarToggle<CR>

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
  let g:lsp_signs_hint = {'text': '♪'}
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  highlight link LspErrorText GruvboxRedSign " requires gruvbox
  highlight clear LspWarningLine
  nnoremap gh :LspHover<CR>
  nnoremap gd :LspDefinition<CR>
  nnoremap <leader>s :LspDocumentSymbol<CR>
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
  if executable('bash-language-server')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'whitelist': ['sh'],
          \ })
  endif
  if executable('pyls')
      au User lsp_setup call lsp#register_server({
          \ 'name': 'pyls',
          \ 'cmd': {server_info->['pyls']},
          \ 'whitelist': ['python'],
          \ })
  endif

  "Markdown
  Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

  "HTML
  Plug 'mattn/emmet-vim'
  let g:user_emmet_install_global = 0
  autocmd FileType html,css EmmetInstall

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
  let g:go_metalinter_autosave_enabled=['golint', 'vet', 'gosec', 'gocyclo']
  let g:go_auto_type_info = 1
  let g:go_def_mapping_enabled = 0
 
call plug#end()

"common
syntax on
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
set list lcs=tab:\|\ 
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
let $VTE_VERSION = "100"
```

## zshrc

~/.zshrc

```sh
export TERM=xterm-256color

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/Workspace/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

```

## xinitrc

~/.xinitrc

```sh
sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY
LANG=zh_CN.UTF-8
echo $$ > /tmp/xsession.pid
export LANG
export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
scim -d
autocutsel -fork
. $HOME/.xsession
```

## VSCode settings

settings.json

```json
{
    "editor.detectIndentation": false,
    "editor.formatOnSave": true,
    "editor.lineNumbers": "relative",
    "[markdown]": {
        "editor.wordWrap": "on",
        "editor.quickSuggestions": true
    },
    "gitlens.advanced.messages": {
        "suppressSupportGitLensNotification": true
    },
    "vim.insertModeKeyBindingsNonRecursive": [
        {
            "before": [
                "j",
                "k"
            ],
            "after": [
                "<Esc>"
            ]
        }
    ],
    "vim.disableExtension": false,
    "vim.useSystemClipboard": true,
    "vim.enableNeovim": true,
    "vim.hlsearch": true,
    "vim.statusBarColorControl": true
}
```

## kodi.sh

```sh
#!/bin/bash

# Fix kodi BT speaker issue

while read a ; do echo ${a//audiodevice*audiodevice/audiodevice>ALSA:bluealsa<\/audiodevice} ; done < /home/pi/.kodi/userdata/guisettings.xml > /tmp/guisettings.xml.t ; mv /tmp/guisettings.xml{.t,}

mv /home/pi/.kodi/userdata/guisettings.xml /home/pi/.kodi/userdata/guisettings.xml.old

cp /tmp/guisettings.xml /home/pi/.kodi/userdata/guisettings.xml

if ! grep -q "defaults.bluealsa" /home/pi/.asoundrc

then

rm -rf /home/pi/.asoundrc
printf '\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.interface "hci0"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.device "7C:49:EB:DC:14:BE"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.profile "a2dp"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.delay 10000\n' >> /home/pi/.asoundrc

fi

kodi
```

Then

```sh
chmod a+x kodi.sh
sudo mv kodi.sh /usr/local/bin/
```
