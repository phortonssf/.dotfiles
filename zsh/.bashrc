# setopt hist_save_no_dups
export LC_ALL=en_US.utf-8
export LANG=en_US.utf-8
export PATH=$PATH:~/bin
export PATH=$PATH:~/.local/bin # set aws cli default pager
export aws_pager="nvim" dont require cd to change dir
export PATH=/usr/local/bin/:$PATH
export PATH=~/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin/lvim:$PATH
export vimsession=-s zsh_disable_compfix=true:
export PATH=/home/phortonssf/.local/bin:$PATH
export PATH=$PATH:/mnt/c/windows/system32
export WINPATH=/mnt/c/users/pedro
# export fzf_default_opts='--height 100% --layout=reverse --border'
# export FZF_DEFAULT_OPTS=" \
# --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
# --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
# --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

export FZF_DEFAULT_OPTS="--reverse --border rounded --no-info --color=spinner:#f2d5cf,hl:#e78284 --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284,bg+:-1"
# export fzf_default_command=rg --files --hidden --follow -g '!{.git,.svn,.hg, node_modules} '
export fzf_alt_c_opts="--preview 'tree -c {} | head -200'"
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.npm-global/bin/:$PATH
export GOPATH=/home/linuxbrew/.linuxbrew/bin/go
export PATH=$GOPATH:$PATH

export helix_runtime=/home/linuxbrew/.linuxbrew/bin/go/helix
export PATH=$helix_runtime:$PATH
export aws_vault_backend="pass"
export NVM_DIR="$HOME/.nvm"
export keytimeout=1
# export editor='vim'
export EDITOR='nvim'
export LF_CONFIG_HOME="~/.config"
export XDG_CONFIG_HOME="~/.config"
# export zsh_system_clipboard_tmux_support='true'
# export zsh_system_clipboard_selection='clipboard'
export MANPAGER='nvim +man!'

export MANWIDTH=999
# export LS_COLORS='rs=0:no=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32:'
export START=/mnt/c/Users/Pedro/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup
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
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
