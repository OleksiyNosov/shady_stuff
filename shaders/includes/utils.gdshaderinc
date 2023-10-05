vec3 to_color(float value) {
	return vec3(value, value, value);
}

vec2 make_centered(vec2 coordinates) {
	return vec2(coordinates.x - 0.5, coordinates.y - 0.5);
}

float to_circle(vec2 coordinates) {
	return sqrt(pow(coordinates.x, 2) + pow(coordinates.y, 2));
}

float invert_value(float value, float min_value, float max_value) {
	return max(min_value, (max_value - value));
}