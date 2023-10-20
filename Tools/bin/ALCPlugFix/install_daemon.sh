#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo -e "Installing ALCPlugFix Daemon to /usr/local/bin"

sudo mkdir -p /usr/local/bin
sudo chmod -R 755 /usr/local/bin

sudo cp $DIR/alc-verb /usr/local/bin/
sudo chmod 755 /usr/local/bin/alc-verb
sudo chown root:wheel /usr/local/bin/alc-verb
sudo xattr -d com.apple.quarantine /usr/local/bin/alc-verb 2>/dev/null

sudo cp $DIR/ALCPlugFix /usr/local/bin/
sudo chmod 755 /usr/local/bin/ALCPlugFix
sudo chown root:wheel /usr/local/bin/ALCPlugFix
sudo xattr -d com.apple.quarantine /usr/local/bin/ALCPlugFix 2>/dev/null

sudo cp $DIR/hda-verb /usr/local/bin/
sudo chmod 755 /usr/local/bin/hda-verb
sudo chown root:wheel /usr/local/bin/hda-verb
sudo xattr -d com.apple.quarantine /usr/local/bin/hda-verb 2>/dev/null

sudo cp $DIR/good.win.ALCPlugFix.plist /Library/LaunchAgents/
sudo chmod 644 /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo chown root:wheel /Library/LaunchAgents/good.win.ALCPlugFix.plist
sudo xattr -d com.apple.quarantine /Library/LaunchAgents/good.win.ALCPlugFix.plist 2>/dev/null

sudo launchctl load /Library/LaunchAgents/good.win.ALCPlugFix.plist

echo -e "ALCPlugFix is installed and loaded. Enjoy!"

exit 0
