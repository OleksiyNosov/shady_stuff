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

void vertex() {
	VERTEX.x = VERTEX.x * 5.0;
	VERTEX.y += sin(TIME + VERTEX.x * 2.0) / 4.0 + VERTEX.x * 0.15;
}

vec3 rainbow_color(float time) {
	float time_remaning = time - float(int(time));
	
	int index_curr = int(time) % colors.length();
	int index_next = (index_curr + 1) % colors.length();
	
	vec3 color_curr = colors[index_curr];
	vec3 color_next = colors[index_next];
	
	float limit_cut = 0.1;
	float timer = smoothstep(limit_cut, 1.0 - limit_cut, time_remaning);
	
	vec3 color = mix(color_curr, color_next, timer);
	
	return color;
}

void fragment() {
	float speed = 1.0;
	
	float time = TIME * speed;
	vec3 color = rainbow_color(time + VERTEX.x); 
	
	ALBEDO = color;
	ROUGHNESS = 0.2;
	RIM = 0.1;
}
