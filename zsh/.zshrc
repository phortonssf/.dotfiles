source ~/.local/bin/tmux-startup
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
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
export AWS_VAULT_BACKEND="pass"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
# export ZSH_SYSTEM_CLIPBOARD_SELECTION='CLIPBOARD'

typeset -g ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
typeset -g ZSH_SYSTEM_CLIPBOARD_SELECTION='PRIMARY'

export KEYTIMEOUT=20
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


### CI) in terminal 
# The following is an example of how to enable this:
     autoload -U select-bracketed
     zle -N select-bracketed
     for m in visual viopp; do
    for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
        bindkey -M $m $c select-bracketed
    done
done

setopt localoptions noksharrays

local style=${${1:-$KEYS}[1]} matching="(){}[]<>bbBB"
local -i find=${NUMERIC:-1} idx=${matching[(I)[${${1:-$KEYS}[2]}]]}%9
(( idx )) || return 1 # no corresponding closing bracket
local lmatch=${matching[1 + ((idx-1) & ~1)]}
local rmatch=${matching[1 + ((idx-1) | 1)]}
local -i start=CURSOR+1 end=CURSOR+1 rfind=find

[[ $BUFFER[start] = "$rmatch" ]] && (( start--, end-- ))
if (( REGION_ACTIVE  && MARK != CURSOR)); then
  (( MARK < CURSOR && (start=end=MARK+1) ))
  local -i origstart=start-1
  [[ $style = i ]] && (( origstart-- ))
fi

while (( find )); do
  for (( ; find && start; --start )); do
    case $BUFFER[start] in
      "$lmatch") (( find-- )) ;;
      "$rmatch") (( find++ )) ;;
    esac
  done

  (( find )) && return 1 # opening bracket not found

  while (( rfind && end++ < $#BUFFER )); do
    case $BUFFER[end] in
      "$lmatch") (( rfind++ )) ;;
      "$rmatch") (( rfind-- )) ;;
    esac
  done

  (( rfind )) && return 1 # closing bracket not found

  (( REGION_ACTIVE && MARK != CURSOR && start >= origstart &&
    ( find=rfind=${NUMERIC:-1} ) ))
done

[[ $style = i ]] && (( start++, end-- ))
(( REGION_ACTIVE = !!REGION_ACTIVE ))
[[ $KEYMAP = vicmd ]] && (( REGION_ACTIVE && end-- ))
MARK=$start
CURSOR=$end


#### CURSOR STUFF

# Remove mode switching delay.
KEYTIMEOUT=5


alias luamake=/home/digitaldive/lua-language-server/3rd/luamake/luamake
