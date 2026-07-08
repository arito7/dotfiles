#!/bin/bash
appname="youtube"

window=$($HOME/Applications/kdotool search --name $appname)

if [[ -z "$window" ]]; then
  # launch command here
  ghostty
  window=$HOME/Applications/kdotool search --name $appname
  kdotool windowstate --add MAXIMIZED $window
else
  $HOME/Applications/kdotool windowactivate $window
fi
