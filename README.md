# dotfiles

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)

Personal dotfiles for **macOS** and **Oracle Linux 9**. Bash, Zsh, and Neovim with Catppuccin theme switching.

## Quick Start

```bash
git clone https://github.com/bowang168/dotfiles.git ~/g/dotfiles
cd ~/g/dotfiles && ./install.sh
```

The install script:
- Creates symlinks from `~` to the repo (single source of truth)
- Backs up existing files to `~/.dotfiles_backup/` before overwriting
- Copies `.bashrc_private.example` → `~/.bashrc_private` (secrets are never symlinked)
- Loads GNOME Terminal profiles on Linux
- Safe to run multiple times

### Prerequisites

```bash
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
    ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

## Structure

```
dotfiles/
├── install.sh              # One-command setup (symlinks everything)
├── .bash_profile           # Bash login shell (sources .bashrc)
├── .bashrc                 # Bash interactive (sources .bashrc_private + .shell_common)
├── .bashrc_private.example # Template for API keys and secrets
├── .shell_common           # Shared aliases and functions (bash + zsh, cross-platform)
├── .zprofile               # Zsh login shell (Homebrew, Python PATH, Obsidian)
├── .zshenv                 # Zsh env vars for all processes (PATH only)
├── .zshrc                  # Zsh interactive (oh-my-zsh + catppuccin + plugins)
├── .gitconfig              # Git config (delta, SSH, merge settings)
├── .hushlogin              # Suppress "Last login" message in terminal
├── starship.toml           # Starship cross-shell prompt config (nerd-font-symbols)
├── bin/
│   ├── theme               # Dark/light theme switcher (macOS + GNOME)
│   └── toggle_app          # Toggle/focus/launch app windows (Linux / X11)
├── docs/
│   ├── ol9-shortcuts.md                # OL9 keyboard shortcuts (keyd, GNOME, custom)
│   └── gnome-terminal-profiles.dconf   # GNOME Terminal profiles export
├── nvim/
│   ├── init.lua            # Neovim config (lazy.nvim + catppuccin + fzf + treesitter)
│   └── lazy-lock.json      # Plugin version lock
└── zsh/
    └── catppuccin/
        ├── mocha.zsh       # Dark theme colors for zsh-syntax-highlighting
        └── latte.zsh       # Light theme colors for zsh-syntax-highlighting
```

## Key Features

### Cross-platform shell (`.shell_common`)

- Auto-detects macOS / Linux, applies platform-specific settings
- **[eza](https://github.com/eza-community/eza)** for `ls` / `ll` / `la` / `l2` etc. (falls back to system `ls`)
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** replaces `cd` with smart directory jumping (falls back to `builtin cd`)
- All tools degrade gracefully — nothing breaks without optional dependencies

### Theme switching

```bash
theme dark      # Catppuccin Mocha
theme light     # Catppuccin Latte
theme toggle    # Toggle between the two
theme           # Same as toggle
```

Changes propagate to:

| Component | macOS | Linux |
|-----------|-------|-------|
| System appearance | Dark mode via `osascript` | GTK theme via `gsettings` |
| Terminal | — | GNOME Terminal profile via `dconf` |
| Neovim | Reads `~/.theme_mode` on startup | Same |
| Zsh syntax highlighting | Colors loaded in `.zshrc` | Same |

After switching, run `exec zsh` to reload shell colors. New terminals pick it up automatically.

### toggle_app (Linux / X11)

Toggle-focus-launch any application window. Bind to keyboard shortcuts with `keyd`.

```bash
toggle_app gnome-terminal   # Toggle terminal
toggle_app google-chrome    # Toggle Chrome
toggle_app                  # Defaults to gnome-terminal
```

See [docs/ol9-shortcuts.md](docs/ol9-shortcuts.md) for keyd and shortcut configuration.

## Dependencies

| Tool | Purpose | Platform |
|------|---------|----------|
| [neovim](https://neovim.io/) >= 0.10 | Text editor | All |
| [oh-my-zsh](https://ohmyz.sh/) | Zsh framework | All |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder (shell + nvim) | All |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Command syntax coloring | All |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-like autosuggestions | All |
| [eza](https://github.com/eza-community/eza) | Modern `ls` replacement | All (optional) |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` replacement | All (optional) |
| [starship](https://starship.rs/) | Cross-shell prompt | All |
| [bat](https://github.com/sharkdp/bat) | `cat` with syntax highlighting | macOS (optional) |
| [xdotool](https://github.com/jordansissel/xdotool) | Window manipulation | Linux |
| [wmctrl](https://sites.google.com/site/aborber/wmctrl) | Window manager control | Linux |

## License

[MIT](LICENSE)

## Support

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)
