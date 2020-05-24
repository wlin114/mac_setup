#/bin/bash bash

################CONFIGUTATION START########################
brew=(
  awscli
  cheat
  gnu-sed
  gpg
  openssl
  python
  vim
  wget
  node
  swiftlint
  cocoapods
  cask
)

cask=(
  google-chrome
  google-backup-and-sync  
  iterm2
  java
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlstephen
  quicklook-json
  slack
  sublime-text
)

extra_cask=(
  postman
  charles
  neteasemusic
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
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo ****Updating brew start****
brew update

echo **** install ${brew[@]} ****
for i in "${brew[@]}"; do
  brew install $i
done

echo **** install ${cask[@]} ****
for i in "${cask[@]}"; do
  brew cask install $i
done

echo **** install iOS sim ****
npm install -g ios-sim

echo ****Install Oh My ZSH****
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo ****changing theme ****
echo **** see https://github.com/agnoster/agnoster-zsh-theme****
sed -i 's/ZSH_THEME="[a-zA-Z]*"/ZSH_THEME="agnoster"/g' zsh

echo **** adding alias ****

echo "alias git-log=\"git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)'\"" >> ~/.zshrc
echo "alias git-log-all=\"git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset) —all\'\"" >> ~/.zshrc
echo "alias git-delete-merged=\"git fetch && git remote prune origin && git branch --merged | egrep -v '(^\*|master|dev)' | xargs git branch -d\"" >> ~/.zshrc
source ~/.zshrc

echo ****Install Font ****
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
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


echo **** Show file extention ****
defaults write com.apple.finder AppleShowAllFiles TRUE; 

echo ****  Don\'t write DS_Store file on USB and network drive ****
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo ****faster cursor****
defaults write NSGlobalDomain KeyRepeat -int 1

echo ****Change screenshot location****
defaults write com.apple.screencapture location ~/Desktop/screenshots
defaults write com.apple.menuextra.battery ShowPercent YES


echo "Cleanup"
brew cleanup

killall SystemUIServer
killall Dock
killall Finder
#https://apple.stackexchange.com/questions/306867/can-defaults-write-command-line-configure-the-menu-bar-on-macos
#hello
