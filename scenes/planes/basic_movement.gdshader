shader_type spatial;

#include "res://scenes/movement.gdshaderinc"
#include "res://scenes/filters.gdshaderinc"
#include "res://scenes/utils.gdshaderinc"

uniform sampler2D noise;

void fragment() {
	float point = to_circle(make_centered(UV));
	float speed = TIME / 10.0 + pow(point, 4);
	
	vec2 base_uv = 
		top_left_section_filter(UV) * (move_up(UV, speed) + move_left(UV, speed))
		+ top_right_section_filter(UV) * (move_up(UV, speed) + move_right(UV, speed))
		+ down_left_section_filter(UV) * (move_down(UV, speed) + move_left(UV, speed))
		+ down_right_section_filter(UV) * (move_down(UV, speed) + move_right(UV, speed));
	
	ALBEDO = texture(noise, base_uv / 2.0).rgb;
}
