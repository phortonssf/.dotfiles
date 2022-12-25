source ~/.local/bin/tmux-startup main
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS export PATH=$PATH:~/bin export PATH=$PATH:~/.local/bin # set aws cli default pager export AWS_PAGER="nvim" dont require cd to change dir export PATH=/usr/local/bin/:$PATH export PATH=~/usr/bin:/bin:/usr/sbin:/sbin:$PATH export PATH=$HOME/bin:/usr/local/bin:$PATH export PATH=$HOME/.local/bin/lvim:$PATH export VIMSESSION=-S ZSH_DISABLE_COMPFIX=true: export PATH=/home/phortonssf/.local/bin:$PATH export PATH=$PATH:/mnt/c/Windows/System32 export WINPATH=/mnt/c/Users/Pedro export FZF_DEFAULT_OPTS=' --height 100% --layout=reverse --border' export FZF_DEFAULT_COMMAND='rg --type f --hidden --follow --exclude .git' show dir preview tree export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'" https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings Path to your oh-my-zsh installation
export ZSH="/home/digitaldive/.oh-my-zsh"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.npm-global/bin/:$PATH
export HISTORY_IGNORE="(ls|cat|AWS|SECRET|cd|less|zsh|history)"
# sets the variable for what backend to use in aws-vault
export AWS_VAULT_BACKEND="pass"
export NVM_DIR="$HOME/.nvm"

# Remove mode switching delay.
export KEYTIMEOUT=1

## Preferred editor for local and remote sessions
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='nvim'
  fi

##Load nvim as editor otherwise vim
if [[ -f  /home/linuxbrew/.linuxbrew/bin/nvim ]]
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
# bindkey -ar "<C-j>"


 autoload -Uz promptinit
 promptinit

# eval $(keychain --eval .ssh/id_rsa)

include ~/.zsh-plugins.zsh
include ~/.zshrc.alias
include ~/.zshrc.sets
include ~/.cursor.zsh
include ~/.local/bin/functions.sh
# Keeps errors out of zsh history
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

eval "$(dircolors -b)"


alias c='"$(history | tail -2 | sed "s/  [0-9]*  //;2d")" > /tmp/cmdoutput && cat /tmp/cmdoutput | xsel -b && notify-send "Terminal" "Ouput Copied"'
# Change cursor shape for different vi modes.

#MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
# MODE_CURSOR_VICMD="green block"
# MODE_CURSOR_SEARCH="#ff00ff steady underline"
# MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
# MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

bindkey \^U up-history

#KEYTIMEOUT=5
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# include ~/.config/power10k_themes/.zsh-theme-gruvbox-material-dark


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

function _paste {
    # echo "Executing: $BUFFER"
   # local paste = eval powershell.exe -command "Get-Clipboard" </dev/null
   local cmd="powershell.exe Get-Clipboard 2> /dev/null"
   local paste="$(eval $cmd )"
   # echo $paste
    printf '%s' $pate
   # RBUFFER=$paste
   # echo $paste

  # return
}
# zle -N _paste
# bindkey -a '^y' _paste
# bindkey -a 'd' '"_d
# vi-append-x-selection () { RBUFFER=$( powershell.exe -command "Get-Clipboard" </dev/null)}
# zle -N vi-append-x-selection
# bindkey -a '^X' vi-append-x-selection
 # bindkey -a '^X' _paste

# zvm_vi_yank () {
# 	zvm_yank
# 	printf %s "${CUTBUFFER}" | clip.exe
# 	zvm_exit_visual_mode
# }

# zle  -N zvm_vi_yank
# bindkey -a '^x' zvm_vi_yank


#   You may have to rebuild your cache by running rm ~/.zcompdump*; compinit    .
eval "$(zoxide init --cmd  cd zsh)"

#### TODO add more escape keys
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  # ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
  # ZVM_VI_INSERT_ESCAPE_BINDKEY=kk
  # ZVM_EXIT_VISUAL_MODE=v
 # ZVM_VI_VISUAL_ESCAPE_BINDKEY=jj
  ZVM_ESCAPE_KEYTIMEOUT=0.3
}
# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {

  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  include ~/.inputrc
  # ZVM_VI_INSERT_ESCAPE_BINDKEY=kk
  # ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
  ZVM_KEYTIMEOUT=0.3
  ZVM_ESCAPE_KEYTIMEOUT=0.3
  zvm_bindkey viins 'jj' zvm_exit_insert_mode
  zvm_bindkey visual 'jj' zvm_exit_visual_mode
  zvm_bindkey visual 'i' zvm_exit_visual_mode
  # zvm_bindkey visual '^c' zvm_exit_visual_mode
  zvm_bindkey viins 'kk' zvm_exit_insert_mode
   source ~/.p10k.zsh
}
# zvm_after_init_commands+=("bindkey -M viins 'jj' vi-cmd-mode")
export LS_COLORS='rs=0:no=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32:'

alias luamake=/home/digitaldive/lua-language-server/3rd/luamake/luamake
# include ~/.config/power10k_themes/.zsh-theme-gruvbox-material-dark

# # FZF COLORS from https://minsw.github.io/fzf-color-picker/
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#d0d0d0,bg:#121212,hl:#5f87af
 --color=fg+:#d0d0d0,bg+:#262626,hl+:#5fd7ff
 --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
 --color=marker:#87ff00,spinner:#af5fff,header:#87afaf'

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
case ${TERM} in

    screen*)

        # user command to change default pane title on demand
        function title { TMUX_PANE_TITLE="$*"; }

        # function that performs the title update (invoked as PROMPT_COMMAND)
        function update_title { printf "\033]2;%s\033\\" "${1:-$TMUX_PANE_TITLE}"; }

        # default pane title is the name of the current process (i.e. 'bash')
        TMUX_PANE_TITLE=$(ps -o comm $$ | tail -1)

        # Reset title to the default before displaying the command prompt
        PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'update_title'

        # Update title before executing a command: set it to the command
        trap 'update_title "$BASH_COMMAND"' DEBUG

        ;;

        # ... other cases for different terminals ...

esac
export VI_MODE_SET_CURSOR=true
export VI_MODE_SET_CURSOR=true
# vi mode copy paste
vi-append-x-selection () { RBUFFER=$(xsel -o -p </dev/null)$RBUFFER; }
zle -N vi-append-x-selection
bindkey -a '^X' vi-append-x-selection
vi-yank-x-selection () { print -rn -- $CUTBUFFER | xsel -i -p; }
zle -N vi-yank-x-selection
bindkey -a '^Y' vi-yank-x-selection

function magic-enter-cmd {
    echo "dirs -v "
}


# zstyle :zle:evil-registers:'[A-Za-z%#]' editor nvim
# (){
# 	local op
# 	local -a handler
# 	for op in yank put; do
# 		# get the current behavior for '+'
# 		zstyle -a :zle:evil-registers:'+' $op handler
# 		# if there is a handler, assign it for the empty pattern
# 		(($#handler)) && zstyle :zle:evil-registers:'' $op $handler
# 	done
# }
#
export
