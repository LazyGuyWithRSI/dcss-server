#!/bin/bash

if [ ! -d "$DGL_CONF_HOME" ] || [ -z "$(ls -A "$DGL_CONF_HOME")" ]; then
    mkdir -p "$DGL_CONF_HOME"
    cp -rp /usr/src/dgamelaunch-config/. "$DGL_CONF_HOME"
    git config --global --add safe.directory "$DGL_CONF_HOME"
fi

"$SCRIPTS"/entrypoint.sh
