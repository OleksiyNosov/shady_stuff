shader_type spatial;

uniform vec4 albedo : source_color;
uniform sampler2D texture_albedo : 
	source_color,
	filter_linear_mipmap,
	repeat_enable;

uniform vec2 tiling = vec2(1.0, 1.0);
uniform vec2 offset;

void vertex() {
	UV = UV * tiling - offset * TIME;
}

void fragment() {
	vec4 albedo_uv = texture(texture_albedo, UV);
	ALBEDO = albedo.rgb * albedo_uv.rgb;
}
