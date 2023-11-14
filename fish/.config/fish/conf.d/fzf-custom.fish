set -Ux FZF_DEFAULT_OPTS "\
--reverse \
--border rounded \
--no-info \
--pointer=' ' \
--marker=' ' \
--ansi \
 --color='fg:#c23ac7,bg:#f5f5f5,hl:#5f87af'"

set -Ux FZF_TMUX_OPTS "-p 55%,60%"

set -Ux FZF_CTRL_R_OPTS "--border-label=' history ' \
--prompt='  '"
