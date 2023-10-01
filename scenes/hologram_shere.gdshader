	shader_type spatial;

float to_fration(float number) {
	return number - float(int(number));
}

void fragment() {
	float lines_count = 8.0;
	float scaled_uv_y = UV.y * lines_count;
	
	float speed = 0.1;
	float direction = -1.0;
	float time_modifier = to_fration(TIME * speed * direction);
	
	float intensity = to_fration(scaled_uv_y + time_modifier + 1.0);
		
	vec3 color = vec3(intensity, intensity, intensity);
	ALBEDO = color;
	
	RIM = 0.1;
}
