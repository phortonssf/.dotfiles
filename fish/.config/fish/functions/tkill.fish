function tkill
  set -l unattached (  tmux list-sessions | grep -v attached | awk 'begin{fs=":"}{print $1}' | xargs -p -r -n 1 tmux kill-session -t )
echo "Removed Sessions"
printf "\nRemaining Sessions \n"
tmux list-sessions
end
