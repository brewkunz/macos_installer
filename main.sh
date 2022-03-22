# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Install
###############################################################################

# Install all available updates
echo "Installing available updates..."
# sudo softwareupdate -ia --verbose

# Install apps and tools
installers


###############################################################################
# Configure
###############################################################################

# Configure system preferences
prefs

# Configure apps
AFFECTED_APPS=()
for pane in "cfprefsd" "SystemUIServer" "Dock" "SpeechSynthesisServer"; do
  AFFECTED_APPS+=("$pane")
done
apps

# Quit any open affected apps
get_open_affected_apps
quit_apps

prompt_restart
