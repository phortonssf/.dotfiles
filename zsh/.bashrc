# setopt HIST_SAVE_NO_DUPS
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin # set aws cli default pager
export AWS_PAGER="nvim" dont require cd to change dir
export PATH=/usr/local/bin/:$PATH
export PATH=~/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin/lvim:$PATH
export VIMSESSION=-S ZSH_DISABLE_COMPFIX=true:
export PATH=/home/phortonssf/.local/bin:$PATH
export PATH=$PATH:/mnt/c/Windows/System32
export WINPATH=/mnt/c/Users/Pedro
# export FZF_DEFAULT_OPTS='--height 100% --layout=reverse --border'
export FZF_DEFAULT_OPTS="--reverse --border rounded --no-info --color=spinner:#f2d5cf,hl:#e78284 --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284,bg+:-1"
# export FZF_DEFAULT_COMMAND=rg --files --hidden --follow -g '!{.git,.svn,.hg, node_modules} '
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.npm-global/bin/:$PATH
export GOPATH=/home/linuxbrew/.linuxbrew/bin/go
export PATH=$GOPATH:$PATH

export HELIX_RUNTIME=/home/linuxbrew/.linuxbrew/bin/go/helix
export PATH=$HELIX_RUNTIME:$PATH
export AWS_VAULT_BACKEND="pass"
export NVM_DIR="$HOME/.nvm"
export KEYTIMEOUT=1
# export EDITOR='vim'
export EDITOR='nvim'
export LF_CONFIG_HOME="~/.config"
export XDG_CONFIG_HOME="~/.config"
# export ZSH_SYSTEM_CLIPBOARD_TMUX_SUPPORT='true'
# export ZSH_SYSTEM_CLIPBOARD_SELECTION='CLIPBOARD'
export MANPAGER='nvim +Man!'
export MANWIDTH=999
# export LS_COLORS='rs=0:no=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32:'
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
export VI_MODE_SET_CURSOR=true
export VI_MODE_SET_CURSOR=true
export XDG_DATA_HOME=~/.local/share
export LF_DATA_HOME=~./local/share
export BROWSER=google-chrome
# export BROWSER='/mnt/c/Program\ Files/Google/Chrome/Application/chrome.exe --profile-directory="Default"'
# export BROWSER='mnt/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'
# export BROWSER='mnt/c/Program Files\ \(x86\)/Google/Chrome/Application/chrome.exe' no work
# export BROWSER=/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe  works
# /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe --profile-directory="Default"
# /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe --profile-directory="Default"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
