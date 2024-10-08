export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git asdf) # User configuration
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
export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit
autoload -U +X bashcompinit && bashcompinit

source $ZSH/oh-my-zsh.sh

# nice wildcards (negation is ^)
setopt extended_glob

# utils
# `docker ...`
function dc() { docker $* }

# `docker compose ...`
function dcc() { docker compose $* }

# HSTR configuration - add this to ~/.bashrc
alias h=hstr
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor,raw-history-view
bindkey -s "\C-r" "hstr --\n"

# openssl pkg-config path
export PKG_CONFIG_PATH='/usr/local/opt/openssl/lib/pkgconfig'

# delete merged branches
function delmerged() {
  git branch --merged|egrep -v '\*|develop|master'|xargs git branch -d
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/arsley/.google-cloud-sdk/path.zsh.inc' ]; then . '/Users/arsley/.google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/arsley/.google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/arsley/.google-cloud-sdk/completion.zsh.inc'; fi

# `kube ...`
alias kcl=kubectl
alias kcx=kubectx

# enable completation for terraform cmd
complete -o nospace -C /usr/local/bin/terraform terraform

# brew bundle location
export HOMEBREW_BUNDLE_FILE=$HOME/.brewfile

# direnv hook
eval "$(direnv hook zsh)"

# flutter SDK
export PATH="$HOME/.flutter/flutter/bin:$PATH"

# rust
. "$HOME/.cargo/env"
