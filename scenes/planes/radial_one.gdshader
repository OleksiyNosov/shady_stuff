shader_type spatial;

uniform sampler2D noise;

vec3 to_color(float value) {
	return vec3(value, value, value);
}

// #ffffff - White
const vec3 white = vec3(1.0, 1.0, 1.0);
// #0056B9 - Strong azure
const vec3 strong_azure = vec3(0, 0.337, 0.725);
const vec3 dark_blue = vec3(0, 0.235, 0.5);

vec2 make_centered(vec2 coordinates) {
	return vec2(coordinates.x - 0.5, coordinates.y - 0.5);
}

void fragment() {
	// Shifting 0,0 coordinates to center 
	vec2 centered_uv = make_centered(UV);
	// Distance from center
	float circle_inverted_dot = sqrt(pow(centered_uv.x, 2) + pow(centered_uv.y, 2));
	float distnace_from_center = circle_inverted_dot;
	
	// Distance to center
	float circle_dot = max(0.0, (1.0 - distnace_from_center));
	
	float circle_inverted = step(0.5, circle_inverted_dot);
	float circle = circle_inverted * -1.0 + 1.0;
	
//	float rotation_degrees = sin(TIME - sin(distnace_from_center * 1.5));
	float rotation_degrees = sin(distnace_from_center) * 10.0 - TIME / 3.0;
	mat2 rotation_matrix = mat2(
        vec2(cos(rotation_degrees), -sin(rotation_degrees)),
        vec2(sin(rotation_degrees), cos(rotation_degrees)));
	
	vec2 rotated_uv = rotation_matrix * centered_uv;
	
	float value = texture(noise, make_centered(rotated_uv)).x -pow(circle_dot / 1.5, 2.0) / 4.0 - 0.5;
	ALBEDO = mix(strong_azure, white, value) * circle;
}
