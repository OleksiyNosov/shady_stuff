shader_type spatial;

vec3 palette(float time, vec3 a, vec3 b, vec3 c, vec3 d) {
	return a + b * cos(6.28318 * (c * time + d));
}

vec3 rainbow(float time) {
	return palette(time,
		vec3(0.5),
		vec3(0.5),
		vec3(1.0),
		vec3(0.0, 0.33, 0.67)
	);
}

void fragment() {
	vec2 base_uv = vec2(UV);
//	vec2 centered_uv = (base_uv - 0.5) * 2.0;
	vec2 centered_uv = (base_uv - 0.5) * 2.0;
	vec2 centered_fract_uv = fract((base_uv * 2.0 - 0.5) * 2.0) * 2.0 - 1.0;
//	float v_len = sqrt(pow(centered_uv.x, 2) + pow(centered_uv.y, 2));
//	float v_len = abs(length(centered_uv) - 0.5);
	vec3 color = rainbow(length(centered_uv) + TIME / 1.5);
	float scale = 4.0;
	float v_len = sin(length(centered_fract_uv) * scale + TIME) / scale;
//	float circle = smoothstep(0.55, 0.5, v_len) - smsqrtoothstep(0.45, 0.4, v_len);
//	float circle = 0.02 / smoothstep(0.09, 0.05, v_len);
	float circle = 0.02 / abs(v_len);
	float sharper_circle = smoothstep(0.04, 1, circle);
//	vec3 color = vec3(0.1, 0.9, 0.1);
	vec3 result = sharper_circle * color;
	ALBEDO = result;
}
