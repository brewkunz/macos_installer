# Check for open application
function get_open_affected_apps {
  open_apps=()

  # Store the open apps in an array
  for app in "${AFFECTED_APPS[@]}"; do
    (( $(osascript -e "tell app \"System Events\" to count processes whose name is \"${app}\"") > 0 )) \
    && open_apps+=("$app")
  done

  echo "The following open applications will be affected:"

  # Print the open apps in columns
  printf -- '%s\n' "${open_apps[@]}" | column -x

  echo "Would you like to quit these apps now? [Y/n] "
}

# Quit affected applications
function quit_apps {
  for app in "${AFFECTED_APPS[@]}"; do
    case "$app" in
      'Quick Look')
        # Restart Quick Look
        qlmanage -r
        ;;
      *)
        killall "$app" &>/dev/null
        # osascript -e "tell application \"${app}\" to quit"
        ;;
    esac
  done
}

# Prompt if user wants to restart the machine
function prompt_restart {
  echo "Done. Note that some of these changes require a logout/restart to take effect."
  read -p "Would you like to restart the computer now? [Y/n] " -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
      osascript -e 'tell app "System Events" to restart'
  fi
}
