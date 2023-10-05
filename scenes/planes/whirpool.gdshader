shader_type spatial;

#include "res://shaders/includes/rotations.gdshaderinc"
#include "res://shaders/includes/utils.gdshaderinc"

uniform sampler2D noise;

void fragment() {
	vec2 centered_uv = make_centered(UV);
	float distance_from_center = to_circle(centered_uv);
	float inverted_distance_from_center = invert_value(distance_from_center, 0.0, 1.0);
	
	float speed = TIME * 1.0;
	float rotation_degrees = TIME + mix(0.0, 0.005, pow(inverted_distance_from_center, 2)) * speed;
	vec2 rotating_uv = make_clockwise_rotation(centered_uv, rotation_degrees);
	vec2 base_uv = UV;
	
	ALBEDO = texture(noise, rotating_uv).rgb;
}
