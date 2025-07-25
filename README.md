## Dotfiles

This repository contains personal configuration files.

## File Location

```
.
├── /etc/nix-darwin/
│   ├── flake.nix
│   ├── pkgs/
│   │   ├── common/*
│   │   └── aarch64-darwin/*
│   ├── platform/
│   │   └── aarch64-darwin/*
│   └── home/
│       └── aarch64-darwin/*
└── ${HOME}/
    ├── .config/
    │   ├── git/*
    │   ├── nvim/
    │   │   ├── init.lua
    │   │   ├── lua/
    │   │   │   ├── config/*
    │   │   │   └── plugins/*
    │   │   └── lsp/*
    │   └── tmux/tmux.conf
    ├── .zshrc
    └── .zprofile
```

## Dependencies

Manual Installation:

- Homebrew: Install with [official method](https://brew.sh) `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`)
- Nix: See [nix/README.md](nix/README.md) for installation method.

## Other Dependencies

Installed via Nix:

- tmux: 3.3 or later
- neovim: 0.11 or later
- fzf: 0.48.0 or later
- fd
- ripgrep
- ...etc.

## What's not included with this configuration

I will not manage dotfiles with nix's Mome Manager. Any of Home Manager generated configuration files are symlinked to nix store, which doesn't allow user to edit them directly but accessible only from nix commands. Since changing configuration is usual task for me, nix way of dotfile management isn't introduced here.
