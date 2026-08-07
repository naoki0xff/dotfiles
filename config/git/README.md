# Git configuration

Personal Git configuration with Neovim-based diff and merge tools, rebased pulls, a customized delta pager, and a small set of global ignore rules.

## Installation

Git reads global configuration from `~/.config/git/config` and global ignore patterns from `~/.config/git/ignore`. Link this directory from the repository root with:

```sh
mkdir -p ~/.config
ln -s "$(pwd)/config/git" ~/.config/git
```

Back up or remove an existing `~/.config/git` directory before creating the link.

The committed name and email are placeholders. Configure an identity before creating commits. To avoid putting personal details in this repository, set the identity in each repository when needed:

```sh
git config user.name "Your Name"
git config user.email "you@example.com"
```

Alternatively, copy the configuration instead of linking it and update the `[user]` section in the untracked copy.

## Requirements

- Git
- Neovim, used as the editor, diff tool, and merge tool
- [delta](https://github.com/dandavison/delta), used as the pager and interactive diff filter
- A terminal with true-color support for the customized delta theme

The nix-darwin configuration installs delta through `nix-darwin/pkgs/common/git.nix`. On other platforms, install delta separately or change `core.pager` before using this configuration.

## Behavior

### Editing and history

- Neovim is the default editor.
- `git pull` rebases local commits instead of creating a merge commit.
- Merge conflicts use the `zdiff3` style, which displays the common ancestor alongside both sides of the conflict.

Because pulls rebase by default, avoid rebasing commits that have already been shared unless rewriting their history is intentional.

### Diffs and merges

The default diff and merge tool is `nvimdiff`:

```sh
git difftool
git mergetool
```

The diff tool opens the local and remote versions in read-only diff mode. The merge tool opens the local, base, remote, and merged files and arranges the windows for conflict resolution.

### Delta pager

Delta uses the custom `arctic-fox` feature with:

- Nord syntax colors
- Side-by-side diffs and line numbers
- Distinct added, modified, removed, copied, and renamed labels
- Enhanced hunk and merge-conflict headers
- `n` and `N` navigation between diff sections
- A compact blame format and dark blame palette

Interactive Git commands also pass their diffs through delta while retaining color.

## Global ignore rules

The `ignore` file excludes these paths from every repository:

| Pattern | Purpose |
| --- | --- |
| `.DS_Store` | macOS Finder metadata |
| `.envrc` | direnv project configuration |
| `.tags` | Generated tag files |
| `*.vim` | Vim script files |

Repository-specific exceptions or additional patterns should normally go in that repository's `.gitignore`.

## Validation

Show the effective global configuration and the file each value came from:

```sh
git config --global --list --show-origin
```

Confirm that a path is ignored and identify the matching rule with:

```sh
git check-ignore -v path/to/file
```

Test the configured tools in a repository containing changes or conflicts:

```sh
git diff
git difftool
git mergetool
```
