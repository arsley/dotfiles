# export ZSH=/Users/aoshi/.oh-my-zsh
export ZSH="/home/arsley/.oh-my-zsh"

# ZSH_THEME="robbyrussell"
ZSH_THEME="cloud"

plugins=(git)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
typeset -U path cdpath fpath manpath
# export MANPATH="/usr/local/man:$MANPATH"

typeset -T LD_LIBRARY_PATH ld_library_path; typeset -U ld_library_path
typeset -T LIBRARY_PATH library_path; typeset -U library_path
typeset -T CPATH cpath; typeset -U cpath

source $ZSH/oh-my-zsh.sh
# source $HOME/.bash_profile

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# rbenv
# eval "$(rbenv init -)"

#pyenv
# export PATH="$HOME/.pyenv/shims:$PATH"
# eval "$(pyenv init -)"

# nice wildcards (negation is ^)
setopt extended_glob

# utils
# mkdir + cd
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# TeX Clear
# function tec() { find . -type 'f' -d 1 | grep -v *.tex | xargs rm }

# OPAM configuration
# . /Users/aoshi/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
# eval `opam config env`

# `go build`
# function bo() { go build . }

# `bundle exec`
# function be() { bundle exec $* }

# `make ...`
# function mk() { make $* }
