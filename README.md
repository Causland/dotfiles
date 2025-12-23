# Causland's dotfiles
This repo contains all of the dotfile configuration files that I typically use for development.

## nvim Config
Here are some quick steps to setting up nvim.

1. Install the latest stable nvim and add an alias.
```
mkdir -p ~/apps && cd ~/apps
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
chmod +x nvim-linux-x86_64.appimage
echo "alias nvim='~/apps/nvim-linux-x86_64.appimage'" >> ~/.bashrc
```

2. Install pre-requisites for nvim plugins.
```
sudo apt install gcc g++ clangd pip python3-pynvim npm unzip luarocks xclip ripgrep fd-find fzf
sudo npm install -g tree-sitter-cli neovim
```
3. Copy the nvim/ folder of this repo to ~/.config/.

## tmux Config
Here are some quick steps to set up tmux.

1. Install the lastest tmux and add alias.
```
sudo apt install tmux
echo "alias tn='tmux -u -f ~/.config/tmux/tmux.conf new'" >> ~/.bashrc
echo "alias ta='tmux -u -f ~/.config/tmux/tmux.conf attach'" >> ~/.bashrc
echo "alias tl='tmux list-sessions'" >> ~/.bashrc
```

2. Copy the tmux/ folder of this repo to ~/.config/.

## .editorconfig
The editorconfig file in this repo can be placed in the root directory of any new c or cpp project. This will allow nvim to follow these rules.
