# Neovim configuration

Personal Neovim configuration written in Lua. It uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugins and Neovim's built-in LSP client for language support.

## Installation

Place this directory at `~/.config/nvim`, for example by creating a symbolic link from the repository root:

```sh
mkdir -p ~/.config
ln -s "$(pwd)/config/nvim" ~/.config/nvim
```

Back up or remove an existing `~/.config/nvim` directory before creating the link. Start Neovim with:

```sh
nvim
```

On first startup, the configuration clones lazy.nvim and installs the declared plugins. Git and network access are therefore required for initial setup.

## Requirements

- Neovim 0.11 or later, for `vim.lsp.config()` and `vim.lsp.enable()`
- Git, for plugin installation and Git integrations
- A Nerd Font, for file-type and interface icons
- `fd`, `ripgrep`, and `bat`, for the best fzf-lua experience
- Node.js and Yarn, for the Markdown preview plugin
- Language-server executables for the languages listed below
- The Codex CLI with ChatGPT authentication, to use CodeCompanion's configured Codex adapter

The repository's Nix configurations install most editor dependencies in `nix-darwin/pkgs/common/editor.nix`, `nix-wsl/pkgs/common/editor.nix`, and the corresponding `utils.nix` and `languages.nix` modules.

## Structure

```text
.
├── init.lua                 # Loads the configuration modules
├── lua/
│   ├── config/
│   │   ├── autocmds.lua    # Buffer and file-type automation
│   │   ├── keymaps.lua     # Global and plugin key bindings
│   │   ├── lazy.lua        # lazy.nvim bootstrap and setup
│   │   ├── lsp.lua         # Shared LSP configuration and activation
│   │   └── options.lua     # Editor options
│   └── plugins/             # Plugin specifications grouped by purpose
└── lsp/                     # Per-server configurations discovered by Neovim
```

## Key bindings

The leader key is `Space`, and the local leader is `\`. The tables below show the main custom normal-mode bindings.

### Navigation and editing

| Key | Action |
| --- | --- |
| `Esc Esc` | Clear search highlighting |
| `j` / `k` | Move by displayed line |
| `gh` / `gl` | Move to the first / last character of the line |
| `+` / `_` | Increase / decrease window height by three lines |
| `=` / `-` | Increase / decrease window width by three columns |
| `Leader w` | Delete the buffer without closing its window |
| `Leader e` | Run or preview the current file with Jaq |
| `Leader r` | Rename the symbol under the cursor with LSP |
| `Leader f` | Format with LSP |
| `Ctrl-\` | Find LSP references |

### Tabs

Tab commands start with `t`.

| Key | Action |
| --- | --- |
| `t1` ... `t8` | Go to the numbered tab |
| `t9` | Go to the last tab |
| `tt` / `tw` | Create / close a tab |
| `to` | Close all other tabs |
| `tn` / `tp` | Go to the next / previous tab |
| `tT` | Open the current buffer in a new tab |
| `tm` | Move the current window to a new tab |
| `th` / `tl` | Move the current tab left / right |

### Finders

Most finder commands start with `s` and use fzf-lua.

| Key | Action |
| --- | --- |
| `sf` | Find files |
| `sg` | Search text with grep |
| `sl` | List buffers |
| `sy` | List recently opened files |
| `si` / `sj` | List changes / jumps |
| `sm` / `sr` | List marks / registers |
| `sd` | List document diagnostics |
| `so` / `st` | List document / workspace symbols |
| `s.` | Search lines in the current buffer |
| `s/` | Search command history |
| `Space c` | List commands |
| `Space ,` | Find files in the Neovim configuration |

### Git and tools

| Key | Action |
| --- | --- |
| `Space g s` | Open Fugitive status |
| `Space g d` | Diff the current file |
| `Space g b` | Open Git blame |
| `Space g c` / `Space g l` | Browse buffer / repository commits |
| `Space g i` | Show the commit for the current line |
| `Space g p` | Preview the current hunk |
| `Leader a` / `Leader u` | Stage the current hunk |
| `Leader A` / `Leader U` | Stage the buffer / reset its index changes |
| `Space a` | Toggle the CodeCompanion chat |
| `Space n` | Toggle Neo-tree |
| `Space v` | Run `:Outline` (requires an Outline command provider) |
| `Space u` | Toggle the undo tree |
| `Leader s` | Select a saved session |
| `Leader q` | Delete the current saved session |
| `?` | Open the lazy.nvim interface |

## Language servers

Language servers are enabled through Neovim's built-in LSP client. They are not installed by lazy.nvim and must be available on `PATH`.

| Language or format | Server executable |
| --- | --- |
| Bash | `bash-language-server` |
| Bicep | `Bicep.LangServer` |
| Dockerfile | `docker-langserver` |
| Go | `gopls` |
| Helm | `helm_ls` |
| Java | `jdtls` |
| XML | `lemminx` |
| Lua | `lua-language-server` |
| Nix | `nil` |
| PHP | `phpactor` |
| Python | `pyright-langserver` |
| Ruby | `solargraph` |
| Terraform | `terraform-ls` |
| JavaScript and TypeScript | `typescript-language-server` |
| YAML | `yaml-language-server` |

YAML schemas are configured for common GitHub, GitLab, Kubernetes, Helm, Argo Workflows, Ansible, OpenAPI, Prettier, and Docker Compose files.

## Main features

- Nord color scheme, global status line, tab line, window labels, breadcrumbs, diagnostics, and LSP progress
- Completion from LSP, buffers, paths, command-line sources, and snippets through nvim-cmp
- Treesitter highlighting, context display, and automatic HTML-style tag handling
- File and text search through fzf-lua
- Git workflows through Fugitive, Gitsigns, and Git Messenger
- File exploration with Neo-tree and LSP symbol navigation through fzf-lua
- Persistent undo and automatic project sessions under `~/work`
- File execution and Markdown preview through Jaq
- AI chat through CodeCompanion and the Codex ACP adapter

## Maintenance and validation

Use `:Lazy` to inspect, update, or troubleshoot plugins. Useful built-in checks include:

```vim
:checkhealth
:Lazy check
:LspInfo
```

To test startup without opening the interface:

```sh
nvim --headless '+qa'
```
