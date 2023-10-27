shader_type spatial;

void fragment() {
	vec2 base_uv = vec2(UV.x, UV.y);
	vec2 centered_uv = (base_uv - 0.5) * 2.0;
//	float v_len = sqrt(pow(centered_uv.x, 2) + pow(centered_uv.y, 2));
//	float v_len = abs(length(centered_uv) - 0.5);
	float scale = 11.0;
	float v_len = sin(length(centered_uv) * scale + TIME) / scale;
//	float circle = smoothstep(0.55, 0.5, v_len) - smsqrtoothstep(0.45, 0.4, v_len);
//	float circle = 0.02 / smoothstep(0.09, 0.05, v_len);
	float circle = 0.02 / abs(v_len);
	vec3 color = vec3(0.1, 0.9, 0.1);
	ALBEDO = circle * color;
}
