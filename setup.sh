#!/bin/bash
set -x
rm -f ~/.tmux.conf && ln -s `pwd`/.tmux.conf ~/
mkdir -p ~/scripts
rm -f ~/scripts/tmux_setup.sh && ln -s `pwd`/tmux_setup.sh ~/scripts/
