# jwon's dotfiles
This is probably only ever useful for myself but feel free to be inspired by whatever snippets you find in here.

To get started, please follow the steps below:

## Install kitty
### OS X:
```
brew install --cask kitty
```

### Ubuntu-based distro:
```
sudo apt install kitty
```

## Install bat
### OS X:
```
brew install bat
```

### Ubuntu-based distro:
```
sudo apt install bat
```

## Install ripgrep
### OS X:
```
brew install ripgrep
```

### Ubuntu-based distro:
```
sudo apt install ripgrep
```

## Install GNU stow
### OS X:
```
brew install stow
```
### Ubuntu-based distro:
```
sudo apt install stow
```

## Install Nerd Fonts patched font
### OS X:
```
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font-mono
```
### Ubuntu-based distro:

Download the patched Fira Code font files:
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
```
mkdir ~/.local/share/fonts
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv
```

## Install Keybase
https://keybase.io/download

## Import gpg keys from keybase
Import public key:
```
keybase pgp export | gpg --import
```
Import private key:
```
keybase pgp export --secret | gpg --allow-secret-key --import
```

## Generate new SSH Key for machine
```
ssh-keygen -t ed25519
```

## Add new SSH key to Github
https://github.com/settings/keys

## Checkout dotfiles
*Make sure you check out the dotfiles in the root of your home directory*
```
cd ~
git clone git@github.com:jwon/dotfiles.git
```

## Setup git configs
```
cd ~/dotfiles
stow git
```

## Setup vim configs
```
cd ~/dotfiles
stow vim
```
Then open `vim` to automatically setup/install the configuration.

## Setup kitty configs
```
cd ~/dotfiles
stow kitty
```

## Install zsh
### OS X:

*Should be automatically defaulted starting from Catalina*

### Ubuntu-based distro:
```
sudo apt install zsh
chsh -s $(which zsh)
```
Install "Oh My Zsh" afterwards: https://ohmyz.sh/

Install "zsh-autosuggestions" afterwards: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
