# Custom .zshrc file
# Compatible with macOS (oh-my-zsh)
# Edited by Akio on 2025-08

# ================================
# Oh My Zsh Configuration
# ================================
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"

# Disable automatic updates (manage manually)
zstyle ':omz:update' mode disabled

# History timestamp format (ISO 8601)
HIST_STAMPS="yyyy-mm-dd"

# Plugins
plugins=(
    git
    colored-man-pages
    colorize
)
# Plugin notes:
#   colorize     - ccat / cless (syntax-highlighted cat/less)
#   colored-man-pages - colored output for man and git help

source "$ZSH/oh-my-zsh.sh"

# ================================
# User Configuration
# ================================

# Source bash aliases and functions
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Project directories for pj plugin
PROJECT_PATHS=("$HOME/Desktop/Projects" "$HOME/c")

# Local binaries
export PATH="$HOME/.local/bin:$PATH"

# ================================
# Tool-specific Configuration
# ================================

# OpenClaw CLI completion
if [ -f "$HOME/.openclaw/completions/openclaw.zsh" ]; then
    source "$HOME/.openclaw/completions/openclaw.zsh"
fi

# Whisper.cpp model path
export WHISPER_CPP_MODEL=/opt/homebrew/share/whisper-cpp/ggml-large-v3-turbo.bin

# Allow Obsidian to access Ollama
export OLLAMA_ORIGINS="app://obsidian.md*"
