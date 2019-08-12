#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

bool board(float x, float y,float size){
    return mod(floor(y*size),2.0) == 0.0 ^^ 
		   mod(floor(x*size),2.0) == 0.0;
    //return x<0.1 || x<0.3&&x>0.2 || x<0.5&&x>0.4 ;
}
void main() {
	vec2 st 		  = gl_FragCoord.xy/u_resolution;
	if(board(st.x,st.y,abs(sin(u_time)*70.0)+10.0)){
		gl_FragColor = vec4(0.0,0.0,0,1.0);
	}
	else{
		gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);
	}
}
