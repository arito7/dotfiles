#!/bin/bash
appname="logseq"

window=$($HOME/Applications/kdotool search --name $appname)

if [[ -z "$window" ]]; then
  # launch command here
  /home/yt/Applications/Logseq-linux-x64-0.10.15.AppImage
  window=$HOME/Applications/kdotool search --name $appname
  kdotool windowstate --add MAXIMIZED $window
else
  $HOME/Applications/kdotool windowactivate $window
fi
