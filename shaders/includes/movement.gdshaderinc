vec2 move_up(vec2 coords, float value) {
	return vec2(coords.x, coords.y + value);
}

vec2 move_down(vec2 coords, float value) {
	return vec2(coords.x, coords.y - value);
}

vec2 move_left(vec2 coords, float value) {
	return vec2(coords.x + value, coords.y);
}

vec2 move_right(vec2 coords, float value) {
	return vec2(coords.x - value, coords.y);
}