#!/bin/bash

# install git and curl
sudo apt update
sudo apt -y install git curl

# setup termnal
sudo apt -y install zsh
sudo chsh --shell "$(which zsh)"

# clone dotfiles
git clone https://github.com/Myxogastria0808/server-dotfiles.git
mv server-dotfiles dotfiles

# install starship
curl -sS https://starship.rs/install.sh | sh
# symbolic link
ln -s $HOME/dotfiles/home/config/zsh/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/home/config/nvim/astronvim $HOME/.config/nvim
ln -s $HOME/dotfiles/home/config/zsh/oh-my-zsh $HOME/.config/oh-my-zsh
ln -s $HOME/dotfiles/home/config/starship.toml $HOME/.config/starship.toml

sudo reboot now

#install nix
curl -L https://nixos.org/nix/install | sh -s -- --daemon

sudo reboot now

# setup nixpkgs, home-manger
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
rm -rf $HOME/.config/home-manager
ln -s $HOME/dotfiles/home $HOME/.config/home-manager
# home-manager switch
home-manager switch

# delete prepare apt pkgs
sudo apt -y remove git curl

# install languages
sudo apt -y install gcc g++
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# setup alacritty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50

# start zsh
echo exec zsh >> ~/.bashrc

# set locale
sudo apt install locales-all
sudo update-locale LC_ALL="ja_JP.UTF-8"
sudo update-locale LANGUAGE="ja_JP:ja"
sudo update-locale LANG="ja_JP.UTF-8"

