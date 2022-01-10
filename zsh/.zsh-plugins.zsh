# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh
# VIM_MODE_VICMD_KEY='^D'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

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
  zsh-syntax-highlighting
  zsh-vim-mode
  zsh-system-clipboard
  aws
  fzf
  docker
  zsh-completions
  zsh-autosuggestions
  )
 autoload -U compinit && compinit 
 source $ZSH/oh-my-zsh.sh

zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'
source $HOME/.oh-my-zsh/custom/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
# zstyle ':completion:*:*:aws' fzf-search-display true
 # bindkey '^I' fzf_completion
 # zstyle ':completion:*:*:git:*' fzf-search-display true

## use ripgrep with FZF
if type rg &> /dev/null; then
     export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs  -g "!{node_modules/*,.git/*}"'
     export FZF_DEFAULT_OPTS='-m --height 50% --border'
     export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

complete -o nospace -C ~/bin/terraform terraform
source <(kubectl completion zsh)
complete -C aws_completer aws
# bindkey -s jj '\e'
# bindkey jj vi-cmd-mode
# bindkey '^ ' autosuggest-accept

# zstyle ':completion:*' menu select

