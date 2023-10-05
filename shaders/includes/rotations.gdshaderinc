mat2 make_rotation_matrix(float rotation_degrees) {
	return mat2(
		vec2(cos(rotation_degrees), -sin(rotation_degrees)),
		vec2(sin(rotation_degrees), cos(rotation_degrees))
	);
}

vec2 make_clockwise_rotation(vec2 coordinates, float rotation_degrees) {
	return coordinates * make_rotation_matrix(rotation_degrees);
}

vec2 make_counter_clockwise_rotation(vec2 coordinates, float rotation_degrees) {
	return make_clockwise_rotation(coordinates, rotation_degrees * -1.0);
}

