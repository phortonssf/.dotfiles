
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
     # Resets to terminal cursor
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
