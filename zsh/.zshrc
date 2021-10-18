export PATH=$PATH:/usr/local/go/bin
export BROWSER=none

# dont require cd to change dir
export PATH=~/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH 
export PATH=$HOME/.local/bin/lvim:$PATH

# ZSH_DISABLE_COMPFIX=true:
export PATH=/home/phortonssf/.local/bin:$PATH
export PATH=$PATH:/mnt/c/Windows/System32

# Path to your oh-my-zsh installation
export ZSH="/home/digitaldive/.oh-my-zsh"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

export HISTORY_IGNORE="(ls|cat|AWS|SECRET|cd|less|zsh|history)"

# confirmations, etc.) must go above this block; everything else may go below.
#
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Include file if it exists
include () {
   if [[ -f "$1" ]] && source "$1"
}
# REMOVES EXECUTE
bindkey -ar ":" 


autoload -Uz promptinit
promptinit

#Load nvim as editor otherwise vim
if [[ -f /bin/nvim ]]
  then EDITOR=nvim
  else EDITOR=vim
fi
##### NEEDS TO LOAD BEFORE SOURCING OH-MY-ZSH  #######

eval $(keychain --eval .ssh/id_rsa)

#set keymap vi-command Shift-Enter: autosuggest-accept-line
#set keymap vi-command Alt-l: autosuggest-execute
#bindkey ll autosuggest-accept-line
#bindkey ll autosuggest-execute
#bindkey '^[OM' accept-line
zle -N auto-suggest-execute 
include ~/.zsh-plugins.zsh 
include ~/.zshrc.alias
include ~/.inputrc
include ~/.zshrc.sets 

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Keeps errors out of zsh history
 zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
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


# Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
  fi
  # Us eemacs keybindings even if our EDITOR is set to vi
#::indkey -e

### Vim Mode Configs

# Bind to bind jj to exit insert mode
#bindkey ll autosuggest-accept-line
#Ind-or-complete-or-list-files
function expand-or-complete-or-list-files() {
  if [[ $#BUFFER == 0 ]]; then
     BUFFER="ls "
     CURSOR=3
     zle list-choices
     zle backward-kill-word
   else
    zle expand-or-complete
fi
                                                        }
zle -N expand-or-complete-or-list-files
export KEYTIMEOUT=14

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# use ripgrep with FZF
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
      export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

PATH=$HOME/.local/bin:$PATH

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# use ripgrep with FZF
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
      export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

include ~/.config/power10k_themes/.zsh-theme-gruvbox-material-dark
