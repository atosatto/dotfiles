#!/bin/bash
#
# AndroidStudio
#

set -e

if [ -f "/Applications/Android Studio.app/Contents/Info.plist" ]; then
	echo "  Fixing the Java configuration in AndroidStudio."
	/usr/libexec/PlistBuddy -c "Set :'JVMOptions':'JVMVersion' 1.8.*" "/Applications/Android Studio.app/Contents/Info.plist"
fi
