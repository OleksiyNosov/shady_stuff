vec3 to_color(float value) {
	return vec3(value, value, value);
}

vec2 make_centered(vec2 coordinates) {
	return vec2(coordinates.x - 0.5, coordinates.y - 0.5);
}

float to_circle(vec2 coordinates) {
	return sqrt(pow(coordinates.x, 2) + pow(coordinates.y, 2));
}

mat2 make_rotation(float rotation_degrees) {
	return mat2(
		vec2(cos(rotation_degrees), -sin(rotation_degrees)),
		vec2(sin(rotation_degrees), cos(rotation_degrees))
	);
}

float invert_value(float value, float min_value, float max_value) {
	return max(min_value, (max_value - value));
}