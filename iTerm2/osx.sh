#!/bin/sh

cd "$(dirname "$0")"

echo "  Installing iTerm2 Colors."

killall cfprefsd

/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Hilbert Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Merge 'hilbert-solarized.dark.itermcolors' :'Custom Color Presets':'Hilbert Solarized Dark'" ~/Library/Preferences/com.googlecode.iterm2.plist

