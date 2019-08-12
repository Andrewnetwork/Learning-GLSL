// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);
    float p1 = 1.0;
    float p12 = 0.2;
    float p2 = 1.0;
    float p22 = 0.2;
    
    vec2 bl = smoothstep(vec2(0.1),vec2(abs(sin(u_time*p1)))+p12,st);       
    vec2 tr = smoothstep(vec2(0.1),vec2(abs(sin(u_time*p2)))+p22,1.0-st); 
    color = vec3(bl.x * bl.y * tr.x * tr.y);

    gl_FragColor = vec4(color,1.0);
}
