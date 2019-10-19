#!/usr/bin/env bash

if [ ! -f "tmp.tres" ]; then # avoid overriding previously cached tmp ( after failed script )
	cp /home/creikey/.config/godot/editor_settings-3.tres tmp.tres
fi

mkdir -p exports/web
rm -r exports/web
mkdir exports/web
godot-headless --path src --export web "$(readlink -f ./exports/web/index.html)"
if [ "$?" == "0" ]; then
	butler -i ~/.config/itch/creikey push exports/web creikey/pixel-floater:web 
fi

mv tmp.tres /home/creikey/.config/godot/editor_settings-3.tres
