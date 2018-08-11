#!/bin/bash
vim="$(command -v vim)"
export VISUAL=$vim
export PS1='\[\033[1;36m\]\u\[\033[0m\]:\[\033[1;32m\]\W\[\033[0m\]\$ '
export PATH="$HOME/Library/Haskell/bin:$PATH"
DYLD_LIBRARY_PATH="$(rustc --print sysroot)/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH
[[ -n $TMUX ]] && PROMPT_COMMAND='tmux setenv -g TMUX_PATH "$PWD";tmux refresh-client -S;'
# shellcheck source=/dev/null
[[ -e $HOME/.bash_aliases ]] && source "$HOME/.bash_aliases"
vman() {
  if ! vim -c "SuperMan $*"; then
    echo "No manual entry for $*"
  fi
}

export PATH="$HOME/.cargo/bin:$PATH"
