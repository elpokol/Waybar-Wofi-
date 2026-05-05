#!/bin/bash

CONFIG="/tmp/cava_waybar_config"
cat > "$CONFIG" << 'END'
[general]
bars = 10
framerate = 30
autosens = 1

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 8
END

cava -p "$CONFIG" | while read -r line; do
    out=$(echo "$line" | sed 's/0/▁/g; s/1/▂/g; s/2/▃/g; s/3/▄/g; s/4/▅/g; s/5/▆/g; s/6/▇/g; s/7/█/g; s/8/█/g')
    echo "{\"text\": \"$out\", \"class\": \"cava\"}"
done
