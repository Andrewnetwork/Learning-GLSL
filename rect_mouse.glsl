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
	if(st.x<mouse_thresh.x+padding && st.x>mouse_thresh.x-padding &&
	   st.y<mouse_thresh.y+padding && st.y>mouse_thresh.y-padding){
		gl_FragColor = vec4(st.x,st.y,0,1.0);
	}
	else{
		gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
	}
}
