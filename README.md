## Dotfiles

This repository contains personal configuration files.

## Directory Structure

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
    ├── .codex/
    │   └── config.toml
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

- Homebrew: Install with [official method](https://brew.sh). (`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`)
- Nix: See [nix-darwin/README.md](nix-darwin/README.md) for installation method.

## Other Dependencies

Installed via Nix:
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - Required for devicon. You need to manually configure you prefered terminal emulator to use this font.

## What's not done with this configuration

Dotfiles isn't intended to be managed by Nix. This is because Nix based configuration enforces symbolic links in placing dotfiles.  
Since I prefer frequent change on dotfiles, given its overhead of multiple deployment through Nix, dotfiles are excluded from Nix management.
