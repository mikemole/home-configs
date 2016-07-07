#!/bin/sh

SESSION_NAME="Coder"

echo "Setting up your tmux session: ${SESSION_NAME}"

tmux has-session -t ${SESSION_NAME} 2>/dev/null

if [ $? != 0 ]
then
  # Create the session with window "Export"
  tmux new-session -s ${SESSION_NAME} -n Export -d
  # Create the other windows
  tmux new-window -n Runway -t ${SESSION_NAME}
  tmux new-window -n Notes -t ${SESSION_NAME}
  tmux new-window -n Redis -t ${SESSION_NAME}

  # First window (1)
  tmux send-keys -t ${SESSION_NAME}:1 'cd ~/views/raw_data_export_via_jenkins' C-m
  # Split it up
  tmux split-window -h -t ${SESSION_NAME}:1
  tmux split-window -v -t ${SESSION_NAME}:1.2

  # Second window (2)
  tmux send-keys -t ${SESSION_NAME}:2 'cd ~/views/runway' C-m
  # Split it up
  tmux split-window -h -t ${SESSION_NAME}:2
  tmux split-window -v -t ${SESSION_NAME}:2.2

  # Window 3 (Notes)
  tmux send-keys -t ${SESSION_NAME}:3 'cs' C-m

  # Window 4 (Redis)
  tmux send-keys -t ${SESSION_NAME}:4 'start-redis' C-m
fi
tmux attach -t ${SESSION_NAME}
