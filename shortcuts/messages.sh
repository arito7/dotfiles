#!/bin/bash
# Your commands go here
# notify-send "Launching Messages"
appname="messages"

active=$($HOME/Applications/kdotool search --name $appname)

if [[ -z "$active" ]]; then
  # launch command here
  /snap/bin/chromium --profile-directory=Default --app-id=hpfldicfbfomlpcikngkocigghgafkph || echo "failed to launch messages"
else
  # $HOME/Applications/kdotool search --name $appname windowactivate
  $HOME/Applications/kdotool windowactivate $active
fi
