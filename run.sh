#/bin/bash bash

################CONFIGUTATION START########################
brew=(
  awscli 
  cheat
  gnu-sed --with-default-names
  gpg
  openssl
  python
  vim --with-override-system-vi
  wget --with-iri
  cask
)

cask=(
  1password
  alfred
  flux
  google-chrome
  google-backup-and-sync  
  iterm2
  java
  nordvpn
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlstephen
  quicklook-json
  slack
  sublime-text
  virtualbox
  vlc
)


################ CONFIGUTATION END ########################

echo Installing xcode? [Y/N]
read -n 1 input
if [$input == "y"]; then
  echo ****Installing xcode start****
  xcode-select --install
else
  echo "Skipping xcode-select"
fi
echo ****Installing brew start****
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ****Updating brew start****
brew update

echo **** install ${brew[@]} ****
brew **** install ${brew[@]} ****
brew cask install ${cask[@]}
brew link openssl --force

echo ****Install Oh My ZSH****
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo ****changing theme ****
echo **** see https://github.com/agnoster/agnoster-zsh-theme****
sed -i 's/ZSH_THEME="[a-zA-Z]*"/ZSH_THEME="agnoster"/g' zsh

echo ****Install Font ****
echo ***User Roboto Thin****
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts



which = $(which pip)
echo ${which}

echo ****update pip start****
pip install --upgrade pip

echo ****update pip finish****

echo ****Install RVM****
curl -sSL https://get.rvm.io | bash -s stable --ruby

echo ****install awscli start****
sudo -H  pip install awscli --upgrade --ignore-installed six
echo ****install awscli finish****

#Support bigger file size. default is 100k
defaults write com.whomwah.quicklookstephen maxFileSize 1024000

echo **** Disable sound on boot ****
sudo nvram SystemAudioVolume=" "

echo **** Disble time machine when new media inserted to the system ****
sudo defaults write /Library/Preferences/com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo **** Disable bouncing on dock ****
defaults write com.apple.dock no-bouncing -bool false
killall Dock

echo **** Show file extention ****
defaults write -g AppleShowAllExtensions -bool true

echo ****  Don\'t write DS_Store file on USB and network drive ****
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Cleanup"
brew cleanup
brew cask cleanup

#https://apple.stackexchange.com/questions/306867/can-defaults-write-command-line-configure-the-menu-bar-on-macos
