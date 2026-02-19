#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required. Install from https://brew.sh"
  exit 1
fi

brew tap homebrew/cask-fonts >/dev/null 2>&1 || true
brew install --cask font-noto-sans-cjk-sc font-fira-code-nerd-font

echo "Fonts installed. Re-run CV compile command."
