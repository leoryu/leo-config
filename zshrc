# Workspace
export WORKSPACE=$HOME/Workspace

# Default editor
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

# Go
export GO111MODULE=on
export GOPROXY=https://goproxy.io
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
