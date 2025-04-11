export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git asdf)
path=(
  "/usr/local/var"
  "/usr/local/sbin"
  "/usr/local/bin"
  "/usr/bin"
  "/bin"
  "/usr/sbin"
  "/sbin"
)
typeset -U path cdpath fpath manpath
export MANPATH="/usr/local/man:$MANPATH"

typeset -T LD_LIBRARY_PATH ld_library_path; typeset -U ld_library_path
typeset -T LIBRARY_PATH library_path; typeset -U library_path
typeset -T CPATH cpath; typeset -U cpath

setopt append_history
setopt share_history

# about completion
fpath=(/usr/local/share/zsh/site-functions $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit
autoload -U +X bashcompinit && bashcompinit

source $ZSH/oh-my-zsh.sh

# nice wildcards (negation is ^)
setopt extended_glob

# HSTR configuration
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
export HSTR_TIOCSTI=y

# openssl pkg-config path
export PKG_CONFIG_PATH='/usr/local/opt/openssl/lib/pkgconfig'

# delete merged branches
function delmerged() {
  git branch --merged|egrep -v '\*|develop|master|main'|xargs git branch -d
}

# brew bundle location
export HOMEBREW_BUNDLE_FILE=$HOME/.brewfile

# set default permissions
umask 022
