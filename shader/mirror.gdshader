// Uplink Project
// GNU Affero General Public License v3.0 © 2022 atlasinthevoid

// Code snippets from https://github.com/19PHOBOSS98/Godot-MirrorInstance
// MIT License © 2020 19PHOBOSS98

shader_type spatial;
render_mode unshaded;

uniform sampler2D refl_tx;

void fragment() {
	ALBEDO = texture(refl_tx, vec2(1.0 - SCREEN_UV.x, SCREEN_UV.y)).rgb;
}
