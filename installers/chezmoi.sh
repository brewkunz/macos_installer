###############################################################################
# ChezMoi
###############################################################################

# Find a way to safely set my github Personal Access token

# Fetch and apply chezmoi dotfiles
chezmoi init --apply https://github.com/baikunz/dotfiles.git -S $HOME/.dotfiles

# Install znap
git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $HOME/.config/zsh/modules/zsh-snap
source $HOME/.config/zsh/modules/zsh-snap/install.zsh
