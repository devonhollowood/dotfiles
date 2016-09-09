# Set language
export LANG=en_US.UTF-8

# Set prompt
PROMPT="devon:%0(?:%F{cyan}:%F{red})%1~%f $ "

# Set up search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A'   up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Set up aliases
[[ -f /home/devon/.bash_aliases ]] && source "$HOME/.bash_aliases"

# Set up modules
[[ -d /home/devon/modulefiles ]] && module use /home/devon/modulefiles

# load user settings
export VISUAL=$vim
[[ -n $TMUX ]] && PROMPT_COMMAND='tmux setenv -g TMUX_PATH "$PWD";tmux refresh-client -S;'

# Load necessary modules
module load gcc/4.9.2 python/2.7.8 intel_compilers/15.0.1 gmp/6.1.0 stack/1.1.2

# Wrap Heasoft libraries
export PATH="/home/devon/heasoft-6.16/heasoft_wrap:$PATH"

# Start up ciao
ciao

# custom functions
vman() {
  vim -c "SuperMan $*"

  if [ "$?" != "0" ]; then
    echo "No manual entry for $*"
  fi
}
