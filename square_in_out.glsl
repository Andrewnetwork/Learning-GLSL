#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
	vec2 st 		  = gl_FragCoord.xy/u_resolution;
	vec2 mouse_thresh = u_mouse/u_resolution;
	float padding 	  = .10;
    //float sp = clamp(sin(u_time),0.01,.499);
    float sp = abs(sin(u_time)*0.49);
	if(st.x<1.0-sp && st.x>sp && st.y < 1.0-sp && st.y > sp){
		gl_FragColor = vec4(0.0,0.0,0,1.0);
	}
	else{
		gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
	}
}
