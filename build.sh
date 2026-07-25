#!/bin/sh
set -e

APP=com.anthropic.Claude
FLATHUB=https://flathub.org/repo/flathub.flatpakrepo

if command -v flatpak-builder >/dev/null 2>&1; then
  BUILDER="flatpak-builder"
else
  BUILDER="flatpak run org.flatpak.Builder"
fi

flatpak remote-add --user --if-not-exists flathub "$FLATHUB"

$BUILDER --force-clean --disable-rofiles-fuse --user --install --install-deps-from=flathub \
  --repo=repo build-dir "$APP.yaml"

time flatpak build-bundle --runtime-repo="$FLATHUB" \
    repo "$APP.flatpak" "$APP"


