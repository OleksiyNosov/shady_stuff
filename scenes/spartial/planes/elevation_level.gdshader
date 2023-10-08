shader_type spatial;

const vec3 C_RED = vec3(1, 0, 0); 
const vec3 C_GREEN = vec3(0, 1, 0); 
const vec3 C_BLUE = vec3(0, 0, 1); 

uniform sampler2D noise;

void vertex() {
	VERTEX.y = texture(noise, UV).y / 4.0;
}

vec3 colormap_elevation(float elevation) {
	return float(elevation < 0.5) * mix(C_BLUE, C_GREEN, elevation * 2.0)
		+ float(elevation >= 0.5) * mix(C_GREEN, C_RED, elevation * 2.0 - 1.0);
}

void fragment() {
	float elevation = texture(noise, UV).r;

	ALBEDO = colormap_elevation(elevation);
}
