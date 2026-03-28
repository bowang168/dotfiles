# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
zstyle ':omz:update' mode disabled
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    git
    colored-man-pages
    z
    fzf
    colorize
)

source $ZSH/oh-my-zsh.sh

# ================================
# Private env vars (API keys, secrets) — MUST be before .shell_common
# ================================
[ -f "$HOME/.bashrc_private" ] && source "$HOME/.bashrc_private"

# ================================
# Shared aliases and functions
# ================================
[ -f "$HOME/.shell_common" ] && source "$HOME/.shell_common"

# ================================
# zsh-only config
# ================================
PROJECT_PATHS=($HOME/Desktop/Projects ~/c)

# OpenClaw Completion
[ -f "$HOME/.openclaw/completions/openclaw.zsh" ] && source "$HOME/.openclaw/completions/openclaw.zsh"

export WHISPER_CPP_MODEL=/opt/homebrew/share/whisper-cpp/ggml-large-v3-turbo.bin
export OLLAMA_ORIGINS="app://obsidian.md*"
