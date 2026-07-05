#!/bin/sh
set -e

UA='Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36'
REDIRECT='https://claude.ai/api/desktop/linux/x64/deb/latest/redirect'

URL=$(curl -s -A "$UA" -o /dev/null -w '%{redirect_url}' "$REDIRECT")
echo "latest: $URL"

curl -sL -A "$UA" -o claude.deb "$URL"
SHA=$(sha256sum claude.deb | cut -d' ' -f1)
echo "sha256: $SHA"

sed -i \
  -e "s|url: https://downloads.claude.ai/.*|url: $URL|" \
  -e "s|sha256: .*|sha256: $SHA|" \
  com.anthropic.Claude.yaml

echo "updated com.anthropic.Claude.yaml"
