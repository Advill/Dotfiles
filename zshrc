# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/advil/.oh-my-zsh"

ZSH_THEME="hyperzsh"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias diff="icdiff"
alias vim="nvim"

export _JAVA_AWT_WM_NONREPARENTING=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/advil/Documents/work/installs/google-cloud-sdk/path.zsh.inc' ]; then . '/home/advil/Documents/work/installs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/advil/Documents/work/installs/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/advil/Documents/work/installs/google-cloud-sdk/completion.zsh.inc'; fi
