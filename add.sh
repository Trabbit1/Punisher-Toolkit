#!/bin/bash

# ----------------------------
# Move and Rename Module Script
# ----------------------------

# Colors
green="\e[32m"
yellow="\e[1;33m"
red="\e[38;5;196m"
reset="\e[0m"

# Banner
echo -e "${yellow}[*] MOVE SCRIPT FOR PUNISHER MODULES${reset}"

# Ask for file to move
read -rp "Enter path to your module file (e.g., example.sh or example.py): " src

# Check file exists
if [[ ! -f "$src" ]]; then
    echo -e "${red}[-] File not found: $src${reset}"
    exit 1
fi

# Get extension and check valid type
ext="${src##*.}"
if [[ "$ext" != "sh" && "$ext" != "py" ]]; then
    echo -e "${red}[-] Only .sh or .py files are allowed.${reset}"
    exit 1
fi

# Ask for new module name
read -rp "Enter new module name (folder name): " modname

# Destination path
destdir="modules/$modname"
destfile="base.$ext"
destpath="$destdir/$destfile"

# Check and create directory
mkdir -p "$destdir"

# Move and rename
mv "$src" "$destpath"
chmod +x "$destpath"

echo -e "${green}[✓] Moved '$src' to '$destpath'${reset}"
