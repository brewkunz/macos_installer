##################################################################################
# HyperSwitch
##################################################################################

# Run in background
defaults write com.bahoom.HyperSwitch run_in_background -bool true

# Use shift to cycle backward
defaults write com.bahoom.HyperSwitch shift_to_cycle_backwards -bool true

# Disable all windows switch hotkey
defaults write com.bahoom.HyperSwitch window_switcher_enabled -bool false

# Use option + tab to swtich between windows of the same app
defaults write com.bahoom.HyperSwitch window_switcher_current_app_keycode -int 48
