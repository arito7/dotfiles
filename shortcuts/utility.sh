#!/bin/bash

focus_on_window_by_id() {
  $HOME/Applications/kdotool windowactivate $1
}

get_window_id_by_app_name() {
  app_name="$1"
  window=$($HOME/Applications/kdotool search --name $1)
  app_launch_command="$2"

  if [[ -z "$window" ]]; then
    # launch command here
    "$app_launch_command"
    window=$HOME/Applications/kdotool search --name "$appname"
    kdotool windowstate --add MAXIMIZED "$window"
  else
    focus_on_window_by_id "$window"
  fi
}
