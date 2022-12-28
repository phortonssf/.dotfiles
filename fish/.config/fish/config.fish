# Fish shell
#load .zshrc ENV
egrep "^export " ~/.bashrc | while read e
    set var (echo $e | sed -E "s/^export ([A-Za-z_]+)=(.*)\$/\1/")
    set value (echo $e | sed -E "s/^export ([A-Za-z_]+)=(.*)\$/\2/")

    # remove surrounding quotes if existing
    set value (echo $value | sed -E "s/^\"(.*)\"\$/\1/")

    if test $var = "PATH"
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

#only run if inter */
if status is-interactive
    # commands to run in interactive sessions can go here
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
       bass ~/.local/bin/tmux-startup
   #fish_vi_key_bindings
   set -U fish_escape_delay_ms 100
   alias m='mark'
   alias g='jump'
   alias gs='git status'
   set -U fish_cursor_insert line
   set -U fish_cursor_replace_one underscore
   bind \cJ accept-autosuggestion
   bind -M insert \cj accept-autosuggestion execute
   bind -k -M insert nul nextd-or-forward-word
   #bind -e \[1;2P
   bind \cg 'commandline -i " "'
   #bind -M insert \c@ nextd-or-forward-word

set pure_symbol_prompt ' '
 set pure_symbol_reverse_prompt ' '
  # set pure_symbol_prompt ' '
  # set pure_symbol_reverse_prompt ' '

  function rr
    set PREV_CMD (history | head -1)
    set PREV_OUTPUT (eval $PREV_CMD)
    set CMD $argv[1]
    echo "Running '$CMD $PREV_OUTPUT'"
    eval "$CMD $PREV_OUTPUT"
  end
  #open dir search in nvim
  #set fzf_directory_opts --bind "ctrl-o:execute($editOR {} &> /dev/tty)
  set fzf_fd_opts --hidden --exclude=.git
  set fzf_fd_opts --hidden --exclude=.git
  fzf_configure_bindings --directory=\cf --variables=\ce --git_log=\ch --git_status=\cg

  jump shell fish | source

  function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

end

