#!/usr/bin/env bash
set -euo pipefail

has_font() {
  local font_name="$1"
  fc-list : family | grep -qi "$font_name"
}

need_noto=false
need_firacode_nerd=false

if has_font "Noto Sans CJK SC"; then
  echo "[skip] Noto Sans CJK SC already installed"
else
  need_noto=true
fi

if has_font "FiraCode Nerd Font Mono"; then
  echo "[skip] FiraCode Nerd Font Mono already installed"
else
  need_firacode_nerd=true
fi

# fontawsome
if has_font "Font Awesome 7 Free"; then
  echo "[skip] Font Awesome 7 Free already installed"
else
  need_font_awesome=true
fi

if [[ "$need_noto" == false && "$need_firacode_nerd" == false ]]; then
  echo "All required fonts are already installed."
  exit 0
fi

if [[ "$need_noto" == true ]]; then
  echo "Installing Noto CJK fonts via apt..."
  sudo apt-get update
  sudo apt-get install -y --no-install-recommends fonts-noto-cjk fonts-noto-cjk-extra
fi

if [[ "$need_firacode_nerd" == true ]]; then
  echo "Installing FiraCode Nerd Font Mono to user font directory..."
  FONT_DIR="${HOME}/.local/share/fonts"
  TMP_DIR="$(mktemp -d)"
  mkdir -p "$FONT_DIR"
  curl -fsSL -o "$TMP_DIR/FiraCode.zip" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
  unzip -oq "$TMP_DIR/FiraCode.zip" -d "$TMP_DIR/FiraCode"
  find "$TMP_DIR/FiraCode" -type f -name "*NerdFontMono*.ttf" -exec cp {} "$FONT_DIR/" \;
  rm -rf "$TMP_DIR"
fi

if [[ "$need_font_awesome" == true ]]; then
  echo "Installing Font Awesome 7 Free to user font directory..."
  FONT_DIR="${HOME}/.local/share/fonts"
  TMP_DIR="$(mktemp -d)"
  mkdir -p "$FONT_DIR"
  curl -fsSL -o "$TMP_DIR/FontAwesome.zip" "https://use.fontawesome.com/releases/v7.2.0/fontawesome-free-7.2.0-desktop.zip"
  unzip -oq "$TMP_DIR/FontAwesome.zip" -d "$TMP_DIR/FontAwesome"
  # fontawesome-free-7.2.0-desktop/otfs/*.otf
  find "$TMP_DIR/FontAwesome/fontawesome-free-7.2.0-desktop/otfs" -type f -name "*.otf" -exec cp {} "$FONT_DIR/" \;
  rm -rf "$TMP_DIR"
fi


fc-cache -f

if has_font "Noto Sans CJK SC"; then
  echo "[ok] Noto Sans CJK SC is available"
else
  echo "[warn] Noto Sans CJK SC still not found"
fi

if has_font "FiraCode Nerd Font Mono"; then
  echo "[ok] FiraCode Nerd Font Mono is available"
else
  echo "[warn] FiraCode Nerd Font Mono still not found"
fi

if has_font "Font Awesome 7 Free"; then
  echo "[ok] Font Awesome 7 Free is available"
else
  echo "[warn] Font Awesome 7 Free still not found"
fi
