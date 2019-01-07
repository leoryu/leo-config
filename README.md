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
mkdir -p $NVM_DIR/versions/node 
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | zsh
pip3 install --user python-language-server
npm install -g --registry=https://registry.npm.taobao.org typescript typescript-language-server vscode-css-languageserver-bin bash-language-server
```

Also need: go, bingo

## init.vim

~/.config/nvim/init.vim

OR

~/.vimrc

## zshrc

~/.zshrc

## xinitrc

~/.xinitrc

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

