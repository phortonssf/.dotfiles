# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh
# VIM_MODE_VICMD_KEY='^D'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  z
  dircycle
# colorize
  ssh-agent
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vim-mode
  )
# bindkey -s jj '\e'
# bindkey jj vi-cmd-mode
# bindkey '^ ' autosuggest-accept

# zstyle ':completion:*' menu select

source $ZSH/oh-my-zsh.sh

