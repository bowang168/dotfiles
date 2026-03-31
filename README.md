# dotfiles

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)

Personal configuration files for Bash, Zsh, and Neovim. Designed to work on both macOS and Oracle Linux.

## Structure

```
dotfiles/
├── .bash_profile       # Bash login shell (sources .bashrc)
├── .bashrc             # Bash interactive (sources .bashrc_private + .shell_common)
├── .bashrc_private.example  # Template for API keys and secrets
├── .shell_common       # Shared aliases and functions (bash + zsh)
├── .zshenv             # Zsh env vars for all processes (PATH only)
├── .zshrc              # Zsh interactive (oh-my-zsh + catppuccin + plugins)
├── bin/
│   ├── theme           # Dark/light theme switcher
│   └── toggle_app      # Toggle/focus/launch application windows
├── docs/
│   ├── ol9-shortcuts.md        # OL9 keyboard shortcuts & keyd config
│   └── keyboard_shortcuts_ol9/ # Screenshot images
├── nvim/
│   ├── init.lua        # Neovim config (lazy.nvim, catppuccin, fzf, treesitter)
│   └── lazy-lock.json  # Plugin version lock file
├── zsh/
│   └── catppuccin/
│       ├── mocha.zsh   # Dark theme colors for zsh-syntax-highlighting
│       └── latte.zsh   # Light theme colors for zsh-syntax-highlighting
└── gnome-terminal-profiles.dconf  # GNOME Terminal profiles export
```

## Theme switching

The `theme` command switches between **Catppuccin Mocha** (dark) and **Catppuccin Latte** (light) across your entire environment:

```bash
theme dark      # Switch to dark mode
theme light     # Switch to light mode
theme toggle    # Toggle between dark and light
theme           # Same as toggle
```

This changes:
- **GNOME Terminal** profile (background, foreground, ANSI palette)
- **GTK theme** (Adwaita-dark / Adwaita)
- **Neovim** colorscheme (reads `~/.theme_mode` on startup)
- **Zsh syntax highlighting** colors (loaded via `~/.zshrc`)

After switching, run `exec zsh` to reload shell colors in the current session. New terminal windows will use the new theme automatically.

## toggle_app

Toggle and focus a target application window. Launches it if not running; minimizes it if already focused.

```bash
toggle_app gnome-terminal   # Toggle terminal window
toggle_app google-chrome    # Toggle Chrome window
toggle_app                  # Defaults to gnome-terminal
```

Dependencies: `xdotool`, `wmctrl`

See [docs/ol9-shortcuts.md](docs/ol9-shortcuts.md) for keyboard shortcut configuration with `keyd`.

## Installation

```bash
git clone https://github.com/bowang168/dotfiles.git ~/dotfiles

# Shell config
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.shell_common ~/.shell_common
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Scripts (theme switcher + toggle_app)
mkdir -p ~/.local/bin
ln -sf ~/dotfiles/bin/theme ~/.local/bin/theme
ln -sf ~/dotfiles/bin/toggle_app ~/.local/bin/toggle_app

# Catppuccin zsh colors
mkdir -p ~/.zsh/catppuccin
ln -sf ~/dotfiles/zsh/catppuccin/mocha.zsh ~/.zsh/catppuccin/mocha.zsh
ln -sf ~/dotfiles/zsh/catppuccin/latte.zsh ~/.zsh/catppuccin/latte.zsh

# Initialize theme (dark by default)
echo "dark" > ~/.theme_mode

# Secrets (copy template, fill in real values)
cp ~/dotfiles/.bashrc_private.example ~/.bashrc_private
chmod 600 ~/.bashrc_private

# Neovim
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json

# GNOME Terminal profiles (Linux only)
dconf load /org/gnome/terminal/legacy/profiles:/ < ~/dotfiles/gnome-terminal-profiles.dconf
```

## Zsh plugins

Install these into oh-my-zsh custom plugins directory:

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

## Dependencies

| Tool | Purpose | Required |
|------|---------|----------|
| [neovim](https://neovim.io/) | Text editor | Yes |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder | Yes |
| [oh-my-zsh](https://ohmyz.sh/) | Zsh framework for themes and plugins | Yes (for zsh) |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Command syntax coloring | Yes |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-like autosuggestions | Yes |
| [xdotool](https://github.com/jordansissel/xdotool) | Window manipulation (for toggle_app) | Yes (Linux) |
| [wmctrl](https://sites.google.com/site/aborber/wmctrl) | Window manager control (for toggle_app) | Yes (Linux) |
| [bat](https://github.com/sharkdop/bat) | `cat` replacement with syntax highlighting | Optional (macOS) |
| [tree](https://mama.indstate.edu/users/ice/tree/) | Directory listing | Optional |

## License

[MIT](LICENSE)

## Support This Project

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)
