shader_type spatial;

#include "res://shaders/includes/colors.gdshaderinc"

void fragment() {
	ALBEDO = STRONG_AZURE;
	ALPHA = 0.6;
	ROUGHNESS = 0.7;
	RIM = 0.2;
	METALLIC = 0.5;
}
