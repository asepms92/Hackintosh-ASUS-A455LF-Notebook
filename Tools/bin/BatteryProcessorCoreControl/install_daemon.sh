#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

echo -e "Installing BatteryProcessorCoreControl Daemon to /usr/local/bin"

sudo mkdir -p /usr/local/bin
sudo chmod -R 755 /usr/local/bin

sudo cp $DIR/BatteryProcessorCoreControl /usr/local/bin/
sudo chmod 755 /usr/local/bin/BatteryProcessorCoreControl
sudo chown root:wheel /usr/local/bin/BatteryProcessorCoreControl
sudo xattr -d com.apple.quarantine /usr/local/bin/BatteryProcessorCoreControl 2>/dev/null

sudo cp $DIR/org.qwerty12.BatteryProcessorCoreControl.plist /Library/LaunchDaemons/
sudo chmod 644 /Library/LaunchDaemons/org.qwerty12.BatteryProcessorCoreControl.plist
sudo chown root:wheel /Library/LaunchDaemons/org.qwerty12.BatteryProcessorCoreControl.plist
sudo xattr -d com.apple.quarantine /Library/LaunchDaemons/org.qwerty12.BatteryProcessorCoreControl.plist 2>/dev/null

sudo launchctl load /Library/LaunchDaemons/org.qwerty12.BatteryProcessorCoreControl.plist

echo -e "BatteryProcessorCoreControl is installed and loaded. Enjoy!"

exit 0
