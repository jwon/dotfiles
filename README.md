# jwon's dotfiles
This is probably only ever useful for myself but feel free to be inspired by whatever snippets you find in here.

To get started, please follow the steps below:

## Install GNU stow
OS X:
```
brew install stow
```
Ubuntu-based distro:
```
sudo apt install stow
```

## Install fonts
OS X:
```
brew tap homebrew/cask-fonts
brew cask install font-firacode-nerd-font-mono
```

## Check out dotfiles
*Make sure you check out the dotfiles in the root of your home directory*
```
cd ~
git clone https://github.com/jwon/dotfiles.git
```

## Set up git configs
```
cd ~/dotfiles
stow git
```

## Set up vim configs
```
cd ~/dotfiles
stow vim
```
Then open `vim` to automatically setup/install the configuration.
