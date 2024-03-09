# Fish shell
egrep "^export " ~/.bashrc | while read e
    set var (echo $e | sed -E "s/^export ([A-Za-z_]+)=(.*)\$/\1/")
    set value (echo $e | sed -E "s/^export ([A-Za-z_]+)=(.*)\$/\2/")

    # remove surrounding quotes if existing
    set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

    if test $var = PATH
        # replace ":" by spaces. this is how PATH looks for Fish
        set value (echo $value | sed -E "s/:/ /g")

        # use eval because we need to expand the value
        eval set -xg $var $value

        continue
    end

    # evaluate variables. we can use eval because we most likely just used "$var"
    set value (eval echo $value)

    #echo "set -xg '$var' '$value' (via '$e')"
    set -xg $var $value
end
#
# set -Ux FZF_DEFAULT_OPTS "\
# --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
# --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
# --color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"
set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"
set -g fish_prompt_at_top true
# ~/.tmux/plugins
fish_add_path /home/digitaldive/.cargo/bin
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin

# T ENV VARS
# set -Ux T_SESSION_USE_GIT_ROOT true
# set -Ux T_SESSION_NAME_INCLUDE_PARENT true


# ~/.config/tmux/plugins
# fish_add_path $home/.config/tmux/plugins/t-smart-tmux-session-manager/bin
# fish_ssh_agent
#only run if inter */
if status is-interactive
    # set fish_color_selection --background="#C29DF1"
    set fish_color_selection --background="#7851A9"
    # set fish_color_selection --background="#120043"
    # commands to run in interactive sessions can go here
    set --universal pure_show_system_time false
    # set --universal pure_color_system_time pure_color_mute
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    # bass ~/.local/bin/tmux-startup
    set -U fish_escape_delay_ms 100

    # TODO add alias for grex regex helper

    alias gconf='nvim ~/.dotfiles/git/.gitconfig'
    alias gs="nvim -c 'to vert G | vertical resize 80'"
    alias ff='fd --type f --strip-cwd-prefix --hidden | fzf'
    alias groot='cd $(git rev-parse --show-toplevel)'
    alias troot='cd $TMUX_ROOT'
    alias tk='tmux kill-server'
    # alias tkill='tmux list-sessions | grep -v attached | (awk 'begin{fs=":"}{print $1}' )| xargs -n 1 tmux kill-session -t || echo No sessions to kill'
    # alias killunattachedtmux 'tmux ls | awk "BEGIN{FS=\":\"}!/attached/{print $1}" | xargs -n 1 tmux kill-session -t'
    # alias tkill= "tmux ls | awk 'BEGIN{FS=":"}!/attached/{print $1}' | xargs -n 1 tmux kill-ses -t"


    set -U fish_cursor_insert line
    set -U fish_cursor_replace_one underscore
    set fish_cursor_visual block


    # KEYBINDS
    fish_vi_key_bindings
    bind --mode insert --sets-mode default jk repaint
    bind --mode replace --sets-mode default jk repaint
    set -g fish_key_bindings fish_vi_key_bindings
    bind -M insert \cc kill-whole-line repaint

    # LF CTRL O open dir after close
    bind -M insert \co 'set old_tty (stty -g); stty sane; lfcd; stty $old_tty; commandline -f repaint'
    # ctrl enter accept-autosuggestion and run
    # runs fg to return foreground process 
    bind -M insert \cz fore_ground
    bind -M default \cz fore_ground

    bind -M insert \cj accept-autosuggestion execute
    bind -k -M insert nul nextd-or-forward-word


    # # TODO TMUX F8 protection
    # bind -M insert ~ true
    # bind -k f8 true
    # bind -e -M normal -k F8 true
    # bind -e -M normal -k F8 true
    # bind ctrl-a to null for tmux-bindkey
    bind -M insert \ca true
    bind -M normal \ca true

    # /I DONT KNOW
    # bind -e \[1

    # bind \cg 'commandline -i " "'
    #
    # # set pure_symbol_container_prefix " "
    # # set pure_symbol_prompt ' '
    # # set pure_symbol_reverse_prompt ' '
    # # set pure_symbol_prompt ' '
    # # set pure_symbol_reverse_prompt ' '


    # TRASH wanted !!
    # function rr
    #     set PREV_CMD (history | head -1)
    #     set PREV_OUTPUT (eval $PREV_CMD)
    #     set CMD $argv[1]
    #     echo "Running '$CMD $PREV_OUTPUT'"
    #     eval "$CMD $PREV_OUTPUT"
    # end
    function killport
        lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9
        echo Port $1 "found and killed."
    end
    #open dir search in nvim


    # FZF SETTINGS
    #set fzf_directory_opts --bind "ctrl-o:execute($editOR {} &> /dev/tty)
    set fzf_fd_opts --hidden --exclude=.git
    set fzf_fd_opts --hidden --exclude=.git
    fzf_configure_bindings --directory=\cf --variables=\ce --git_log=\ch --git_status=\cg

    #installed mars
    #https://github.com/techwizrd/fishmarks

    zoxide init fish | source
    #  jump shell fish | source */
    #
    starship init fish | source

    function sudo
        if test "$argv" = !!
            eval command sudo $history[1]
        else
            command sudo $argv
        end
    end

end
# Load fishmarks (http://github.com/techwizrd/fishmarks)
