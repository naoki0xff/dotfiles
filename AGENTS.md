# Repository Guidelines

## Project Structure & Module Organization

This repository contains personal dotfiles and Nix system configurations. `nix-darwin/` is the macOS (`aarch64-darwin`) flake; `nix-wsl/` is the NixOS-on-WSL (`x86_64-linux`) flake. In each, keep reusable packages in `pkgs/common/`, platform-specific settings in `pkgs/<system>/` and `platform/<system>/`, and Home Manager configuration in `home/<system>/`.

Directly managed user configuration lives in `config/`: Git, tmux, and Neovim. Neovim startup code is under `config/nvim/lua/config/`, plugin declarations under `config/nvim/lua/plugins/`, and language-server settings under `config/nvim/lsp/`. Keep related configuration in its existing platform or tool directory.

## Build, Test, and Development Commands

Run commands from the relevant flake directory:

```sh
nix flake check                 # Evaluate flake outputs and checks
sudo darwin-rebuild switch      # Apply nix-darwin changes on macOS
sudo nixos-rebuild switch --flake .#nixos@x86_64-linux --impure  # Apply WSL config
```

Use `nix flake check` before activation when possible. Rebuild commands change the local machine; inspect the affected module and use the correct platform before running them.

## Coding Style & Naming Conventions

Follow the local style of the file being edited. Nix files use two-space indentation, an argument set at the top, and focused modules named after their responsibility (for example, `pkgs/common/editor.nix`). Lua configuration also uses two-space indentation; use lowercase, descriptive filenames such as `keymaps.lua` and `terraformls.lua`. Avoid unrelated formatting churn.

## Testing Guidelines

There is no committed automated test framework or coverage target. Validate Nix edits with `nix flake check` from the changed flake, then perform the appropriate rebuild when safe. For Neovim, start Neovim and verify the edited plugin, option, or LSP configuration loads without errors.

## Commit & Pull Request Guidelines

Existing history uses short imperative summaries, commonly `update`; prefer a more specific equivalent such as `add Go language server` or `adjust darwin shell packages`. Keep commits scoped to one configuration concern. Pull requests should explain the target platform, list validation performed, link any relevant issue, and include screenshots only for visible UI changes (for example, Neovim behavior).

## Security & Configuration Tips

Do not commit credentials, tokens, or machine-specific secrets. Treat hardware configuration, hostnames, usernames, and rebuild commands as machine-scoped; verify them before copying settings between macOS and WSL.
