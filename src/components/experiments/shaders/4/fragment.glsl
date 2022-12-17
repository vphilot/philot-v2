precision mediump float;

varying vec3 vPosition;
varying float vTime;

void main() {
  float r = 0.5 - mix(0.1, 1.0, vPosition.x) * sin(vTime);
  float g = 0.5 - mix(0.1, 1.0, vPosition.y);
  float b = 0.5 - mix(0.1, 1.0, vPosition.z);
  gl_FragColor = vec4(r, g, b, 1.0);
}
