# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.

export ZSH=$HOME/.oh-my-zsh

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
 source $HOME/.oh-my-zsh/custom/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
 source $ZSH/oh-my-zsh.sh


## use ripgrep with FZF
if type rg &> /dev/null; then
     export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs  -g "!{node_modules/*,.git/*}"'
     export FZF_DEFAULT_OPTS='-m --height 50% --border'
     export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
 [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# needed for completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# completion rules
zstyle ':completion::*:ls::*' fzf-completion-opts --preview='eval head {1}'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# adds completions for cli apps
complete -o nospace -C ~/bin/terraform terraform
source <(kubectl completion zsh)
complete -C aws_completer aws

