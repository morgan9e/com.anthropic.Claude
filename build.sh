#!/bin/sh
set -e

if command -v flatpak-builder >/dev/null 2>&1; then
  BUILDER="flatpak-builder"
else
  BUILDER="flatpak run org.flatpak.Builder"
fi

flatpak remote-add --user --if-not-exists \
  flathub https://flathub.org/repo/flathub.flatpakrepo
  
$BUILDER --force-clean --user --install-deps-from=flathub \
  --repo=repo build-dir com.anthropic.Claude.yaml

flatpak build-bundle --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo \
  repo com.anthropic.Claude.flatpak com.anthropic.Claude
