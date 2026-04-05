#!/bin/bash

# Detect language
L=$([[ "$LANG" == es* ]] && echo "es" || echo "en")

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Helper to get messages from JSON using python3 (pre-installed on macOS)
get_msg() {
    python3 -c "import json,sys; print(json.load(open('i18n/messages.json'))['$L']['$1'])"
}

echo -e "${BLUE}$(get_msg START)${NC}"

# 1. Homebrew
if ! command -v brew &> /dev/null; then
    echo -e "${BLUE}$(get_msg BREW_INSTALL)${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${GREEN}$(get_msg BREW_OK)${NC}"
fi

# 2. Brewfile
if [ -f "Brewfile" ]; then
    echo -e "${BLUE}$(get_msg BUNDLE)${NC}"
    brew bundle --file=Brewfile
fi

# 3. Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${BLUE}$(get_msg OMZ_INSTALL)${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${GREEN}$(get_msg OMZ_OK)${NC}"
fi

# 4. Symlinks
echo -e "${BLUE}$(get_msg LINKS)${NC}"
DOTFILES_DIR="$(pwd)/dotfiles"
MODULES_DIR="$(pwd)/modules"

link_file() {
    local src=$1
    local dest=$2
    if [ -f "$dest" ] || [ -L "$dest" ]; then
        mv "$dest" "${dest}.backup" 2>/dev/null
    fi
    ln -s "$src" "$dest"
}

link_file "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
link_file "$DOTFILES_DIR/p10k.zsh" "$HOME/.p10k.zsh"
[ -f "$DOTFILES_DIR/zshenv" ] && link_file "$DOTFILES_DIR/zshenv" "$HOME/.zshenv"
[ -f "$DOTFILES_DIR/fzf.zsh" ] && link_file "$DOTFILES_DIR/fzf.zsh" "$HOME/.fzf.zsh"

# Yabai, skhd, Sketchybar, Borders
CONFIG_REPO_DIR="$(pwd)/config"
mkdir -p "$HOME/.config/sketchybar"
mkdir -p "$HOME/.config/borders"

link_file "$CONFIG_REPO_DIR/yabai/yabairc" "$HOME/.yabairc"
link_file "$CONFIG_REPO_DIR/skhd/skhdrc" "$HOME/.skhdrc"
link_file "$CONFIG_REPO_DIR/sketchybar/sketchybarrc" "$HOME/.config/sketchybar/sketchybarrc"
link_file "$CONFIG_REPO_DIR/borders/bordersrc" "$HOME/.config/borders/bordersrc"

# Lazydocker config
LAZYDOCKER_CONFIG_DIR="$HOME/Library/Application Support/lazydocker"
mkdir -p "$LAZYDOCKER_CONFIG_DIR"
link_file "$DOTFILES_DIR/lazydocker-config.yml" "$LAZYDOCKER_CONFIG_DIR/config.yml"

# 5. Secrets
echo -e "${BLUE}$(get_msg SECRETS)${NC}"
if [ -f ".env" ]; then
    cp .env "$HOME/.env"
elif [ -f ".env.example" ]; then
    cp .env.example "$HOME/.env"
fi

# 6. Modules folder
[ -d "$HOME/.zsh_modules" ] && mv "$HOME/.zsh_modules" "$HOME/.zsh_modules.backup" 2>/dev/null
ln -s "$MODULES_DIR" "$HOME/.zsh_modules"

echo -e "${BLUE}$(get_msg DONE)${NC}"
echo -e "${YELLOW}$(get_msg FONT_WARN)${NC}"
