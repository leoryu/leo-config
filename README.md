# My config

## preparation

```sh
sudo apt update
sudo apt upgrade
sudo apt install git zsh curl autocutsel fonts-droid-fallback fonts-noto-cjk scim-pinyin fonts-arphic-ukai libasound2 neovim gcc
sudo apt remove fonts-arphic-ukai fonts-arphic-uming
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -s https://packagecloud.io/install/repositories/headmelted/codebuilds/script.deb.sh | sudo bash
# sudo apt update
# sudo apt install  code-oss
# sudo cp /usr/lib/aarch64-linux-gnu/libxcb.so.1 /usr/lib/aarch64-linux-gnu/libxcb.so.1.bak
# sudo sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/aarch64-linux-gnu/libxcb.so.1
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | zsh
npm install -g --registry=https://registry.npm.taobao.org yarn
npm config set registry=https://registry.npm.taobao.org
yarn config set registry https://registry.npm.taobao.org
```

## init.vim

~/.config/nvim/init.vim

OR

~/.vimrc

```vim
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')
  
  "common
  Plug 'jiangmiao/auto-pairs'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  let g:airline#extensions#tabline#enabled = 1
  Plug 'scrooloose/nerdtree'
  map <C-h> :NERDTreeToggle<CR>
  let NERDTreeShowHidden = 1
  Plug 'majutsushi/tagbar'
  map <C-]> :TagbarToggle<CR>

  "Coc
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

  "Markdown
  Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

  "TS
  Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

"common
"set list lcs=tab:\|\ 
syntax on
colorscheme gruvbox
imap jk <Esc>
set noshowmode
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

"Coc
" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
"set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
"set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }



" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
```

## zshrc

~/.zshrc

```sh
export TERM=xterm-256color

# Webpack
export CHOKIDAR_USEPOLLING=true

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/Workspace/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

```

## xinitrc

~/.xinitrc

```sh
# sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# XAUTHORITY=$HOME/.Xauthority
# export XAUTHORITY
# echo $$ > /tmp/xsession.pid
# export LANG=zh_CN.UTF-8
# export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
scim -d
autocutsel -fork
# . $HOME/.xsession
```

## VSCode settings

settings.json

```json
{
    "terminal.integrated.rendererType": "dom",
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
    "vim.neovimPath": "/usr/bin/nvim",
    "vim.disableExtension": false,
    "vim.enableNeovim": true,
    "vim.hlsearch": true,
    "vim.statusBarColorControl": true,
    "keyboard.dispatch": "keyCode"
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

## ~/.gitconfig

```gitconfig
[user]
	name = leo
	email = leo-ryu@outlook.com
[core]
	editor = nvim
[merge]
	tool = vimdiff
[mergetool]
	prompt = true
[mergetool "vimdiff"]
	cmd = nvim -d $LOCAL $REMOTE $MERGED -c '$wincmd w' -c 'wincmd J'
[difftool]
	prompt = false
[diff]
	tool = vimdiff
```
