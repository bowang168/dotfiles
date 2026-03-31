# ============================================================================
# .zshrc — interactive zsh sessions
# Requires: oh-my-zsh, zsh-syntax-highlighting, zsh-autosuggestions
# ============================================================================

# --- Oh My Zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"
zstyle ':omz:update' mode disabled
HIST_STAMPS="yyyy-mm-dd"

plugins=(
    git
    colored-man-pages
    fzf
    colorize
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

# --- Catppuccin colors for zsh-syntax-highlighting ---
if [[ "$(cat ~/.theme_mode 2>/dev/null)" == "light" ]]; then
    source "$HOME/.zsh/catppuccin/latte.zsh"
else
    source "$HOME/.zsh/catppuccin/mocha.zsh"
fi

# --- Private env vars (API keys, secrets) ---
[ -f "$HOME/.bashrc_private" ] && source "$HOME/.bashrc_private"

# --- Shared aliases and functions ---
[ -f "$HOME/.shell_common" ] && source "$HOME/.shell_common"

# --- zsh-only config ---
PROJECT_PATHS=($HOME/Desktop/Projects ~/c)

# --- Optional tool integrations ---
[ -f "$HOME/.openclaw/completions/openclaw.zsh" ] && source "$HOME/.openclaw/completions/openclaw.zsh"

export WHISPER_CPP_MODEL=/opt/homebrew/share/whisper-cpp/ggml-large-v3-turbo.bin
export OLLAMA_ORIGINS="app://obsidian.md*"
