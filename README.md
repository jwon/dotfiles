# jwon's dotfiles
This is probably only ever useful for myself but feel free to be inspired by whatever snippets you find in here.

To get started, please follow the steps below:

## Package installation
### OS X
```
brew install --cask ghostty choosy discord monitorcontrol orion istat-menus logi-options-plus
brew install less git-delta bat ripgrep stow neovim fzf
```

### Ubuntu-based distro:
```
sudo apt install bat ripgrep stow
```

## Install Nerd Fonts patched font
### OS X:
```
brew tap homebrew/cask-fonts
brew install --cask font-caskaydia-cove-nerd-font
```

or if you want to install your own font, but use Nerd Fonts for symbols only:

1. Install `Symbols Nerd Font`: https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/NerdFontsSymbolsOnly.zip
2. Install your custom font. I currently use Comic Code: https://tosche.net/fonts/comic-code

### Ubuntu-based distro:

Download the patched Fira Code font files:
https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
```
mkdir ~/.local/share/fonts
unzip FiraCode.zip -d ~/.local/share/fonts
fc-cache -fv
```

## Install GPG
### OS X:
```
brew install gpg
```
### Ubuntu-based distro:
```
TBD
```

## Import gpg keys from keybase
Import public key:
```
keybase pgp export | gpg --import
```

Import private key:
```
keybase pgp export --secret | gpg --allow-secret-key --import
```
Make sure these env vars are set:
```
GPG_TTY=$(tty)
export GPG_TTY
```

## Generate new SSH Key for machine
```
ssh-keygen -t ed25519
ssh-add ~/.ssh/id_ed25519
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

## Setup Ghostty configs
```
cd ~/dotfiles
stow ghostty
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

## Setup zsh configs
### OS X:
```
cd ~/dotfiles
stow zsh-osx
```
### Ubuntu-based distro:
```
cd ~/dotfiles
stow zsh
```

## Install cargo/rust
https://doc.rust-lang.org/cargo/getting-started/installation.html
