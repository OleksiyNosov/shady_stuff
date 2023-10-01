shader_type spatial;

const vec3 red = vec3(1, 0, 0);
const vec3 orange = vec3(1, 0.647, 0);
const vec3 yellow = vec3(1, 1, 0);
const vec3 green = vec3(0, 0.502, 0);
const vec3 blue = vec3(0, 0, 1);
const vec3 indigo = vec3(0.294, 0, 0.51);
const vec3 violet = vec3(0.933, 0.51, 0.933);

const vec3 colors[] = {
	red,
	orange,
	yellow,
	green,
	blue,
	indigo,
	violet
};

void fragment() {
	int index = int(TIME) % colors.length();
	ALBEDO = colors[index];
	ROUGHNESS = 0.2;
	RIM = 0.1;
}
