shader_type canvas_item;

void fragment() {
	vec4 pixel_color = texture(TEXTURE, UV + vec2(0.5));
	COLOR = pixel_color;
}
