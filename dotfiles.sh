#! /usr/bin/bash

# Check if the script is run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    apt install stow -y
fi

# Check if dotfiles repo has been cloned
if [ -d $HOME/git/dotfiles/ ]; then
  echo "dotfiles"
  cd $HOME/git/dotfiles/
  git pull
else
  git clone https://github.com/Weiberle17/dotfiles dotfiles
fi

# Setup submodules the right way
cd $HOME/git/dotfiles/
git submodule init
git submodule update

# Remove all symlinks or files
# rm -r $HOME/.config/awesome
# rm -r $HOME/.bashrc
# rm -r $HOME/.bash_aliases
# rm -r $HOME/.bash_profile
# rm -r $HOME/.inputrc
# rm -r $HOME/.config/kitty
# rm -r $HOME/.config/nvim
# rm -r $HOME/.config/rofi
# rm -r $HOME/.config/starship.toml
# rm -r $HOME/.tmux.conf
# rm -r $HOME/.xinitrc
# rm -r $HOME/.config/zathura
# rm -r $HOME/.zshrc
# rm -r $HOME/.zsh_aliases

# Comment out the ones you don't want
# stow -t $HOME -v awesome/
# stow -t $HOME -v bash/
# stow -t $HOME -v input/
# stow -t $HOME -v kitty/
# stow -t $HOME -v nvim/
# stow -t $HOME -v rofi/
# stow -t $HOME -v starship/
# stow -t $HOME -v tmux/
# stow -t $HOME -v xfiles/
# stow -t $HOME -v zathura/
# stow -t $HOME -v zsh/

# Give Infos about rest of setup
echo "############################################################################"
echo "Reload AwesomeWM with Super+Ctrl+R"
echo "Update packer.nvim"
echo "(cd ~/.config/nvim/ - v lua/weiberle/packer.nvim - safe the file)"
echo "Afterwards the setup should be completed"
