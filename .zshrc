export ZSH=$HOME/.oh-my-zsh

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

# nice wildcards (negation is ^)
setopt extended_glob

# utils

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
alias v=vim

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

# Flutter PATH
export PATH=$PATH:/usr/local/flutter/bin

# added by travis gem
[ -f /Users/arsley/.travis/travis.sh ] && source /Users/arsley/.travis/travis.sh

# configuration for R Markdown
export PATH=$PATH:/Applications/RStudio.app/Contents/MacOS/pandoc
function rmd2pdf() { R -q -e "rmarkdown::render('$1', output_format = 'pdf_document')" }

# github/hub
alias git=hub

# asdf configuration
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arsley/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/arsley/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/arsley/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/arsley/.google-cloud-sdk/completion.zsh.inc'; fi

# temporary configurations on zeals
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
