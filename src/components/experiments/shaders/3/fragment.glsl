  precision mediump float;

  varying float vRandom;
  varying float vPosition;

  void main() {
    gl_FragColor = vec4(vRandom * smoothstep(0.0, 0.5, vPosition), 0.0, 1.0 * vRandom, 1.0);
  }
