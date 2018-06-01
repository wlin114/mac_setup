#/bin/bash bash
echo ****Installing xcode start****
xcode-select --install

echo ****Installing brew start****
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo ****Updating brew start****
brew update
echo ****Install openssl****
brew install openssl
brew link openssl --force
echo ****Updating install java google-chrome vlc video player****
brew cask install java google-chrome vlc
echo ****Install Sublime****
brew cask install sublime-text
echo ****Install Android Studio****
brew cask install android-studio***
echo ***Google Drive ****
brew cask install google-drive
echo *** Install Virtual Box ****
brew cask install virtualbox;
echo ** Install Flux ****
brew cask install flux
echo *** Install 1Password ****
brew cask install 1password
echo *** Install Slack ****
brew cask install slack


which = $(which pip)
echo ${which}

echo ****update pip start****
pip install --upgrade pip

echo ****update pip finish****

echo ****install awscli start****
sudo -H  pip install awscli --upgrade --ignore-installed six
echo ****install awscli finish****

echo ****ability to view unknown file format on mac previrew****
echo ****See https://github.com/whomwah/qlstephen****
brew cask install qlstephen
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


