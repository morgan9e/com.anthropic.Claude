#!/bin/sh
set -e

if [ ! -s /etc/machine-id ]; then
  dbus-uuidgen --ensure=/etc/machine-id
fi
mkdir -p /var/lib/dbus
ln -sf /etc/machine-id /var/lib/dbus/machine-id

if command -v flatpak-builder >/dev/null 2>&1; then
  BUILDER="flatpak-builder"
else
  BUILDER="flatpak run org.flatpak.Builder"
fi

flatpak remote-add --user --if-not-exists \
  flathub https://flathub.org/repo/flathub.flatpakrepo
            if [ ! -s /etc/machine-id ]; then
            dbus-uuidgen --ensure=/etc/machine-id
          fi
          mkdir -p /var/lib/dbus
          ln -sf /etc/machine-id /var/lib/dbus/machine-id

  
$BUILDER --force-clean --disable-rofiles-fuse --user --install-deps-from=flathub \
  --repo=repo build-dir com.anthropic.Claude.yaml

flatpak build-bundle --runtime-repo=https://flathub.org/repo/flathub.flatpakrepo \
  repo com.anthropic.Claude.flatpak com.anthropic.Claude
