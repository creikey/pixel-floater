#!/usr/bin/env bash

set -e

if [ ! -f "tmp.tres" ]; then # avoid overriding previously cached tmp ( after failed script )
	cp /home/creikey/.config/godot/editor_settings-3.tres tmp.tres
fi

mkdir -p exports/web
rm -r exports/web
mkdir exports/web
godot-headless --path src --export web "$(readlink -f ./exports/web/index.html)"
butler push exports/web lajollagamesclub/pixel-floater:web 

mv tmp.tres /home/creikey/.config/godot/editor_settings-3.tres
