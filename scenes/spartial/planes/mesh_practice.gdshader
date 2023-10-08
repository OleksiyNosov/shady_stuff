shader_type spatial;

uniform float height_scale = 0.5;

uniform sampler2D noise;
uniform sampler2D normalmap;

varying vec2 texture_position;

void vertex() {
	texture_position = VERTEX.xz / 2.0 + 0.5;
	float height = texture(noise, texture_position).x;
	VERTEX.y += height * height_scale;
}

void fragment() {
	NORMAL_MAP = texture(normalmap, texture_position).xyz;
}
