export ZSH=/Users/aoshi/.oh-my-zsh
# export ZSH="/home/arsley/.oh-my-zsh"

ZSH_THEME="robbyrussell"
# ZSH_THEME="cloud"

plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
typeset -U path cdpath fpath manpath
export MANPATH="/usr/local/man:$MANPATH"

typeset -T LD_LIBRARY_PATH ld_library_path; typeset -U ld_library_path
typeset -T LIBRARY_PATH library_path; typeset -U library_path
typeset -T CPATH cpath; typeset -U cpath

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile

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

# rbenv
eval "$(rbenv init -)"

#pyenv
export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init -)"

# nice wildcards (negation is ^)
setopt extended_glob

# utils
# mkdir + cd
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# TeX Clear
function tec() { find . -type 'f' -d 1 | grep -v *.tex | xargs rm }

# OPAM configuration
. /Users/aoshi/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
eval `opam config env`

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

# `kubernetes-cli ...`
function kcl() { kubectl $* }
function kcx() { kubectx $* }
function kns() { kubens $* }

# added by travis gem
[ -f /Users/aoshi/.travis/travis.sh ] && source /Users/aoshi/.travis/travis.sh

# HSTR configuration - add this to ~/.bashrc
function h() { hstr }
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor,raw-history-view
bindkey -s "\C-r" "hstr --\n"

