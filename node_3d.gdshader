shader_type spatial;

void vertex() {
	VERTEX.x = VERTEX.x * 5.0;
	VERTEX.y += sin(TIME + VERTEX.x * 2.0) / 4.0;
}

void fragment() {
	// #0056B9 - Strong azure
	vec3 albedo_blue_rgb = vec3(0, 0.337, 0.725);
	// #FFD800 - Yellow
	vec3 albedo_yellow_rgb = vec3(1, 0.847, 0);
	
	if (UV.y < 0.5) {
		ALBEDO = albedo_blue_rgb;
	} else {
		ALBEDO = albedo_yellow_rgb;
	}
	
	ROUGHNESS = 0.2;
	RIM = 0.1;
}
