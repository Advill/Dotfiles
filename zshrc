#zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
if [[ $(command -v batcat) ]]; then
  alias bat=batcat
  alias cat=batcat
  alias less=batcat
  export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
elif [[ $(command -v bat) ]]; then
  alias cat=bat
  alias less=bat
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

ZSH_THEME="hyperzsh"

# fzf
if [[ $(command -v fzf) ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# nvm
#export NVM_LAZY_LOAD=true
#export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim')

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(zsh-nvm)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ $(command -v nvim) ]]; then
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
    alias vim="nvim"
  fi
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias diff="icdiff"

# todo: add check to see if pyenv is installed.
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

#run tmux if not already started
if [ -x "$(command -v tmux)" ] && [ -z "${TMUX}" ]; then
  # tmux attach || tmux >/dev/null 2>&1;
  tmux >/dev/null 2>&1;
  exit
fi

alias tree="tree -I 'node_modules'"
#zprof

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
