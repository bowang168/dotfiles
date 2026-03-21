# dotfiles

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)

Personal configuration files for Bash, Zsh, and Vim. Designed to work on both macOS and Oracle Linux.

## Structure

```
dotfiles/
├── bash/
│   ├── .bashrc            # Bash config (aliases, functions, proxy, SSH)
│   └── .bashrc_private    # Private settings (not tracked)
├── vim/
│   └── .vimrc             # Vim config (interface, search, indentation)
└── zsh/
    ├── .zshrc             # Zsh config (oh-my-zsh, plugins, theme)
    └── oh-my-zsh.tar.bzip2  # Portable oh-my-zsh archive (not tracked)
```

## Installation

```bash
git clone https://github.com/bowang168/dotfiles.git ~/dotfiles

# Bash
ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc

# Vim
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

# Zsh
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
```

Create `~/.bashrc_private` for machine-specific settings (proxy servers, SSH hosts, etc.).

## Dependencies

| Tool | Purpose | Required |
|------|---------|----------|
| [bat](https://github.com/sharkdp/bat) | `cat` replacement with syntax highlighting | Optional (macOS) |
| [oh-my-zsh](https://ohmyz.sh/) | Zsh framework for themes and plugins | Yes (for zsh) |
| [tree](https://mama.indstate.edu/users/ice/tree/) | Directory listing | Optional |
| vim | Text editor | Yes (for vimrc) |

## License

[MIT](LICENSE)

## Support This Project

[![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-support-yellow?style=flat-square&logo=buy-me-a-coffee)](https://buymeacoffee.com/bowang168)
[![Sponsor](https://img.shields.io/badge/GitHub%20Sponsors-sponsor-ea4aaa?style=flat-square&logo=github-sponsors)](https://github.com/sponsors/bowang168)
