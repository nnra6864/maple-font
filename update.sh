#!/usr/bin/env bash

DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

OLD_HEAD=$(git -C "$DIR" rev-parse HEAD)
git -C "$DIR" pull
NEW_HEAD=$(git -C "$DIR" rev-parse HEAD)

if [ "$OLD_HEAD" = "$NEW_HEAD" ]; then
    exit 0
fi

echo "Updating..."
"$(DIR)"/build.sh
