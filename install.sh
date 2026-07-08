#!/bin/bash

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/dotfiles_old"

# List of files/folders to link: "source_in_repo:target_in_home"
# Customize this list to match your repository structure
files=(
  "bashrc:.bashrc"
<<<<<<< HEAD
  "inputrc:.inputrc"
  # "zshrc:.zshrc"
=======
>>>>>>> 73f86af37f9f49199c88a98038f281f5895f148f
  "nvim:.config/nvim"
  "tmux.conf:.config/tmux/tmux.conf"
)

echo "Starting dotfiles symlinking..."

for pair in "${files[@]}"; do
  # Split the pair by the colon
  repo_file="${pair%%:*}"
  home_file="${pair#*:}"

  src="$DOTFILES_DIR/$repo_file"
  dst="$HOME/$home_file"

  # Create target parent directory if it doesn't exist (e.g., .config/)
  mkdir -p "$(dirname "$dst")"

  # Case 1: Destination is already a symlink pointing to the right place
  if [ -L "$dst" ] && [ "$(readlink "$dst")" == "$src" ]; then
    echo "✅ Already linked: $home_file"
    continue
  fi

  # Case 2: Destination exists (file/dir/broken link) but isn't our symlink
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    echo "⚠️ Found existing file at $home_file. Moving to backup..."
    mkdir -p "$BACKUP_DIR"
    mv "$dst" "$BACKUP_DIR/"
  fi

  # Case 3: Create the symlink
  ln -s "$src" "$dst"
  echo "🔗 Linked: $home_file -> $repo_file"
done

echo "🎉 Dotfiles installation complete!"
