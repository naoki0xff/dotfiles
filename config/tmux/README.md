# tmux configuration

Personal tmux configuration with vi-style pane navigation, a compact Powerline-style status line, macOS clipboard integration, session persistence, and Kubernetes context display.

## Installation

Place `tmux.conf` at `~/.config/tmux/tmux.conf`, for example by creating a symbolic link from this repository:

```sh
mkdir -p ~/.config/tmux
ln -s "$(pwd)/config/tmux/tmux.conf" ~/.config/tmux/tmux.conf
```

Start tmux normally:

```sh
tmux
```

On first startup, the configuration clones [TPM](https://github.com/tmux-plugins/tpm) into `~/.local/share/tmux/plugins` and installs the configured plugins. This requires Git and network access.

## Requirements

- tmux
- Git, for the initial plugin installation
- Bash, `fzf`, `sed`, and `xargs`, for the pane-switching popup
- `pbcopy` and `pbpaste`, for clipboard integration on macOS
- A font containing Powerline glyphs, for the status line separators
- A working Kubernetes configuration if the kube-tmux status segment is used

## Key bindings

The prefix key is `Ctrl-s`; the default `Ctrl-b` prefix is disabled. Unless noted otherwise, press the prefix before the following key.

| Key | Action |
| --- | --- |
| `r` | Reload `~/.config/tmux/tmux.conf` |
| `i` | Open an `fzf` pane picker with pane previews |
| `Ctrl-c` | Create a new session |
| `.` | Rename the current session |
| `P` / `N` | Switch to the previous / next session |
| `w` | Confirm and kill the current window |
| `Ctrl-h` / `Ctrl-l` | Move the current window left / right |
| `v` | Split the pane horizontally in the current directory |
| `s` | Split the pane vertically in the current directory |
| `b` | Break the current pane into a window |
| `h` / `j` / `k` / `l` | Select the pane to the left / down / up / right |
| `<` / `>` | Resize the pane left / right by three cells |
| `-` / `+` | Resize the pane down / up by three cells |
| `x` | Kill the current pane |
| `]` | Paste the macOS clipboard into tmux |

Copy mode uses vi keys. Press `y` in copy mode to copy the selection to the macOS clipboard and leave copy mode.

## Plugins

The configuration manages these plugins with TPM:

- [tmux-yank](https://github.com/tmux-plugins/tmux-yank)
- [tmux-open](https://github.com/tmux-plugins/tmux-open)
- [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)
- [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
- [kube-tmux](https://github.com/jonmosco/kube-tmux)

Continuum automatically restores saved sessions. The configured resurrect bindings use `prefix + S` to save and `prefix + R` to restore.

## Validation

Reload the configuration from an existing session with `Ctrl-s r`. To check the file without replacing the current server configuration, start an isolated tmux server:

```sh
tmux -L config-check -f ~/.config/tmux/tmux.conf new-session -d
tmux -L config-check kill-server
```
