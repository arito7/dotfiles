#!/bin/bash
appname="thunderbird"

window=$($HOME/Applications/kdotool search --name $appname)

if [[ -z "$window" ]]; then
  # launch command here
  thunderbird
  window=$HOME/Applications/kdotool search --name $appname
  kdotool windowstate --add MAXIMIZED $window
else
  $HOME/Applications/kdotool windowactivate $window
fi
