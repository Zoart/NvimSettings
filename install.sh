#!/bin/bash

# Update system
sudo dnf update -y

# Install Neovim
sudo dnf install neovim -y

# Install vim-plug for plugin management
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Node.js and npm (using the latest LTS version)
curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
sudo dnf install -y nodejs

# Install Python 3 and pip
sudo dnf install python3 python3-pip -y

# Install language servers
sudo npm install -g pyright
sudo npm install -g typescript typescript-language-server
sudo npm install -g vscode-html-languageserver-bin
sudo npm install -g vscode-css-languageserver-bin
sudo npm install -g bash-language-server
sudo npm install -g vscode-json-languageserver

# Install clangd as part of clang-tools-extra
sudo dnf install clang-tools-extra -y

# Install python-lsp-server with all extras
pip install 'python-lsp-server[all]'

# Print success message
echo "Installation completed. Open Neovim and run :PlugInstall to install the plugins."

