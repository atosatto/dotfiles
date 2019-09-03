#!/usr/bin/env bash

set -e
source "scripts/functions.sh"

title "Setup iTerm2"

basepath="$(dirname $0)"
cd "$basepath" || exit

info "Configuring the iTerm2 colors"

killall cfprefsd || true

# Custom 'Solarized Dark' Theme
/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Hilbert Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist || true
/usr/libexec/PlistBuddy -c "Merge 'hilbert-solarized.dark.itermcolors' :'Custom Color Presets':'Hilbert Solarized Dark'" ~/Library/Preferences/com.googlecode.iterm2.plist || true

# Standard 'Solarized Dark' Theme
/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iterm2.plist || true
/usr/libexec/PlistBuddy -c "Merge 'Solarized Dark.itermcolors' :'Custom Color Presets':'Solarized Dark'" ~/Library/Preferences/com.googlecode.iterm2.plist || true

# Standard 'Solarized Light' Theme
/usr/libexec/PlistBuddy -c "Add :'Custom Color Presets':'Solarized Light' dict" ~/Library/Preferences/com.googlecode.iterm2.plist || true
/usr/libexec/PlistBuddy -c "Merge 'Solarized Light.itermcolors' :'Custom Color Presets':'Solarized Light'" ~/Library/Preferences/com.googlecode.iterm2.plist || true

info "Configuring the iTerm2 preferences"

# Reuse previous session's directory
/usr/libexec/PlistBuddy -c "Delete :'New Bookmarks':0:'Custom Directory'" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Add :'New Bookmarks':0:'Custom Directory' string" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Custom Directory' 'Recycle'" ~/Library/Preferences/com.googlecode.iterm2.plist

warn "Re-open iTerm2 to apply the new settings"
