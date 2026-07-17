#!/bin/bash
# 1. Get the name of the active media player (e.g., vlc, firefox, spotify)
PLAYER=$(playerctl -l | head -n 1)

if [ -n "$PLAYER" ]; then
  # 2. Search for the window ID associated with the media player
  # (Searching by class or name depending on how your system identifies it)
  WINDOW_ID=$(kdotool search --class "$PLAYER" 2>/dev/null)

  # Fallback: search by name if class fails
  if [ -z "$WINDOW_ID" ]; then
    WINDOW_ID=$(kdotool search --name "$PLAYER" 2>/dev/null)
  fi

  # 3. Activate/Focus the window if found
  if [ -n "$WINDOW_ID" ]; then
    kdotool windowactivate --sync "$WINDOW_ID"
  else
    echo "Could not find a visible window for $PLAYER"
  fi
else
  echo "No active media players found."
fi
