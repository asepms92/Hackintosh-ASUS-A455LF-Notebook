#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo -e "Installing BatteryHDAPM Daemon to /usr/local/bin"

sudo mkdir -p /usr/local/bin
sudo chmod -R 755 /usr/local/bin

sudo cp $DIR/BatteryHDAPM /usr/local/bin/
sudo chmod 755 /usr/local/bin/BatteryHDAPM
sudo chown root:wheel /usr/local/bin/BatteryHDAPM
sudo xattr -d com.apple.quarantine /usr/local/bin/BatteryHDAPM 2>/dev/null

sudo cp $DIR/org.qwerty12.BatteryHDAPM.plist /Library/LaunchDaemons/
sudo chmod 644 /Library/LaunchDaemons/org.qwerty12.BatteryHDAPM.plist
sudo chown root:wheel /Library/LaunchDaemons/org.qwerty12.BatteryHDAPM.plist
sudo xattr -d com.apple.quarantine /Library/LaunchDaemons/org.qwerty12.BatteryHDAPM.plist 2>/dev/null

sudo launchctl load /Library/LaunchDaemons/org.qwerty12.BatteryHDAPM.plist

echo -e "BatteryHDAPM is installed and loaded. Enjoy!"

exit 0
