shader_type canvas_item;

uniform vec4 color_arriba : source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform vec4 color_abajo : source_color = vec4(0.6, 0.0, 1.0, 1.0);

uniform float altura_texto = 20.0;

varying float posicion_y;

void vertex() {
	posicion_y = VERTEX.y;
}

void fragment() {
	vec4 tex = texture(TEXTURE, UV);

	float mezcla = clamp(posicion_y / altura_texto, 0.0, 1.0);

	vec4 color = mix(color_arriba, color_abajo, mezcla);

	COLOR = vec4(color.rgb, tex.a * COLOR.a);
}