shader_type spatial;

#include "res://scenes/colors.gdshaderinc"
#include "res://scenes/utils.gdshaderinc"

uniform sampler2D noise;

void fragment() {
	// Shifting 0,0 coordinates to center
	vec2 centered_uv = make_centered(UV);
	
	// Distance from center
	float circle_inverted_dot = to_circle(centered_uv);
	float distnace_from_center = circle_inverted_dot;
	
	// Distance to center
	float circle_dot = invert_value(distnace_from_center, 0, 1);
	
	float circle_inverted = step(0.5, circle_inverted_dot);
	float circle = invert_value(circle_inverted, 0.0, 1.0); 
	
	// float rotation_degrees = sin(TIME - sin(distnace_from_center * 1.5));
	float rotation_degrees = sin(distnace_from_center) * 10.0 - TIME / 3.0;
	mat2 rotation_matrix = make_rotation(rotation_degrees);
	
	vec2 rotated_uv = rotation_matrix * centered_uv;
	
	float value = texture(noise, make_centered(rotated_uv)).x -pow(circle_dot / 1.5, 2.0) / 4.0 - 0.5;
	ALBEDO = mix(STRONG_AZURE, WHITE, value) * circle;
}
