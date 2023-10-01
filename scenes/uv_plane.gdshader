shader_type spatial;

void fragment() {
	ALBEDO = vec3(UV.x - 0.5, UV.y - 0.5, 0);
}
