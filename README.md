# dotfiles

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)

Personal dotfiles for **macOS** and **Oracle Linux 9**. Bash, Zsh, and Neovim with Catppuccin theme switching.

## Structure

```
dotfiles/
├── .bash_profile           # Bash login shell (sources .bashrc)
├── .bashrc                 # Bash interactive (sources .bashrc_private + .shell_common)
├── .bashrc_private.example # Template for API keys and secrets
├── .shell_common           # Shared aliases and functions (bash + zsh, cross-platform)
├── .zshenv                 # Zsh env vars for all processes (PATH only)
├── .zshrc                  # Zsh interactive (oh-my-zsh + catppuccin + plugins)
├── .gitignore
├── bin/
│   ├── theme               # Dark/light theme switcher (GNOME)
│   └── toggle_app          # Toggle/focus/launch app windows (X11)
├── docs/
│   ├── ol9-shortcuts.md
│   └── keyboard_shortcuts_ol9/
├── nvim/
│   ├── init.lua            # Neovim config (lazy.nvim + catppuccin + fzf + treesitter)
│   └── lazy-lock.json      # Plugin version lock
├── zsh/
│   └── catppuccin/
│       ├── mocha.zsh       # Dark theme colors for zsh-syntax-highlighting
│       └── latte.zsh       # Light theme colors for zsh-syntax-highlighting
└── gnome-terminal-profiles.dconf
```

## Key Features

### Cross-platform shell (``.shell_common``)

- Auto-detects macOS / Linux, applies platform-specific settings
- **[eza](https://github.com/eza-community/eza)** for `ls` / `ll` / `la` / `l2` etc. (falls back to system `ls` if not installed)
- **[zoxide](https://github.com/ajeetdsouza/zoxide)** replaces `cd` with smart directory jumping (falls back to `builtin cd` if not installed)
- All tools degrade gracefully — nothing breaks without optional dependencies

### Theme switching

```bash
theme dark      # Catppuccin Mocha
theme light     # Catppuccin Latte
theme toggle    # Toggle between the two
theme           # Same as toggle
```

Changes propagate to:

| Component | How |
|-----------|-----|
| GNOME Terminal | Profile switch via `dconf` |
| GTK theme | `gsettings` (Adwaita-dark / Adwaita) |
| Neovim | Reads `~/.theme_mode` on startup |
| Zsh syntax highlighting | Colors loaded in `.zshrc` |

After switching, run `exec zsh` to reload shell colors. New terminals pick it up automatically.

### toggle_app (Linux / X11)

Toggle-focus-launch any application window. Bind to keyboard shortcuts with `keyd`.

```bash
toggle_app gnome-terminal   # Toggle terminal
toggle_app google-chrome    # Toggle Chrome
toggle_app                  # Defaults to gnome-terminal
```

See [docs/ol9-shortcuts.md](docs/ol9-shortcuts.md) for keyd configuration.

## Installation

```bash
git clone https://github.com/bowang168/dotfiles.git ~/dotfiles

# --- Shell config ---
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.shell_common ~/.shell_common
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# --- Scripts ---
mkdir -p ~/.local/bin
ln -sf ~/dotfiles/bin/theme ~/.local/bin/theme
ln -sf ~/dotfiles/bin/toggle_app ~/.local/bin/toggle_app

# --- Catppuccin zsh colors ---
mkdir -p ~/.zsh/catppuccin
ln -sf ~/dotfiles/zsh/catppuccin/mocha.zsh ~/.zsh/catppuccin/mocha.zsh
ln -sf ~/dotfiles/zsh/catppuccin/latte.zsh ~/.zsh/catppuccin/latte.zsh

# --- Neovim ---
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json

# --- Theme (dark by default) ---
echo "dark" > ~/.theme_mode

# --- Secrets (copy template, fill in real values) ---
cp ~/dotfiles/.bashrc_private.example ~/.bashrc_private
chmod 600 ~/.bashrc_private

# --- GNOME Terminal profiles (Linux only) ---
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/dotfiles/gnome-terminal-profiles.dconf
```

### Zsh plugins

```bash
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Third-party plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git \
    ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

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
| [bat](https://github.com/sharkdop/bat) | `cat` with syntax highlighting | macOS (optional) |
| [xdotool](https://github.com/jordansissel/xdotool) | Window manipulation | Linux |
| [wmctrl](https://sites.google.com/site/aborber/wmctrl) | Window manager control | Linux |

## License

[MIT](LICENSE)

## Support

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)
