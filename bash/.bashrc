
# Custom .bashrc file
# Compatible with macOS and Linux
# Edited by bowang168 on 2025-Aug

## For MacOS 
############################################################
# Check for macOS and source macOS-specific configurations
if [[ "$(uname)" == 'Darwin' ]]; then
    # Source macOS-specific bash configurations if available

    #alias t='open -a /Applications/TextEdit.app -n '	

    # Cleanup .DS_Store files recursively
    alias dstore-clean='find . -type f -name .DS_Store -print0 | xargs -0 rm'

    # Empty the Trash on all mounted volumes and the main HDD
    # Also, clears Apple’s System Logs to improve shell startup speed
    alias emptytrash='sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl'

    # Show/hide hidden files in Finder
    alias showdotfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
    alias hidedotfiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'

    # Run screensaver on the Desktop
    alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

    # Hide/show all desktop icons (useful for presentations)
    alias showdeskicons='defaults write com.apple.finder CreateDesktop -bool true && killall Finder'
    alias hidedeskicons='defaults write com.apple.finder CreateDesktop -bool false && killall Finder'

    # Open any file in MacOS Quicklook Preview
    ql () { qlmanage -p "$*" >& /dev/null; }

fi

cdf () {
    # Use AppleScript to get the current Finder window's path or the desktop if Finder isn't open
    currFolderPath=$( /usr/bin/osascript <<EOT
        tell application "Finder"
            try
        set currFolder to (folder of the front window as alias)
            on error
        set currFolder to (path to desktop folder as alias)
            end try
            POSIX path of currFolder
        end tell
EOT
    )
    echo "cd to \"$currFolderPath\""
    cd "$currFolderPath"
}

## ARCHIVE EXTRACTOR
############################################################
# usage: extract <file>
extract ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
            *.gz)        gunzip $1    ;;
            *.tar)       tar xf $1    ;;
            *.tbz2)      tar xjf $1   ;;
            *.tgz)       tar xzf $1   ;;
            *.zip)       unzip $1     ;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1      ;;
            *)           echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


# ================================
# Load private settings if available
# ================================
if [ -f "$HOME/.bashrc_private" ]; then
    source "$HOME/.bashrc_private"
else
    echo "Warning: ~/.bashrc_private not found."
fi

# ================================
# Proxy Configuration
# ================================
# Function to set or unset proxy settings
# Usage:
#   proxyset [us|au|cn|off]
proxyset() {
    case "$1" in
        us|au|cn)
            export http_proxy="http://${proxy_servers[$1]}:80"
            export https_proxy="http://${proxy_servers[$1]}:80"
            export ftp_proxy="http://${proxy_servers[$1]}:80"
            export RSYNC_PROXY="http://${proxy_servers[$1]}:80"
            echo "Proxy set to $1"
            ;;
        off)
            unset http_proxy
            unset https_proxy
            unset ftp_proxy
            unset RSYNC_PROXY
            echo "Proxy settings cleared"
            ;;
        *)
            echo "Invalid option. Use 'us', 'au', 'cn', or 'off'."
            ;;
    esac
}

# Function to read values from ssh_hosts associative array
get_conf() {
    local key="$1"
    echo "${ssh_hosts[$key]}"
}

# ---------- ISDE ----------
# alias isde7_31="ssh -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol7_31) zsh"
alias isde7_33="ssh -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol7_33) zsh"
alias isde8_27="ssh -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol8_27) zsh"
# alias isde8_29="ssh -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol8_29) zsh"

# ---------- CMOS ----------
alias cisde7_09="ssh -m hmac-sha2-512 -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol7_09) zsh"   # ol7 x86_64
#alias cisde7_12="ssh -m hmac-sha2-512 -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol7_12) zsh"  # ol7 x86_64
alias cisde8_10="ssh -m hmac-sha2-512 -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol8_10) zsh"  # ol8 x86_64
#alias cisde8_13="ssh -m hmac-sha2-512 -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol8_13) zsh"  # ol8 x86_64
alias cisde8arm_03="ssh -m hmac-sha2-512 -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol8arm_03) zsh" # ol8 arm
#alias isde04_ol8arm="ssh -m hmac-sha2-512 -J $(get_conf guid)@$(get_conf REDACTED_JUMP) -t $(get_conf guid)@$(get_conf REDACTED_SERVER_ol8arm_04) zsh" # ol8 arm

# -------- Useful Examples --------
# scp -o ProxyJump=${guid}@${REDACTED_JUMP} oh-my-zsh.tar.bzip2 ${guid}@${REDACTED_SERVER_ol7_09}:~/

# alias c6='ssh -t -oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedAlgorithms=+ssh-rsa <user>@x.x.x.x sudo su - root'

# alias c7='ssh -t <user>@x.x.x.x sudo su - root'

# alias nopwd='for server in server1 server2 server3 ; do cat ~/.ssh/id_ed25519.pub | ssh ${guid}@$server "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"; done'

# alias dns.work='sudo -u root sh -c "cp /etc/resolv.conf.work /etc/resolv.conf && echo DNS work done, enjoy-working"'
# alias dns.home='sudo -u root sh -c "cp /etc/resolv.conf.bak /etc/resolv.conf && echo DNS restored, enjoy-life"'



# ================================
# For Normal Linux
# ================================

# Determine the operating system
OS_TYPE="$(uname)"

# Enhanced navigation aliases
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../.."

# Improved directory listing with cross-platform compatibility
if [ "$OS_TYPE" = "Darwin" ]; then
    # macOS: Define 'ls' and 'tree' aliases with macOS-compatible options
    alias ll='ls -lhAF'   # List almost all files, including hidden
    alias la='ls -lha'    # List all files
    alias lc='ls -lhaC'   # List all files in columns
    alias lr='ls -lhAR'   # Recursive ls
    alias lf='ls -ld */'  # List only directories
    
    # Tree command replacement for macOS (using 'find' as a fallback if 'tree' is not installed)
    alias l2='find . -maxdepth 2 -print | sort'
    alias l3='find . -maxdepth 3 -print | sort'
    alias l4='find . -maxdepth 4 -print | sort'

    # Remove files interactively
    alias rm='rm -iv'  
else
    # Linux: Use GNU 'ls' and 'tree' with full options
    cd() {
        builtin cd "$@" && ls -lhA --group-directories-first
    }
    alias l.='ls -d .* --group-directories-first'  # List only hidden files
    alias ll='ls -lhA --group-directories-first'   # List almost all files, including hidden
    alias la='ls -lha --group-directories-first'   # List all files
    alias lc='ls -lhAC --group-directories-first'  # List all files in columns
    alias lr='ls -lhAR --group-directories-first'  # Recursive ls
    alias lf='ls -ld */ --group-directories-first' # List only directories
    
    # Tree view aliases
    alias l2='tree -C . -L 2'
    alias l3='tree -C . -L 3'
    alias l4='tree -C . -L 4'

    
    alias rm='rm -iv --preserve-root'              # Remove files interactively, with root protection
    alias hd='od -Ax -tx1z -v'                     # Hex dump of files
fi

# System information and management
alias cal='cal -3'                                # Display 3 months calendar

# File operations with safety features and convenience
alias mv='mv -iv'                                 # Move files with verbose and interactive
alias cp='cp -iv'                                 # Copy files interactively and verbose
alias mkdir='mkdir -pv'                           # Create directories with verbose, including parents as needed

# Miscellaneous
alias more=less                                   # Use less as more
alias which='type -a'                             # Show all locations of commands
alias dig="dig +noall +answer"                    # Simplified dig output
alias fix_stty='stty sane'                        # Restore terminal settings
alias vi='vim'                                    # Use Vim for vi

# Localization and formatting
alias cman='LANG=zh_CN.UTF-8 man -S 2:3:1:4:5:6:7:8' # Chinese man pages
alias diff='LC_ALL=C TZ=GMT0 diff -Naur'             # Normalized diff for distribution

# Include scripts on ISDE
export PATH=$PATH:/REDACTED_PATH/bin

# CRASH script  on the CMOS Linux instances
export PATH=$PATH:/REDACTED_PATH/bin:/REDACTED_PATH/isde_tools/DevWorkspace/REDACTED_TOOLS/Linux_tools/bin

alias vpnui=/opt/cisco/secureclient/bin/vpnui

# Unified Custom Function for Accessing ISDE/CMOS log SR files
############################################################
cff() {
    if command -v REDACTED_AGENT >/dev/null 2>&1; then
        REDACTED_AGENT -x SR "$1" && cd /REDACTED_PATH/isde/SR/"$1"/
    elif command -v REDACTED_CLIENT >/dev/null 2>&1; then
        REDACTED_CLIENT access sr "$1" && cd /REDACTED_PATH/isde/sr/"$1"/
    else
        echo "Error: neither REDACTED_AGENT nor REDACTED_CLIENT found in PATH." >&2
        return 1
    fi
}
