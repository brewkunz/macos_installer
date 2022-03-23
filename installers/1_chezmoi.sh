###############################################################################
# ChezMoi
###############################################################################

# Find a way to safely set my github Personal Access token

# Fetch and apply chezmoi dotfiles
chezmoi init --apply https://github.com/baikunz/dotfiles.git -S $HOME/.dotfiles

# Install znap
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $HOME/.config/zsh/modules/zsh-snap
source $HOME/.config/zsh/modules/zsh-snap/install.zsh

# Update dotfiles repo url to use ssh since we now have synced the ssh key
chezmoi git -- remote set-url origin git@github.com:baikunz/dotfiles.git
