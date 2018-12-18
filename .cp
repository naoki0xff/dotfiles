### .tmux.conf

# ---prefix---  #
set -g prefix C-s
unbind C-b
# overall
set -sg escape-time 1
set -g base-index 1
setw -g pane-base-index 1
set-window-option -g mode-keys vi
set -g status-keys emacs
set-option -g default-command "reattach-to-user-namespace -l $SHELL"
set -g history-limit 50000
## appearance
# init
set-option -g default-terminal screen-256color
set -g terminal-overrides 'xterm:colors=256'
# statusline
set-option -g status-interval 1
set-option -g status-left-length 20
set-option -g status-left "#[fg=white,bg=#6c6c6c]Session: #S #[default]"
set-option -g status-right-length 60
set-option -g status-right "#[fg=white,bg=#6c6c6c] #(id -u -n) | %H:%M %m/%d(%a)#[default] "
set-option -g status-fg white
set-option -g status-bg "#444444"
# window
set-window-option -g window-status-current-bg "#d75f00"
set-window-option -g window-status-current-fg black
set-option -g renumber-windows on
# utilities
bind r source-file ~/.tmux.conf \; display-message "tmux.conf reloaded..."

## server/session/window/buffer interface
# info
bind i choose-tree -w
bind o choose-tree -F '#{?pane_format,#{pane_current_command} tty:#{pane_tty},#{?window_format,#{window_name}#{window_flags} (#{window_panes} panes)#{?#{==:#{window_panes},1}, tty:#{pane_tty},},#{session_windows} windows#{?session_grouped, (group #{session_group}: #{session_group_list}),}#{?session_attached, (attached),}}}'
# session
bind C-c new
bind . command-prompt -I "#S" "rename-session -- '%%'"
# window
bind w confirm-before kill-window

## pane
# split
bind v split-window -h -c "#{pane_current_path}"
bind s split-window -v -c "#{pane_current_path}"
# move
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
# resize
bind -r < resize-pane -L 3
bind -r > resize-pane -R 3
bind -r - resize-pane -D 3
bind -r + resize-pane -U 3
# kill
bind x kill-pane

# mouse & clipboard
set -g mouse on
bind-key -T copy-mode-vi MouseDragEnd1Pane send -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"

## plugins
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'tmux-plugins/tmux-copycat'
set -g @plugin 'tmux-plugins/tmux-yank'
set -g @plugin 'tmux-plugins/tmux-open'
# resurrect
set -g @resurrect-strategy-nvim 'session'
set -g @resurrect-capture-pane-contents 'on'
set -g @resurrect-processes 'mysql ssh php'
# continuum
set -g @continuum-save-interval '30'
# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
