export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git asdf)

# User configuration
export PATH="/usr/local/var:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
typeset -U path cdpath fpath manpath
export MANPATH="/usr/local/man:$MANPATH"

typeset -T LD_LIBRARY_PATH ld_library_path; typeset -U ld_library_path
typeset -T LIBRARY_PATH library_path; typeset -U library_path
typeset -T CPATH cpath; typeset -U cpath

setopt append_history
setopt share_history

# about completion
fpath=(/usr/local/share/zsh/site-functions $fpath)

# asdf completion
fpath=(${ASDF_DIR}/completions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit
autoload -U +X bashcompinit && bashcompinit

source $ZSH/oh-my-zsh.sh

# add vi extension for zsh
bindkey -v
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
bindkey '^x' vi-cmd-mode

# nice wildcards (negation is ^)
setopt extended_glob

# utils

# Go lang's paths
export GOPATH=$HOME/.go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GO111MODULE=on

# `go build`
function bo() { go build . }

# `bundle ...`
alias b=bundle

# `bundle exec`
function be() { bundle exec $* }

# `bundle exec rails`
function ber() { bundle exec rails $* }

# `bundle exec rspec`
function bers() { bundle exec rspec $* }

# `make ...`
function m() { make $* }

# `docker ...`
function dc() { docker $* }

# `docker compose ...`
function dcc() { docker compose $* }

# `vim ...`
alias v=/usr/local/bin/vim

# `clear`
alias c=clear

# `exit`
alias e=exit

# HSTR configuration - add this to ~/.bashrc
alias h=hstr
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor,raw-history-view
bindkey -s "\C-r" "hstr --\n"

# openssl pkg-config path
export PKG_CONFIG_PATH='/usr/local/opt/openssl/lib/pkgconfig'

# delete merged branches
function git-delm() {
  git branch --merged|egrep -v '\*|develop|master'|xargs git branch -d
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arsley/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/arsley/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/arsley/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/arsley/.google-cloud-sdk/completion.zsh.inc'; fi

# `kube ...`
alias kcl=kubectl
alias kcx=kubectx

# alias just
alias j=just

# enable completation for terraform cmd
complete -o nospace -C /usr/local/bin/terraform terraform

# enable brew-file wrapper
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi
