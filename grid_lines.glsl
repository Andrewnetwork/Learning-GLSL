#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec4 board_frag(float x, float y,float size){
    if(mod(ceil(y*size),2.0)-mod(floor(x*size),2.0) == 0.0 ){
        return vec4(cos(u_time*10.0*(1.0-y)),0,y,1.0);
    }else{
        return vec4(cos(u_time*10.0*(1.0-x)), 1.0, 1.0, 1.0);
    }
}
void main() {
	vec2 st      = gl_FragCoord.xy/u_resolution;
	gl_FragColor = board_frag(st.x,st.y,cos(u_time)*10.0+15.0);
}
