shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform vec3 damage_color: source_color = vec3(1);
uniform float progress: hint_range(0.0,1.0,0.1) = 0;

void fragment() {
	float current_a = texture(TEXTURE, UV).a;
	vec4 target_color = mix(texture(TEXTURE, UV),vec4(damage_color, current_a),progress);
	COLOR = target_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
