#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#######################
# DOCKER INSTALLATION #
#######################
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do
    watch_execution "" sudo apt-get remove $pkg
done

# Add Docker's official GPG key:
watch_execution "" sudo apt-get update
watch_execution "" sudo apt-get install ca-certificates curl
watch_execution "" sudo install -m 0755 -d /etc/apt/keyrings
watch_execution "" sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
watch_execution "" sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
watch_execution "" bash -c '
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo ${UBUNTU_CODENAME:-$VERSION_CODENAME}) stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
'

watch_execution "" sudo apt-get update
install_packages docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

######################
# ZSH CONFIGURARTION #
######################

watch_execution "" git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.config/oh-my-zsh
# chsh -s $(which zsh) && zsh # TODO: execute this command at the end of the ubuntu.sh
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.backup
cp "$SCRIPT_DIR/config/.zshrc" ~/.zshrc
cp -f "$SCRIPT_DIR/config/.zshenv" ~/.zshenv
mkdir -p ~/.config/zsh
cp -r "$SCRIPT_DIR/config/zsh/." ~/.config/zsh/
watch_execution "" git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/zsh-autosuggestions
watch_execution "" git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.config/oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
watch_execution "" git clone https://github.com/reobin/typewritten.git ~/.config/zsh/typewritten

#######################
# ZOXIDE INSTALLATION #
#######################

watch_execution "" curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

#######################
# TMUX CONFIGURARTION #
#######################
cp -r "$SCRIPT_DIR/config/tmux" ~/.config/tmux
tmux source-file ~/.config/tmux/tmux.conf

#########################
# NEOVIM CONFIGURARTION #
#########################
cp -r "$SCRIPT_DIR/config/nvim" ~/.config/nvim
cp "$SCRIPT_DIR/config/.vimrc" ~/.vimrc

####################
# EZA INSTALLATION #
####################
watch_execution "" sudo apt update
install_packages gpg
watch_execution "" sudo mkdir -p /etc/apt/keyrings
watch_execution "" bash -c \
    'wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg'
watch_execution "" bash -c \
    'echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list'
watch_execution "" sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
watch_execution "" sudo apt update
install_packages eza
