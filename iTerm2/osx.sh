#!/bin/sh

cd "$(dirname "$0")"

echo "  Installing iTerm2 Colors."

killall cfprefsd

# Custom 'Solarized Dark' Theme
/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Hilbert Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Merge 'hilbert-solarized.dark.itermcolors' :'Custom Color Presets':'Hilbert Solarized Dark'" ~/Library/Preferences/com.googlecode.iterm2.plist

# Standard 'Solarized Dark' Theme
/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Merge 'Solarized Dark.itermcolors' :'Custom Color Presets':'Solarized Dark'" ~/Library/Preferences/com.googlecode.iterm2.plist

# Standard 'Solarized Light' Theme
/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Solarized Light' dict" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Merge 'Solarized Light.itermcolors' :'Custom Color Presets':'Solarized Light'" ~/Library/Preferences/com.googlecode.iterm2.plist