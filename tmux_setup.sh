#!/bin/sh

SESSION_NAME="Coder"

echo "Setting up your tmux session: ${SESSION_NAME}"

tmux has-session -t ${SESSION_NAME} 2>/dev/null

if [ $? != 0 ]
then
  # Create session
  tmux new-session -s ${SESSION_NAME} -n Export -d
  # Create additional windows
  tmux new-window -n Runway -t ${SESSION_NAME}
  tmux new-window -n CDC -t ${SESSION_NAME}
  tmux new-window -n Notes -t ${SESSION_NAME}
  tmux new-window -n Datastores -t ${SESSION_NAME}
  tmux new-window -n "Distro Data" -t ${SESSION_NAME}
  tmux new-window -n "lookout-dw" -t ${SESSION_NAME}
  tmux new-window -n "dw-etl" -t ${SESSION_NAME}

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

  # Window 3 (CDC)
  tmux send-keys -t ${SESSION_NAME}:3 'cd ~/views/cdc' C-m
  tmux split-window -h -t ${SESSION_NAME}:3
  tmux split-window -v -t ${SESSION_NAME}:3.2

  # Window 4 (Notes)
  tmux send-keys -t ${SESSION_NAME}:4 'cs' C-m

  # Window 5 (Redis, mysql)
  tmux split-window -h -t ${SESSION_NAME}:5
  tmux send-keys -t ${SESSION_NAME}:5 'mysql.server start' C-m
  tmux send-keys -t ${SESSION_NAME}:5.2 'start-redis' C-m

  # Window 6 (Distro Data)
  tmux send-keys -t ${SESSION_NAME}:6 'cd ~/views/distribution_data_backup' C-m

  # Window 7 (lookout-dw)
  tmux send-keys -t ${SESSION_NAME}:7 'cd ~/views/lookout-dw' C-m

  # Window 8 (dw-etl)
  tmux send-keys -t ${SESSION_NAME}:8 'cd ~/views/dw-etl' C-m

fi
tmux attach -t ${SESSION_NAME}
