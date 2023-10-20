#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo -e "Installing IOPowerManagement Daemon to /usr/local/bin"

sudo mkdir -p /usr/local/bin
sudo chmod -R 755 /usr/local/bin

sudo cp $DIR/IOPowerManagement /usr/local/bin/
sudo chmod 755 /usr/local/bin/IOPowerManagement
sudo chown root:wheel /usr/local/bin/IOPowerManagement
sudo xattr -d com.apple.quarantine /usr/local/bin/IOPowerManagement 2>/dev/null

sudo cp $DIR/com.syscl.iopm.plist /Library/LaunchDaemons/
sudo chmod 644 /Library/LaunchDaemons/com.syscl.iopm.plist
sudo chown root:wheel /Library/LaunchDaemons/com.syscl.iopm.plist
sudo xattr -d com.apple.quarantine /Library/LaunchDaemons/com.syscl.iopm.plist 2>/dev/null

sudo launchctl load /Library/LaunchDaemons/com.syscl.iopm.plist

echo -e "IOPowerManagement is installed and loaded. Enjoy!"

exit 0
