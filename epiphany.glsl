#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec3 colorA = vec3(0.0,0.0,0.0);
vec3 colorB = vec3(1.0,1.0,1.0);

float tanh(float x){
    return 1.0/(exp(2.0*x)-1.0)/(exp(2.0*x)+1.0);
}
void main() {
    vec3 color = vec3(0.0);

    float pct = tanh(abs(cos(u_time)));

    // Mix uses pct (a value from 0-1) to
    // mix the two colors
    color = mix(colorA, colorB, pct);

    gl_FragColor = vec4(color,1.0);
}
