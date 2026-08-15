#!/usr/bin/env bash

DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
FONT_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/fonts/Maple"
mkdir -p "$FONT_DIR"

podman build -t maple-font "$DIR"
podman run --rm -v "$FONT_DIR:/app/fonts" -e BUILD_ARGS="--normal" maple-font

fc-cache -f
