// Author @patriciogv - 2015
// http://patriciogonzalezvivo.com

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec3 rect(vec2 loc, vec2 top, vec2 magnitude, vec3 color){
    if(loc.x > top.x && loc.x < top.x+magnitude.x &&
        loc.y > top.y && loc.y < top.y+magnitude.y){
        return color;
    }else{
        return vec3(1.0);
    }
}
void main(){
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    vec3 v1 = rect(st,vec2(0.06,0.7),vec2(0.02,0.4),vec3(0.0));
    vec3 v2 = rect(st,vec2(0.15,0.0),vec2(0.02,1.0),vec3(0.0));
    vec3 v3 = rect(st,vec2(0.80,0.0),vec2(0.02,1.0),vec3(0.0));
    vec3 v4 = rect(st,vec2(0.95,0.0),vec2(0.02,1.0),vec3(0.0));

    vec3 h1 = rect(st,vec2(0.0,0.85),vec2(1.0,0.02),vec3(0.0));
    vec3 h2 = rect(st,vec2(0.0,0.7),vec2(1.0,0.02),vec3(0.0));
    vec3 h3 = rect(st,vec2(0.15,0.06),vec2(1.0,0.02),vec3(0.0));
    
    vec3 c1 = rect(st,vec2(0.0,0.7),vec2(0.15,0.3),vec3(0.9608, 0.1843, 0.1569));
    vec3 c2 = rect(st,vec2(0.96,0.7),vec2(0.15,0.3),vec3(1.0, 0.851, 0.0));
    vec3 c3 = rect(st,vec2(0.8,0),vec2(0.4,0.06),vec3(0.1373, 0.2588, 0.9412));
    vec3 c4 = rect(st,vec2(0,0),vec2(1),vec3(0.9647, 0.9843, 0.651));

    color = c1*c2*c3*c4*v1*v2*v3*v4*h1*h2*h3;

    gl_FragColor = vec4(color,1.0);
}
