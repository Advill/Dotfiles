INSTALL_DIRECTORY="~/installs/"
mkdir -p $INSTALL_DIRECTORY

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## hyperzsh
mkdir $ZSH_CUSTOM/themes
wget -O $ZSH_CUSTOM/themes/hyperzsh.zsh-theme \
  https://raw.githubusercontent.com/tylerreckart/hyperzsh/master/hyperzsh.zsh-theme

# neovim
if ! [ -x "$(command -v nvim)" ]; then
  if [[ -x "$(command -v pacman)" ]]; then
    echo "pacman detected, install nvim yourself."
  else
    mkdir -p $INSTALL_DIRECTORY/nvim
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
    chmod u+x nvim.appimage
  fi
fi
