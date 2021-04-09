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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

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

# `bundle exec`
function be() { bundle exec $* }

# `bundle exec rails`
function ber() { bundle exec rails $* }

# `make ...`
function m() { make $* }

# `docker ...`
function dc() { docker $* }

# `docker-compose ...`
function dcc() { docker-compose $* }

# `brew ...`
alias b=brew

# `vim ...`
alias v=/usr/local/Cellar/vim/8.2.0950/bin/vim

# `clear`
alias c=clear

# `exit`
alias e=exit

# `zathura --fork hoge.pdf` as `pdf hoge.pdf`
function pdf() { zathura --fork $1 }

# HSTR configuration - add this to ~/.bashrc
alias h=hstr
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor,raw-history-view
bindkey -s "\C-r" "hstr --\n"

# VPN client path
export PATH=/usr/local/vpnclient:$PATH

# configuration for R Markdown
export PATH=$PATH:/Applications/RStudio.app/Contents/MacOS/pandoc
function rmd2pdf() { R -q -e "rmarkdown::render('$1', output_format = 'pdf_document')" }

# github/hub
alias git=hub

# openssl pkg-config path
export PKG_CONFIG_PATH='/usr/local/opt/openssl/lib/pkgconfig'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arsley/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/arsley/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/arsley/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/arsley/.google-cloud-sdk/completion.zsh.inc'; fi

# temporary configurations on zeals
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# alias crystal
alias cr=crystal

# alias lucky
alias lu=lucky

# delete merged branches
function git-delm() {
  git branch --merged|egrep -v '\*|develop|master'|xargs git branch -d
}
