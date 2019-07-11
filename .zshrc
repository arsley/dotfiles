export ZSH=/Users/arsley/.oh-my-zsh

ZSH_THEME="robbyrussell"
# ZSH_THEME="cloud"

plugins=(git)

# User configuration

export PATH="/usr/local/var:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
typeset -U path cdpath fpath manpath
export MANPATH="/usr/local/man:$MANPATH"

typeset -T LD_LIBRARY_PATH ld_library_path; typeset -U ld_library_path
typeset -T LIBRARY_PATH library_path; typeset -U library_path
typeset -T CPATH cpath; typeset -U cpath

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

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv
eval "$(rbenv init -)"

# pyenv
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"

# nice wildcards (negation is ^)
setopt extended_glob

# utils
# mkdir + cd
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# TeX Clear
function tec() { find . -type 'f' -d 1 | grep -v *.tex | xargs rm }

# Go lang's paths
export GOPATH=$HOME/.go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# `go build`
function bo() { go build . }

# `bundle exec`
function be() { bundle exec $* }

# `make ...`
function m() { make $* }

# `docker ...`
function dc() { docker $* }

# `docker-compose ...`
function dcc() { docker-compose $* }

# `brew ...`
alias b=brew

# `vim ...`
alias v=vim

# `clear`
alias c=clear

# `exit`
alias e=exit

# HSTR configuration - add this to ~/.bashrc
alias h=hstr
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor,raw-history-view
bindkey -s "\C-r" "hstr --\n"

# VPN client path
export PATH=/usr/local/vpnclient:$PATH

# Mono (C# environment path)
export PATH=$PATH:/Library/Frameworks/Mono.framework/Versions/Current/bin

# Flutter PATH
export PATH=$PATH:/usr/local/flutter/bin

# added by travis gem
[ -f /Users/arsley/.travis/travis.sh ] && source /Users/arsley/.travis/travis.sh

# configuration for R Markdown
export PATH=$PATH:/Applications/RStudio.app/Contents/MacOS/pandoc
function rmd2pdf() { R -q -e "rmarkdown::render('$1', output_format = 'pdf_document')" }

