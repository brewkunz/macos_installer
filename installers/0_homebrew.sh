###############################################################################
# Homebrew
###############################################################################

# Install Homebrew if not installed - brew.sh
if ! hash brew 2>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Homebrew already installed... Skipping installation."
fi


# Update Homebrew
echo "Updating Homebrew..."
brew update
brew upgrade


# Install CLI tools & GUI applications
echo "Installing tools and apps..."
brew bundle --file=- <<EOF
# Set global configuration arguments
cask_args appdir: "/Applications"

# Taps
tap "homebrew/cask"
tap "homebrew/cask-fonts"
tap "homebrew/cask-versions"
tap "homebrew/bundle"
tap "homebrew/core"


# Cask dependencies
brew "mas"


# Shells
brew "zsh"


# CLI utilities
# Note: This replaces some (outdated) built-in macOS utilities with the GNU equivalents
# Don't forget to add "$(brew --prefix coreutils)/libexec/gnubin" to "$PATH".
brew "coreutils"
brew "git"
brew "tmux"
brew "chezmoi"
brew "nvim"


# Other useful tools
brew "reattach-to-user-namespace" # Copy/paste for tmux


# Install GUI applications
cask "iterm2"
cask "google-chrome"
cask "the-unarchiver"
cask "1password"
cask "alfred"
cask "hyperswitch"
cask "bettertouchtool"
cask "little-snitch"
cask "appcleaner"
cask "adguard"
cask "google-drive"
# cask "bartender"
# cask "istat-menus"

# Dev Apps
cask "docker"
cask "phpstorm"
# cask "postico"
# cask "sequel-pro"


# MAS applications
mas "OneNote", id: 784801555
EOF


# Remove outdated versions from the cellar including casks
brew cleanup
