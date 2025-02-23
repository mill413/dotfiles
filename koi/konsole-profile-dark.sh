#!/usr/bin/bash
PROFILE="Dark"

for instance in $(qdbus6 | grep org.kde.konsole); do
    for session in $(qdbus6 "$instance" | grep -E '^/Sessions/'); do
        qdbus6 "$instance" "$session" org.kde.konsole.Session.setProfile "$PROFILE"
    done
done

kwriteconfig6 --file ~/.config/konsolerc --group "Desktop Entry" --key DefaultProfile "$PROFILE.profile"
# konsoleprofile "colors=KlassyDark"
