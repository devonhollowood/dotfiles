export VISUAL='/usr/local/bin/vim'
export PS1='\[\033[36m\]\u\[\033[0m\]:\[\033[32m\]\W\[\033[0m\]\$ '
export PATH="$HOME/Library/Haskell/bin:$PATH"
[[ -n $TMUX ]] && PROMPT_COMMAND='tmux setenv -g TMUX_PATH "$PWD";tmux refresh-client -S;'
source /Users/Devon/.bash_aliases
source /usr/local/git/contrib/completion/git-completion.bash
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}
