shader_type spatial;

uniform sampler2D noise;

void vertex() {
	float height = texture(noise, VERTEX.xz / 2.0 + 0.5).x / 4.0;
	VERTEX.y += height;
}

void fragment() {
	// Place fragment code here.
}
