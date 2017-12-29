# allows for faster key repetition
set -s escape-time 0

# activity monitoring (notify me if something is happening in another window)
setw -g monitor-activity on
set -g visual-activity on

# status bar colors (Gimme TRON like color)
set -g status-bg colour240
set -g status-fg colour117

# highlight active window
set-window-option -g window-status-current-bg red

# use vim motion keys while in copy mode
set-window-option -g mode-keys vi

# Reload config simply by hitting prefix and r (AWESOME!)
bind r source-file ~/.tmux.conf \; display-message "Config reloaded..."

# color
set -g default-terminal  "screen-256color"

# create a new window in the same directory
bind c new-window -c "#{pane_current_path}"

# just zsh things (Still don't use zsh)
#set-option -g default-shell /usr/bin/zsh
#set-option -g automatic-rename off
