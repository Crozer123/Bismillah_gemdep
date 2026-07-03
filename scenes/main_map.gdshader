shader_type canvas_item;

uniform vec4 warna_air : source_color = vec4(0.1, 0.5, 0.8, 0.9); 
uniform vec2 kecepatan_aliran = vec2(0.0, 0.5); 

// Skala X dinaikkan menjadi 4.0 agar riak/ombaknya terlihat lebih banyak berjajar di kiri-kanan
uniform vec2 skala_tekstur = vec2(4.0, 15.0);   
uniform float kekuatan_gelombang = 0.05;

void fragment() {
    vec2 uv_dasar = UV * skala_tekstur;
    
    // UV Distortion
    uv_dasar.x += sin(uv_dasar.y * 3.0 + TIME) * kekuatan_gelombang;
    
    // BEST PRACTICE: Memaksa UV agar selalu berputar (loop) dari 0.0 ke 1.0
    vec2 pergeseran = fract(uv_dasar + (kecepatan_aliran * TIME));
    
    float pola_air = texture(TEXTURE, pergeseran).r;
    
    COLOR = warna_air;
    COLOR.rgb *= mix(0.85, 1.15, pola_air); 
}