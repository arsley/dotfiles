export PATH=/usr/local/var:$PATH

# node's (nodebrew) path
export PATH=/usr/local/var/nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
export NODE_PATH=/usr/local/var/nodebrew/node/$(node -v)/lib/node_modules/

# LaTeX path
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:$PATH
export MANPATH=/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH

export ANDROID_HOME=/usr/local/Caskroom/android-sdk/25.2.3
export JAVA_HOME=/Library/Java/Home

export PATH="$HOME/.pyenv/shims:$PATH"

# Go lang's paths
export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# to match .* file with '*' wildcard
# setopt -s dotglob

# postgresql base directory
export PGDATA=/usr/local/var/postgres
