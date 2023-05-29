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

## Install Keybase
### OS X:
```
brew install --cask keybase
```
### Ubuntu-based distro:
```
https://keybase.io/download
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

## Setup kitty configs
### OS X:
```
cd ~/dotfiles
stow kitty-osx
```
### Ubuntu-based distro:
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

## Install Logitech Options
### OS X:
```
brew install --cask logi-options-plus
```
### Ubuntu-based distro:
```
N/A
```

## Install iStat Menus
### OS X:
```
brew install --cask istat-menus
```

## Install & Configure Yabai & skhd
```
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
cd ~/dotfiles
stow skhd
stow yabai
```
Restart afterwards and make sure everything is working

## Install & Configure xbar
```
brew install --cask xbar
```
Install Plugin: https://github.com/matryer/xbar-plugins/blob/main/Tools/yabai.365d.sh
For some reason I needed to use absolute paths for both yabai & jq to get the plugin to work. Probably a path issue.


## Install Neovim
### OS X:
```
brew install neovim
```
### Ubuntu-based distro:
```
N/A
```

## Install fzf
### OS X:
```
brew install fzf
```

## Install LunarVim
https://www.lunarvim.org/docs/installation
Install cargo:
https://doc.rust-lang.org/cargo/getting-started/installation.html
### OS X:
```
Blah
```
### Ubuntu-based distro:
```
N/A
```
