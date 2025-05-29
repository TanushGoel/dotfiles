#!/bin/bash

CUR_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )
ICONS_DIR="$CUR_DIR/ico"

change_icon() {
    APP_PATH=$1
    APP_ICON_PATH=$2
    CUSTOM_ICON=$3

    if [ -d "$APP_PATH" ]; then
        sudo cp "$ICONS_DIR/$CUSTOM_ICON" "$APP_PATH/$APP_ICON_PATH"
        sudo touch "$APP_PATH"
    else 
        echo "Icon change failed for $APP_PATH"
    fi
}

change_icon "/Applications/kitty.app" "/Contents/Resources/kitty.icns" "kitty.ico"
change_icon "/Applications/Cursor.app" "/Contents/Resources/Cursor.icns" "code.ico"
change_icon "/Applications/Tor Browser.app" "/Contents/Resources/firefox.icns" "tor.ico"
change_icon "/Applications/Obsidian.app" "/Contents/Resources/icon.icns" "obsidian.ico"
change_icon "/Applications/Spotify.app" "/Contents/Resources/Icon.icns" "spotify.ico"
change_icon "/Applications/Discord.app" "/Contents/Resources/electron.icns" "discord.ico"

change_icon "/Applications/Microsoft Word.app" "/Contents/Resources/MSWD.icns" "word.icns"
change_icon "/Applications/Microsoft Excel.app" "/Contents/Resources/XCEL.icns" "excel.icns"

# change_icon "/System/Applications/Preview.app" "/Contents/Resources/AppIcon.icns" "preview.ico"

defaults write company.thebrowser.Browser currentAppIconName hologram # flutedGlass

# delete icon cache and restart dock
rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock 

sketchybar --reload
