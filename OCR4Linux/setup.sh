#!/bin/bash
# ========================================================================================================================
# Author:
#     Mohamed Hussein Al-Adawy
# Version: 1.2.0
# Description:
#     This setup script installs and configures OCR4Linux and its dependencies.
#     It handles the installation of:
#       1. System requirements (tesseract, python packages)
#       2. Session-specific tools:
#          - Wayland: grimblast, wl-clipboard, cliphist, rofi-wayland
#          - X11: xclip, scrot, rofi
#
# Features:
#     - Automatic detection and installation of AUR helper (paru)
#     - Session-aware installation (Wayland/X11)
#     - Configures necessary Python dependencies
#     - Sets up required OCR language packs
#
# Requirements:
#     - Arch Linux or Arch-based distribution
#     - Internet connection for package downloads
#     - sudo privileges for package installation
#
# Usage:
#     chmod +x setup.sh
#     ./setup.sh
#     Follow the prompts to install dependencies
# ========================================================================================================================
# Define the required packages.
sys_requirements=(
  tesseract
  tesseract-data-eng
  tesseract-data-ara
  python
  python-numpy
  python-pillow
  python-pytesseract
  python-opencv
)
wayland_session_apps=(
  grimblast-git
  wl-clipboard
  cliphist
  rofi-wayland
)
x11_session_apps=(
  xclip
  scrot
  rofi
)
# Check if paru is installed.
check_paru() {
  if ! command -v paru &>/dev/null; then
    read -r -p "paru is not installed. Do you want to install paru? (y/n): " choice
    if [ "$choice" = "y" ]; then
      sudo pacman -S --needed --noconfirm git base-devel
      git clone https://aur.archlinux.org/paru.git
      cd paru || exit
      makepkg -si --noconfirm
    else
      echo "Please install paru first!"
      return 1
    fi
  fi
}
# Install the required packages.
install_requirements() {
  paru -S --noconfirm --needed "${sys_requirements[@]}"
  if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    paru -S --noconfirm --needed "${wayland_session_apps[@]}"
  else
    paru -S --noconfirm --needed "${x11_session_apps[@]}"
  fi
}
# Main function.
main() {
  check_paru
  install_requirements
  # Copy the script to the user's home directory.
  mkdir -p "$HOME/.config/OCR4Linux"
  cp -r ./* "$HOME/.config/OCR4Linux"
}
main
