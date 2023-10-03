	shader_type spatial;

float to_fration(float number) {
	return number - float(int(number));
}

float horizonta_wave(vec2 uv, float lines_count) {
	float scaled_uv_y = uv.y * lines_count;

	float speed = 0.1;
	float direction = -1.0;
	float time_modifier = to_fration(TIME * speed * direction);

	float intensity = to_fration(scaled_uv_y + time_modifier + 1.0);
	
	return intensity;
}

void fragment() {
	float intensity = horizonta_wave(UV, 32);
	
	intensity = step(0.8, intensity);
	vec3 albedo_blue_rgb = vec3(0, 0.337, 0.725);
	vec3 color = albedo_blue_rgb * intensity + sin(TIME) / 60.0;
	ALBEDO = color;
	
	RIM = 0.1;
}
