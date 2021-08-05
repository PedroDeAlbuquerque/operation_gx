varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_distortion;
uniform float u_screen_flash;

uniform float u_chromatic_aberration;

#define TEX2D(c) pow(abs(texture2D(gm_BaseTexture, (c))), vec4(inputGamma))          
float PI = 3.141592653589;
float inputGamma = 2.4;
float outputGamma = 2.8;

vec2 overscan = vec2(0.99, 0.99);
float cornersize = 0.03;
float cornersmooth = 80.0;
     
float corner(vec2 coord)
{
    coord = (coord - vec2(0.5)) * overscan + vec2(0.5);
    coord = min(coord, vec2(1.0)-coord);
    vec2 cdist = vec2(cornersize);
    coord = (cdist - min(coord,cdist));
    float dist = sqrt(dot(coord,coord));
    return clamp((cdist.x-dist)*cornersmooth,0.0, 1.0);
}

vec2 radial_distortion(vec2 coord)
{
    vec2 cc = coord - 0.5;
    float dist = dot(cc, cc) * u_distortion;
    return (coord + cc * (1.0 + dist) * dist);
}
    
void main()
{	
	// Distorted texture and it's corner
	vec2 distorted_texture = radial_distortion(v_vTexcoord);
	float corner_value = corner(distorted_texture);
	
	// Base color with distorted texture
	vec4 base_color = texture2D(gm_BaseTexture, distorted_texture);
	
	// Color aberration
	if (u_chromatic_aberration != 0.0) {
		vec2 abr_dist =(distorted_texture - 0.5) * u_chromatic_aberration;
		base_color.rgb = base_color.rgb * vec3(0.5, 0.5, 0.33) + 
		texture2D(gm_BaseTexture, distorted_texture + abr_dist).rgb * vec3(0.5, 0.0, 0.33) +
		texture2D(gm_BaseTexture, distorted_texture - abr_dist).rgb * vec3(0.0, 0.5, 0.33);
	}
	
	// Handle dark and white flash logic
	bool screen_flash_is_dark = false;
	float dark_screen_flash = -u_screen_flash;
	if (u_screen_flash < 0.0) { // Check if screen flash is negative for dark flash implementation
		screen_flash_is_dark = true;
	}
	if (!screen_flash_is_dark) {
		base_color.rgb = mix(base_color.rgb, vec3(1), u_screen_flash); // Add flash effect if screen flash value is higher than 0
	} else {
		base_color.rgb = mix(base_color.rgb, vec3(0), dark_screen_flash); // Use dark flash if flash mix is negative
	}
		
	// Add black frame with corner
	base_color.xyz = pow(abs(base_color.xyz), vec3(1.0)) * vec3(corner_value);
	
	gl_FragColor = base_color;
}