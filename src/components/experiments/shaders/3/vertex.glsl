uniform mat4 projectionMatrix;
  uniform mat4 viewMatrix;
  uniform mat4 modelMatrix;

  attribute vec3 position;
  attribute float aRandom;

  varying float vRandom;
  varying float vPosition;

  float test(float a, float b) {
    float c = 1.0;
    float d = 2.0;

    return a + b + c + d;
  }

  void main() {
    vec3 foo = vec3(0.0);
    vec3 bar = vec3(1.0, 2.0, 3.0);
    bar.z = 4.2;

    vec3 purpleColor = vec3(0.0);
    purpleColor.r = 0.5;
    purpleColor.b = 1.0;

    vec2 two = vec2(1.0, 2.0);
    vec3 three = vec3(two, 3.0);

    vec3 myVec3 = vec3(1.0, 2.0, 3.0);
    vec2 myVec2 = myVec3.xz;

    // xyzw,rgba
    vec4 myVec4 = vec4(1.0, 2.0, 3.0, 4.0);
    float doubleyou = myVec4.w;

    float result = test(1.0 , 2.0);

    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    modelPosition.z += aRandom * 0.1;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    vRandom = aRandom;
    vPosition = position.y;
  }
