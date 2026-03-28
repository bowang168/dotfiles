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
├── .zshrc              # Zsh interactive (oh-my-zsh + sources .bashrc_private + .shell_common)
└── nvim/
    ├── init.lua        # Neovim config (lazy.nvim, catppuccin, fzf, treesitter)
    └── lazy-lock.json  # Plugin version lock file
```

## Installation

```bash
git clone https://github.com/bowang168/dotfiles.git ~/dotfiles

# Shell config
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.shell_common ~/.shell_common
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.zshrc ~/.zshrc

# Secrets (copy template, fill in real values)
cp ~/dotfiles/.bashrc_private.example ~/.bashrc_private
chmod 600 ~/.bashrc_private

# Neovim
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
```

## Dependencies

| Tool | Purpose | Required |
|------|---------|----------|
| [neovim](https://neovim.io/) | Text editor | Yes |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder | Yes |
| [bat](https://github.com/sharkdop/bat) | `cat` replacement with syntax highlighting | Optional (macOS) |
| [oh-my-zsh](https://ohmyz.sh/) | Zsh framework for themes and plugins | Yes (for zsh) |
| [tree](https://mama.indstate.edu/users/ice/tree/) | Directory listing | Optional |

## License

[MIT](LICENSE)

## Support This Project

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)
