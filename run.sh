#/bin/bash bash

#Maybe not always install as SU?
#sudo su

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