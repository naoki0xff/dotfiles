## Dotfiles

This repository contains personal configuration settings.

All the configuration files are located based on [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/latest/).

## Requirements

Manual Installation:

- zsh: Install binary for your platform and change zsh as user's default shell ( `$ chsh -s /path/to/zsh` )
- nix: Installation method is described with [nix/README.md](nix/README.md)

Installed via Nix:

- tmux: 3.2 or later (requires "popup" feature)
- neovim: 0.9.0 or later
- fzf: 0.48.0 or later
- fd
- ripgrep
- ...etc.

## What's not done with this configuration

I won't manage dotfiles with nix/home-manager. Home manager generated configuration files are symlinked to nix store, which doesn't allow user to edit them directly but accessible only from nix commands. Since any changes to configuration is usual task for me, nix way management of dotfiles will give me mere troubles but no simplicity in the end.
