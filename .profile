export VISUAL=$(which vim)
export PS1='\[\033[1;36m\]\u\[\033[0m\]:\[\033[1;32m\]\W\[\033[0m\]\$ '
export PATH="$HOME/Library/Haskell/bin:$PATH"
[[ -n $TMUX ]] && PROMPT_COMMAND='tmux setenv -g TMUX_PATH "$PWD";tmux refresh-client -S;'
[[ -e $HOME/.bash_aliases ]] && source $HOME/.bash_aliases
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}
