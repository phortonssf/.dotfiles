source ~/.local/bin/tmux-startup main
export BROWSER=none
export PATH=$PATH:~/bin
# dont require cd to change dir
export PATH=/usr/local/bin/:$PATH
export PATH=~/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin/lvim:$PATH
export VIMSESSION=-S
# ZSH_DISABLE_COMPFIX=true:
export PATH=/home/phortonssf/.local/bin:$PATH
export PATH=$PATH:/mnt/c/Windows/System32

# Path to your oh-my-zsh installation
export ZSH="/home/digitaldive/.oh-my-zsh"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.npm-global/bin/:$PATH
export HISTORY_IGNORE="(ls|cat|AWS|SECRET|cd|less|zsh|history)"
export AWS_VAULT_BACKEND="pass"

export NVM_DIR="$HOME/.nvm"

# Remove mode switching delay.
export KEYTIMEOUT=18

## Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
  fi

##Load nvim as editor otherwise vim
if [[ -f /bin/nvim ]]
  then EDITOR=nvim
  else EDITOR=vim
fi
ZSH_THEME="powerlevel10k/powerlevel10k"
# export ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
# export ZSH_SYSTEM_CLIPBOARD_SELECTION='CLIPBOARD'
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
typeset -g ZSH_SYSTEM_CLIPBOARD_SELECTION='PRIMARY'

# confirmations, etc.) must go above this block; everything else may go below.
#
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
## Include file if it exists
include () {
   if [[ -f "$1" ]] && source "$1"
}
# REMOVES EXECUTE
bindkey -ar ":"


 autoload -Uz promptinit
 promptinit

# eval $(keychain --eval .ssh/id_rsa)

include ~/.zsh-plugins.zsh
include ~/.zshrc.alias
include ~/.zshrc.sets 
include ~/.inputrc
include ~/.cursor.zsh
# Keeps errors out of zsh history
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

eval "$(dircolors -b)"


# Change cursor shape for different vi modes.

#MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
# MODE_CURSOR_VICMD="green block"
# MODE_CURSOR_SEARCH="#ff00ff steady underline"
# MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
# MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

bindkey \^U up-history

#KEYTIMEOUT=5
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
include ~/.config/power10k_themes/.zsh-theme-gruvbox-material-dark


# Use nvim as manpager `:h Man`
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# move and create directories
function mvp ()
{
    dir="$2" # Include a / at the end to indicate directory (not filename)
    tmp="$2"; tmp="${tmp: -1}"
    [[ "$tmp" != "/" ]] && dir="$(dirname "$2")"
    [[ -a "$dir" ]] ||
    mkdir -p "$dir" &&
    mv "$@"
}

