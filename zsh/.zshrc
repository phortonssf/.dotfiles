source tmux-startup

export BROWSER=none
export PATH=$PATH:~/bin
# dont require cd to change dir
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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# use ripgrep with FZF
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
      export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

PATH=$HOME/.local/bin:$PATH


# use ripgrep with FZF
if type rg &> /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files'
      export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


include ~/.config/power10k_themes/.zsh-theme-gruvbox-material-dark

#Works but breaks the box,givs you solid and blinking fine

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne "\[\e[0 q\e[?12l\]" 
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne '\e[5 q\e]12;#7fcac4\a' # Use beam shape cursor on startup.
}
zle -N zle-line-init
echo -ne '\e[5 q\e]12;\#7fcac4\a' # Use beam shape cursor on startup.
# In .zshrc


# was meh
#source "$HOME/.oh-my-zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

#MODE_CURSOR_VIINS="#00ff00 blinking bar"

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
