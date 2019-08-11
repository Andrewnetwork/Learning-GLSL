// Hacked from: https://github.com/nopjia/glsl-sandbox-progs/blob/master/game-of-life.glsl
#ifdef GL_ES
precision highp float;
#endif

// ============
// = CONTROLS =
// ============


// Inverts color scheme. Default color scheme is white for live, black for dead.
// #define INVERT_COLOR

// Compatability mode for amathematicalway's 2D CA
// #define COMPAT_MODE

// Set this to true then false to reset field to random.
const bool randomize = true;

// The most significant 16 bits of the rule
const float rule_msh = 10.0;

// The least significan 16 bits of the rule
const float rule_lsh = 0.0;


// ========
// = CODE =
// ========

uniform vec2 u_mouse;
uniform vec2 u_resolution;
uniform sampler2D backbuffer;

vec2 uv, pos;

float process_color(float i){
	#ifdef INVERT_COLOR
	return -i + 1.;
	#else
	return i; 
	#endif
}

int access(int x, int y){
	vec2 coord = uv+vec2(float(x),float(y))/u_resolution.xy;
	return (coord==clamp(coord,0.,1.))?int(process_color(texture2D(backbuffer, coord).a) > 0.0):0;
}

float rule_bit(int bit){
	float rule = (bit >= 16) ? rule_msh : rule_lsh;
	if(bit >= 16) bit -= 16;

	for(int i = 0; i < 16; i++){
		if(i == bit) break;
		rule = floor(rule / 2.);
	}
	
	return mod(rule, 2.);
}

float gameStep() {
	int b0=access(0,0);
	int b1=access(0,1);
	int b2=access(1,0);
	int b3=access(0,-1);
	int b4=access(-1,0);
	#ifdef COMPAT_MODE
	int t=b0;b0=b1;b1=b4;b4=t;t=b2;b2=b3;b3=t;
	#endif
	return rule_bit(b4*16 + b3*8 + b2*4 + b1*2 + b0);
}

float rand(){
    return clamp((fract(sin(dot(pos.xy*9.0 + u_mouse,vec2(12.9898,78.233))) * 43758.5453)-0.5)*100.0,0.,1.);
}

void main( void ) {
  uv = ( gl_FragCoord.xy / u_resolution.xy );
  pos = (uv-0.5);
  pos.x *= u_resolution.x/u_resolution.y;
  gl_FragColor = vec4(randomize ? rand() : process_color(gameStep()));
}