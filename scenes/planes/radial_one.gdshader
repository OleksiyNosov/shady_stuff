shader_type spatial;

uniform sampler2D noise;

vec3 to_color(float value) {
	return vec3(value, value, value);
}

// #0056B9 - Strong azure
const vec3 albedo_blue_rgb = vec3(0, 0.337, 0.725);

void fragment() {
	// SHifting 0,0 coordinates to center 
	vec2 centered_uv = vec2(UV.x - 0.5, UV.y - 0.5) * 2.0;
	// Distance from center
	float circle_inverted_dot = sqrt(pow(centered_uv.x, 2) + pow(centered_uv.y, 2));
	float distnace_from_center = circle_inverted_dot;
	float circle_inverted = step(1, circle_inverted_dot);
	float circle = circle_inverted * -1.0 + 1.0;
	
	ALBEDO = texture(noise, UV).rgb * albedo_blue_rgb * circle;
}
