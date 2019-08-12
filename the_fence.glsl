#ifdef GL_ES
precision mediump float;
#endif
#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


// Plot a line on Y using a value between 0.0-1.0
float plot(vec2 st, float pct){
  return  smoothstep( pct-0.05, pct, st.y)- 
          smoothstep( pct, pct+0.05, st.y);
}
float plot2(vec2 st, float pct){
  return  step(pct - 0.01, st.y) - step(pct + 0.01, st.y); 
}


void main() {
	vec2 st = gl_FragCoord.xy/u_resolution;

    //float y = abs(cos(st.x*(PI*u_time)))/abs(log(st.x*(PI*u_time)));
    //float y = cos(st.x*PI);
    float y = st.x;
    


    vec3 color = vec3(y);

    // Plot a line
    float pct = plot2(st,y);
    color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);

	gl_FragColor = vec4(color,1.0);
}