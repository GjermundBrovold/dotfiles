#!/bin/bash

# Script to update the dotfiles from my different systems in this repo.

## Common
common() {
  echo "Common"
  ### .zshrc todo find a cleaner way to handle this
  # cp ~/.zshrc ./
  ### .bsahrc todo find a cleaner way to handle this
  # cp ~/.bashrc ./
  ### .zathura
  cp ~/.config/zathura/zathurarc ./
  ### ghostty
  cp ~/.config/ghostty/config.ghostty ./
  ### tmux
  cp ~/.tmux.conf ./
}

## macOS
macos() {
  echo "macOS"
  ### .aerospace
  cp ~/.config/aerospace/aerospace.toml ./
}

## Linux
linux() {
  echo "linux"
  ### i3
  ### wayland
  cp -r ~/.config/hypr/ ./hypr
}

## Windows (who gives a shit)

## Leftout
### nvim (own repo)

main() {
  echo "Updating .dotfiles..."
  echo "Updating common"
  common

  echo "updating system specific"

  if [ "$(uname)" == "Darwin" ]; then
    echo "Darwin"
    macos
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "linux"
    linux
  else
    echo "No supp for your system"
  fi

  echo "Done :)"

}

main
