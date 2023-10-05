float top_left_section_filter(vec2 uv) {
	return float(uv.x < 0.5 && uv.y < 0.5);
}

float top_right_section_filter(vec2 uv) {
	return float(uv.x > 0.5 && uv.y < 0.5);
}

float down_left_section_filter(vec2 uv) {
	return float(uv.x < 0.5 && uv.y > 0.5);
}

float down_right_section_filter(vec2 uv) {
	return float(uv.x > 0.5 && uv.y > 0.5);
}